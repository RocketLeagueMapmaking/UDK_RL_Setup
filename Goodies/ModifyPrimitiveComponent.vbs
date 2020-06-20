''' ModifyPrimitiveComponent.vbs
''' A stupid little script that inserts 3 lines of text into PrimitiveComponent.uc
''' Mr. Swaggles - 2020/06/15


' Accept a filename as an argument
sFileName = WScript.Arguments.Item(0)

' Text to look for
sKey0 = "// Modified by UDK_RL_Setup.bat"
sKey1 = "	RBCC_EffectPhysics,"

' Text to insert
sNewLine1 = "	RBCC_Ball,"
sNewLine2 = "	RBCC_VehicleBlocker,"
sNewLine3 = "	RBCC_BallBlocker,"

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


    ' Detect line where text insert will happen
    If InStr(1, sLine, sKey1, 1) = 1 Then
        bFound = True
    End If

    ' Write lines
    If bFound = True AND bTagged = False Then
        objTS.WriteLine sNewLine1
        objTS.WriteLine sNewLine2
        objTS.WriteLine sNewLine3
        bFound = False
    End If
Next