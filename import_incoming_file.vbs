
'---------------------- PROGRAMMER LOG ---------------------------------------
'**Description: To run automatic data import for MFA Exchange Rate
'**Created    : Chuah Hong Guan, 21 April 2016
'**Change 01  : 

'---------------------- ADODB Constants ---------------------------------------
Const adLockOptimistic	= 3
Const adCmdText			= &H0001
Const adStateClosed		= &H00000000
Const adStateOpen		= &H00000001
'---------------------- WEB SERVER Constants ----------------------------------
Dim AppFolder,SERVER_NAME,SERVER_PORT
AppFolder				= ""
SERVER_NAME				= ""
SERVER_PORT				= "80"
'---------------------- GET SCRIPT ARGUMENTS ----------------------------------
Dim DisplayStatus,i
Dim ImportCoID
DisplayStatus = false
ImportCoID = ""
if WScript.Arguments.Count>0 then
	for i=0 to WScript.Arguments.Count-1
	    select case trim(lcase(WScript.Arguments.Item(i)))
	        case "-status" 
	            DisplayStatus = true
	        case else
				if IsNumeric(trim(lcase(WScript.Arguments.Item(i)))) then
					ImportCoID = trim(lcase(WScript.Arguments.Item(i)))
				else
					WScript.Echo "Usage: " & vbTab & vbTab & WScript.ScriptName & " [arguments...]"
					WScript.Echo
					WScript.Echo "Arguments:"
					WScript.Echo "-status" & vbTab & vbTab & "Display Run Status"
					WScript.Echo "[CoID]" & vbTab & vbTab & "Import [CoID] file only"
					WScript.Quit
				end if
	    end select
	next
end if
'---------------------- GET Application Keys ----------------------------------
Dim Application   ' Create a variable.
Set Application = CreateObject("Scripting.Dictionary")
GetAppKey()
Sub GetAppKey()
    Dim AppKeyValues,i,equalpos,str,key,value
    AppKeyValues = GetScriptValue("GetAppKey","")

    if AppKeyValues<>"" then
        AppKeyValues = split(AppKeyValues,vbNewLine)
        for i=0 to ubound(AppKeyValues)
            str = AppKeyValues(i)
            equalpos=InStr(1,str,"=")
			if equalpos>0 then
				key = Trim(Left(str,equalpos-1))
				value = Trim(Mid(str,equalpos+1))
				if IsNumeric(value) then 
					value=Cint(value)			''set integer
				elseif InStr(1,key,"Array")>0 then
					value = split(value,",")	''set array
				end if

				''assign to dictionary
				Application.Add key, value
			end if
        next
         SERVER_NAME = Application("ServerName")
	    SERVER_PORT = Application("ServerPort")
    end if    
End Sub
Function GetScriptValue(byval FunctionName, byval ArgumentArray)
	Dim CommandFilePath,WshShell,oExec,ExecError,ExecResult,CommandLine,i
	GetScriptValue=""
    if AppFolder="" then
        Dim FolderArr
        FolderArr = split(WScript.ScriptFullName,"\")
        for i=0 to UBound(FolderArr)
            if Left(FolderArr(i),1)="_" then
                exit for
            else
		        AppFolder = AppFolder & FolderArr(i) & "\"
            end if
        next        
	end if
    
    Dim n,ArgumentList
    ArgumentList = ""
    if IsArray(ArgumentArray) then
        for n=0 to UBound(ArgumentArray)            
            if IsNull(ArgumentArray(n)) then
                ArgumentArray(n) = Escape("<NULL>")
            else
                ArgumentArray(n) = Escape(ArgumentArray(n))
            end if
            ArgumentList = ArgumentList & " arg" & (n+1) & ":" & ArgumentArray(n)
        next
    elseif ArgumentArray<>"" then
        ArgumentList = ArgumentList & " arg1:" & Escape(ArgumentArray)
    end if

	CommandFilePath = AppFolder & "_ScheduledTasks\Common\common.vbs"
	CommandLine = "cscript """ & CommandFilePath & """ //Nologo function:" & FunctionName & ArgumentList
    
    Set WshShell = CreateObject("WScript.Shell")	
	set oExec = WshShell.Exec(CommandLine)	
    
	do while oExec.Status = 0 ''application still running
		WScript.Sleep 100
	loop

	ExecError=""
	If Not(oExec.StdOut.AtEndOfStream) Then
          ExecResult = oExec.StdOut.ReadAll
	End If

	If Not(oExec.StdErr.AtEndOfStream) Then
          ExecError = oExec.StdErr.ReadAll
	End If
	
	''read file and return file content	
	if ExecError<>"" then
		ProcessStatus ExecError
	elseif ExecResult<>"" then
		GetScriptValue = Left(ExecResult,Len(ExecResult)-2)	
	end if
	set oExec = nothing
	set WshShell = nothing
    
End Function
Dim RunLogID
RunLogID = RunLog(WScript.ScriptName,"Started...",0,null,false)
'---------------------- OPEN Connection Here ----------------------------------
dim systemdb
set systemdb = CreateObject("ADODB.Connection")
systemdb.cursorLocation = 3
systemdb.Open(Application("SystemConnectionStr"))
systemdb.BeginTrans
'---------------------- DECLARATION -------------------------------------------
Dim CurrCoID
'---------------------- INCLUDE FILE Functions ---------------------------------
'**handling session keys
Function Session(byval Key)
	select case lcase(Key)
		case "coid"
			Session = CurrCoID
		case else
			Session = ""
	end select
End Function

'**<!-- #include file="StrEncode.inc"	-->
Function StrEncode (byval InStr, byval EncodeType)
	On Error Resume Next
	if IsNull(InStr) then
		StrEncode = ""
	else
		if IsArray(InStr)=false then StrEncode = trim(InStr)
		Dim EscapeChar,UnescapeChar,i
		select case UCase(EncodeType)
			case "SQL"
				EscapeChar = Array("'")
				UnescapeChar = Array("''")
				if TypeName(InStr)="IStringList" then
					Dim n,tmpstr
					StrEncode=""
					if InStr.Count=1 then
						StrEncode= StrEncode(InStr.Item(1),"SQL")
					else
						for n=1 to InStr.Count
							tmpstr = InStr.Item(n)
							for i=0 to UBound(EscapeChar)
								tmpstr = replace(tmpstr,EscapeChar(i),UnescapeChar(i))
							next
							StrEncode = StrEncode & "'" & tmpstr & "'"
							if n<>InStr.Count then StrEncode = StrEncode & ","
						next
					end if
				elseif IsArray(Instr) then
					for n=0 to UBound(InStr)
						tmpstr = InStr(n)
						for i=0 to UBound(EscapeChar)
							tmpstr = replace(tmpstr,EscapeChar(i),UnescapeChar(i))
						next
						StrEncode = StrEncode & "'" & tmpstr & "'"
						if n<>UBound(InStr) then StrEncode = StrEncode & ","
					next
				else	
					for i=0 to UBound(EscapeChar)
						StrEncode = replace(StrEncode,EscapeChar(i),UnescapeChar(i))
					next
				end if
			case "SQLLIKE"
				StrEncode = SQLEncode(InStr)
				EscapeChar = Array("[","%","_")
				UnescapeChar = Array("[[]","[%]","[_]")
				for i=0 to UBound(EscapeChar)
					StrEncode = replace(StrEncode,EscapeChar(i),UnescapeChar(i))
				next	
			case "HTML"
				StrEncode = HTMLEncode(StrEncode)							
			case "PREHTML"
				StrEncode = HTMLEncode(StrEncode)
				EscapeChar = Array(vbNewLine,Chr(10),"  ")
				UnescapeChar = Array("<br>","<br>"," &nbsp;")
				for i=0 to UBound(EscapeChar)
					StrEncode = replace(StrEncode,EscapeChar(i),UnescapeChar(i))
				next				
			case "URL"
				StrEncode = URLEncode(StrEncode)
			case "JAVAH"	''javascript in html tag
				StrEncode =StrEncode(StrEncode,"HTML")
				StrEncode =StrEncode(StrEncode,"JAVA")
			case "JAVA","JAVAW"
				EscapeChar = Array("\","'","""",vbNewLine,Chr(10))
				if UCase(EncodeType)="JAVA" then
					UnescapeChar = Array("\\","\'","\""","\n","\n")
				else
					UnescapeChar = Array("\\\\","\\\'","\\\""","\\\n","\\\n")
				end if
				for i=0 to UBound(EscapeChar)
					StrEncode = replace(StrEncode,EscapeChar(i),UnescapeChar(i))
				next
			case "FILE"
				EscapeChar = Array("\","/",":","?","""","<",">","|")
				UnescapeChar = Array("_","_","_","_","_","_","_","_")
				for i=0 to UBound(EscapeChar)
					StrEncode = replace(StrEncode,EscapeChar(i),UnescapeChar(i))
				next
			case "FIELD"
				StrEncode = replace(URLEncode(StrEncode),"%","_")
				StrEncode = replace(StrEncode,"+","_")
		end select	
		
	end if
	if Err.Description<>"" then StrEncode=Err.Description
End Function
Function SQLEncode(byval InStr)
	SQLEncode = StrEncode(Instr,"SQL")
End Function
Function HTMLEncode(byval InStr)
	Dim EscapeChar,UnescapeChar,i
	HTMLEncode = InStr
	EscapeChar = Array("&","<",">","""")
	UnescapeChar = Array("&amp;","&lt;","&gt;","&quot;")
	for i=0 to UBound(EscapeChar)
		HTMLEncode = replace(HTMLEncode,EscapeChar(i),UnescapeChar(i))
	next				
End Function
Function URLEncode(byval InStr)
	Dim EscapeChar,UnescapeChar,i
	URLEncode = InStr
	EscapeChar = Array("%"," ","&","=","?","/")
	UnescapeChar = Array("%25","%20","%26","%3d","%3f","%2f")
	for i=0 to UBound(EscapeChar)
		URLEncode = replace(URLEncode,EscapeChar(i),UnescapeChar(i))
	next				
End Function
Function LongDate (byval InDate)
	LongDate = ReturnLongDate(InDate,false)
End Function
Function ReturnLongDate (byval InDate,byval Translated)
''*********************************************************************************	
''Assume: InDate is in 'dd/mm/yyyy' format or date type
''*********************************************************************************	
	dim dateArr
	
	ReturnLongDate=""
	if IsNull(InDate) then
		ReturnLongDate = ""
	elseif InDate="" then
		ReturnLongDate = ""
	else
		if TypeName(InDate)="Date"  or TypeName(InDate)="Field" then
			dateArr = Array (Day(InDate),Month(InDate),Year(InDate))
		else
			dateArr = Split(InDate,"/")
		end if
		
		if UBound(dateArr)=2 then
			ReturnLongDate = String(2-len(dateArr(0)),"0") & dateArr(0) & " " & ReturnMonthName(dateArr(1),Translated) & " " & dateArr(2)
		else
			ReturnLongDate=InDate
		end if
	end if
End Function
Function ReturnMonthName(byval InMonth,byval Translated)
	Dim MonthArr
	MonthArr = Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
	if Cint(InMonth)>12 then
		ReturnMonthName = MonthArr(0)
	else
		ReturnMonthName = MonthArr(Cint(InMonth)-1)
	end if
	if Translated then ReturnMonthName=Translate(ReturnMonthName)
End Function
'**<!-- #include file="LongDate.inc"	-->
'**<!-- #include file="ShortDate.inc"	-->
'**<!-- #include file="RoundArith.inc"	-->
'**<!-- #include file="audit_log.inc"	-->
'**<!-- #include file="translate.inc"	-->
'**<!-- #include file="system_script.asp"-->
'**<!-- #include file="file_functions.asp"-->
'**<!-- #include file="import_scripts.asp"-->
'---------------------- RUN SCRIPT ---------------------------------------------
Dim RunResult,ErrorMsg,NoFile,NonErrorMsg
RunResult = "Successful"

ProcessStatus "START..."
Call RunScript()
if ErrorMsg<>"" then
	if NoFile then
		'RunLogID = RunLog(WScript.ScriptName,RunResult & vbNewline & ErrorMsg,0,RunLogID)
		RunLogID = RunLog(WScript.ScriptName,RunResult & vbNewline & "Error: " & ErrorMsg,1,RunLogID,true)
	else
		RunLogID = RunLog(WScript.ScriptName,RunResult & vbNewline & "Error: " & ErrorMsg,1,RunLogID,true)
	end if
elseif NonErrorMsg<>"" then
	RunLogID = RunLog(WScript.ScriptName,RunResult & vbNewline & "Message: " & NonErrorMsg,0,RunLogID,true)	
else
	RunLogID = RunLog(WScript.ScriptName,RunResult,0,RunLogID,true)
end if	
	
ProcessStatus "COMPLETED!"
'---------------------- PROCEDURES LIST ----------------------------------------
Dim fso,TotalFile,ImportFolderPath,ImportFolder,TotalFileImported
Dim RuntimeError
Sub RunScript()
	TotalFile = 0
	TotalFileImported = ImportFTPFile(ImportCoID)
    NoFile=false

	RunResult = "Total Files Imported: "  & TotalFileImported & " out of " & TotalFile & " file(s)"	
	ProcessStatus RunResult
	if TotalFile=0 then
		if ErrorMsg<>"" then
			ProcessStatus "Error: " & ErrorMsg
		end if
		if RuntimeError<>"" then
			ProcessStatus RuntimeError
		end if
	else
		'ErrorMsg=""
	end if
End Sub
Sub DeleteFileOnly(byval FilePath) ''chooi teng
	Dim fso
	set fso = CreateObject("Scripting.FileSystemObject")
	if fso.FileExists(FilePath) then
		fso.DeleteFile FilePath,true
	end if		
End Sub
Sub DeleteOldFile(FilePath, maxAgeInDays)
    dim ArchieveFolder,files,f
  set ArchieveFolder = fso.GetFolder(FilePath)

    set files = ArchieveFolder.Files

    if Files.Count=0 then
	    NoFile = true
	    ErrorMsg = "No file found in folder"
    else
        for each f in Files
            If DateDiff("d", f.DateLastModified, Date) > maxAgeInDays Then
            f.Delete True
          End If
	    next
        ''BuildArrayFromCsv(filepath)
    end if

  Set fso = Nothing
End Sub
Sub ArchiveFile(byval FilePath,byval CoID)
	''move file to _Upload/_Archive
	dim archivefolder,FileName,NewFileName,DestFolder
	if fso.FileExists(FilePath) then
		archivefolder = Application("UploadFolderPath") & "_Archive"
		FileName = fso.GetFile(FilePath).Name
		DestFolder = archivefolder 
		
		if fso.FolderExists(archivefolder)=false then
			fso.CreateFolder(archivefolder)
		end if
		
		if fso.FileExists(DestFolder & "\" & FileName) then
            DeleteFileOnly(DestFolder & "\" & FileName)
			NewFileName = FileName
		end if
		fso.MoveFile FilePath,DestFolder & "\" & NewFileName
	end if
End Sub
Function ImportFTPFile(byval CoID)
	ImportFTPFile = 0
	Dim RS,sqlstr,i
    Dim files,f,Folders,ValidFolder,filepath,archivefolder 

	Set fso = CreateObject("Scripting.FileSystemObject")
	ImportFolderPath = Application("UploadFolderPath") & "_DataImport"

    if fso.FolderExists(ImportFolderPath)=false then
		Errormsg = "FTP folder does not exist" & vbNewLine & FTPFolderPath
    else
    set ImportFolder = fso.GetFolder(ImportFolderPath)

        set files = ImportFolder.Files

        if Files.Count=0 then
		    NoFile = true
		    ErrorMsg = "No file found in folder"
        else
            for each f in Files
               ErrorMsg = "" ''BuildArrayFromCsv(f.path)
               if ErrorMsg = "" then
                Call ArchiveFile(f.path,36)  ''move file to _Upload/_Archive
               end if
			next
            ''BuildArrayFromCsv(filepath)
        end if

       archivefolder = Application("UploadFolderPath") & "_Archive"
       Call DeleteOldFile(archivefolder, 90)
        
        if Errormsg <> "" then
            ErrorMsg = ErrorMsg
        end if

    end if

    	
End Function

Function BuildArrayFromCsv(filepath)    'Function to read file and load into an array
    BuildArrayFromCsv = ""
    Dim fso, f, str, key, value, equalpos, inputFile
    Dim MyFileSys,File,Content
    Set fso = CreateObject("Scripting.FileSystemObject")
    Dim sqlstr, sqlstr_Insert, errorMessage
    Const ForReading = 1    ' Declare constant for reading for more clarity
    errorMessage = ""

    Set inputFile = fso.OpenTextFile(filepath, 1) ' Set inputFile as file to be read from

    ''Content = inputFile.ReadAll

    Dim row, column
    Dim fields '12 fields per line  
    inputFile.ReadAll 'read to end of file  

    inputFile.close     'close file so that MyArray can be filled with data starting at the top
    Set inputFile = fso.OpenTextFile(filepath, 1, True) 'back at top  
'    inputFile.ReadLine 'skip header 

    Dim code, Date, SGDperUnit, UnitperSGD

    sqlstr = ""
    sqlstr_Insert = "INSERT INTO FIN_Exchange_Rate (Code,Date,SGDperUnit,UnitperSGD,ImportedDate) VALUES "


    Do Until inputFile.AtEndOfStream  
        fields = Split(inputFile.Readline,",") 'store line in temp array  
'        For column = 0 To 3 'iterate through the fields of the temp array  
'             = fields(column) 'store each field in the 2D array with the given coordinates  
'        Next
        code = fields(0)
        Date = fields(1)
        SGDperUnit = fields(2)
        UnitperSGD = fields(3)

        if NOT IsNumeric(SGDperUnit) then 
		errorMessage = "SGDperUnit invalid format"
        end if
        if NOT IsNumeric(UnitperSGD) then 
		errorMessage = "UnitperSGD invalid format"
        end if
        if NOT IsDate(Date) then
		errorMessage = "Date invalid format"
        end if

        if errorMessage = "" then
        systemdb.Execute("DELETE FROM FIN_Exchange_Rate WHERE Code='" & code & "' AND Date='" & Date & "'")

        sqlstr = sqlstr & sqlstr_Insert & "(" & _
            "'" & SQLEncode(code) & "'," & _
            "'" & SQLEncode(Date) & "'," & _
            "'" & SQLEncode(SGDperUnit) & "'," & _
            "'" & SQLEncode(UnitperSGD) & "'," & _
            "'" & LongDate(now()) & "'" & _
            "); "
            
                        
         end if 

        row = row + 1  'next line 
    Loop

    if errorMessage = "" then
    ''if sqlstr <> "" then systemdb.execute(sqlstr)
    end if
    inputFile.close

    BuildArrayFromCsv = errorMessage
End Function

Sub ProcessStatus(byval Desc)
	if DisplayStatus=true then
	    Wscript.echo Desc  
	end if
end Sub
Function RunLog(byval FileRun,byval Run_Status,byval IsError,byval LogID,byval Completed)    
    RunLog = GetScriptValue("RunLog",Array(Application("SystemConnectionStr"),FileRun,Run_Status,IsError,LogID,Completed))        
End Function
'------------------------ CLOSE Connection Here ---------------------------
systemdb.CommitTrans
systemdb.Close
set systemdb = Nothing
