''' ModifyDefaultEngine.vbs
''' A stupid little script that inserts 3 lines of text into DefaultEngine.ini
''' Mr. Swaggles - 2020/06/13

' https://stackoverflow.com/questions/2198810/creating-and-writing-lines-to-a-file

' Accept a filename as an argument
sFileName = WScript.Arguments.Item(0)

' Text to look for
sKey0 = "; Modified by UDK_RL_Setup.bat"
sKey1 = "[UnrealEd.EditorEngine]"

' Text to insert
sNewLine1 = "+EditPackages=AKAudio"
sNewLine2 = "+EditPackages=ProjectX"
sNewLine3 = "+EditPackages=TAGame"

' Open file, create array of lines
Set objFS = CreateObject("Scripting.FileSystemObject")
aContents = Split(objFS.OpenTextFile(sFileName).ReadAll, vbNewLine)
Set objTS = objFS.OpenTextFile(sFileName, 2)

' Booleans for flow control
Dim bTagged
bTagged = False
Dim bNewTag
bNewTag = False
Dim bFound
bFound = False
Dim bDelay
bDelay = False

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

    objTS.WriteLine sLine

    ' Wait one more pass through so that lines are written below header
    If bFound = True Then
        bDelay = True
    End If

    ' Detect line where text insert will happen
    If InStr(1, sLine, sKey1, 1) = 1 Then
        bFound = True
    End If

    ' Write lines
    If bDelay = True AND bTagged = False Then
        objTS.WriteLine sNewLine1
        objTS.WriteLine sNewLine2
        objTS.WriteLine sNewLine3
        bFound = False
        bDelay = False
    End If
Next