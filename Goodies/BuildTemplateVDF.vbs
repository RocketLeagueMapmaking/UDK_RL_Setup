''' BuildTemplateVDF.vbs
''' A stupid little script that builds the Template VDF
''' Mr. Swaggles - 2020/06/19

' Accept UDK maps and target UPK filename as arguments
sFolder = WScript.Arguments.Item(0)

Set objFSO=CreateObject("Scripting.FileSystemObject")

' Write lines to the file
outFile=objFSO.BuildPath(sFolder, "Template.vdf")
Set objFile = objFSO.CreateTextFile(outFile,True)

objFile.Write """workshopitem""" & vbCrLf
objFile.Write "{" & vbCrLf
objFile.Write """appid""		""252950""" & vbCrLf
objFile.Write """publishedfileid""		""0""" & vbCrLf
objFile.Write """contentfolder""		""" & sFolder & """" & vbCrLf
objFile.Write """previewfile""		""" & sFolder & "\UDK_Default.png""" & vbCrLf
objFile.Write """visibility""		""0""" & vbCrLf
objFile.Write """title""		""Template""" & vbCrLf
objFile.Write """description""		""Your Description Here""" & vbCrLf
objFile.Write """changenote""		""v1.0 - Original Version""" & vbCrLf
objFile.Write "}" & vbCrLf

objFile.Close


' Create a really dumb example upk file
Set objFSO2=CreateObject("Scripting.FileSystemObject")

outFile2=objFSO2.BuildPath(sFolder, "Template.upk")
Set objFile2 = objFSO2.CreateTextFile(outFile2,True)
objFile2.Write "Awesome!" & vbCrLf
objFile2.Close