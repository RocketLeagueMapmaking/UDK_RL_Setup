''' CreateShortcut.vbs
''' A stupid little script that creates a shortcut file, given a file name for itself and a target path
''' Mr. Swaggles - 2020/06/22

' https://superuser.com/questions/455364/how-to-create-a-shortcut-using-a-batch-script/455398

Set oWS = WScript.CreateObject("WScript.Shell")
sLinkDest = WScript.Arguments.Item(0)
Set oLink = oWS.CreateShortcut(sLinkDest)
oLink.TargetPath = WScript.Arguments.Item(1)
oLink.Save