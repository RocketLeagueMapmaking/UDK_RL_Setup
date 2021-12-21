''' ModifyUDKEngine.vbs
''' Script that removes the UDK hardware survey upload that slows down UDK launch
''' https://discord.com/channels/711882968200904715/711884653899808880/922911488329523221
''' MrPhil - 2021/12/21

' https://stackoverflow.com/questions/2198810/creating-and-writing-lines-to-a-file

' Accept a filename as an argument
sFileName = WScript.Arguments.Item(0)

' Text to look for
sKey0 = "; Modified by UDK_RL_Setup.bat"
sKey1 = "LastSurveyDate="

' Text to insert
sNewLine = "LastSurveyDate=21501221"

' Open file, create array of lines
Set objFS = CreateObject("Scripting.FileSystemObject")
aContents = Split(objFS.OpenTextFile(sFileName).ReadAll, vbNewLine)
Set objTS = objFS.OpenTextFile(sFileName, 2)

' Booleans for flow control
Dim bTagged
bTagged = False
Dim bNewTag
bNewTag = False

' Write lines depending on state of file
For Each sLine In aContents
    ' If the first line says "; Modified by UDK_RL_Setup.bat" then don't modify anything
    If InStr(1, sLine, sKey0, 1) = 1 Then
        bTagged = True
    End If

    ' Only add the tag once
    If bTagged = False AND bNewTag = False Then
        objTS.WriteLine sKey0
        bNewTag = True
    End If

    ' Detect line and insert new value if file isn't tagged
    If InStr(1, sLine, sKey1, 1) = 1 AND bTagged = False Then
        objTS.WriteLine sNewLine
    Else
        objTS.WriteLine sLine
    End If
Next