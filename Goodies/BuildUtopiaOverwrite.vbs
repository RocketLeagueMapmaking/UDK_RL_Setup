''' BuildUtopiaOverwrite.vbs
''' A stupid little script that builds the UtopiaOverwrite Script
''' Mr. Swaggles - 2020/06/19

' https://stackoverflow.com/questions/2198810/creating-and-writing-lines-to-a-file

' Accept UDK maps and target UPK filename as arguments
sMapsDir = WScript.Arguments.Item(0)
sFileName = WScript.Arguments.Item(1)

Set objFSO=CreateObject("Scripting.FileSystemObject")

' Write lines to the file
outFile=objFSO.BuildPath(sMapsDir, "UtopiaOverwrite.bat")
Set objFile = objFSO.CreateTextFile(outFile,True)
objFile.Write "@echo off" & vbCrLf
objFile.Write "echo ""%~1""" & vbCrLf
objFile.Write "echo F|xcopy /y ""%~1"" """ & sFileName & """" & vbCrLf
objFile.Close
