archive = WScript.Arguments.Item(0)
destination = WScript.Arguments.Item(1)

Set fso = CreateObject("Scripting.FileSystemObject")
If NOT fso.FolderExists(destination) Then
fso.CreateFolder(destination)
End If

set objShell = CreateObject("Shell.Application")
set FilesInZip=objShell.NameSpace(archive).items

objShell.NameSpace(destination).CopyHere(FilesInZip)

Set fso = Nothing
Set objShell = Nothing