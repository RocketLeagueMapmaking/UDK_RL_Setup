Set oWS = WScript.CreateObject("WScript.Shell")
sLinkDest = WScript.Arguments.Item(0)
Set oLink = oWS.CreateShortcut(sLinkDest)
oLink.TargetPath = WScript.Arguments.Item(1)
oLink.Save