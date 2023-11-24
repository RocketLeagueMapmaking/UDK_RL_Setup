' Define the URL of the file to download
strURL = WScript.Arguments.Item(0)

' Define the local path where you want to save the downloaded file
strSaveTo = WScript.Arguments.Item(1)

' Create a new instance of the MSXML2.ServerXMLHTTP object
Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP")

' Open a GET request to the specified URL
objXMLHTTP.open "GET", strURL, False

' Send the GET request
objXMLHTTP.send

' Check if the request was successful (status code 200)
If objXMLHTTP.Status = 200 Then
    On Error Resume Next
    ' Create a new ADO stream object to save the downloaded file
    Set objADOStream = CreateObject("ADODB.Stream")
    objADOStream.Open
    objADOStream.Type = 1 ' Binary
    objADOStream.Write objXMLHTTP.ResponseBody
    objADOStream.Position = 0
    objADOStream.SaveToFile strSaveTo
    objADOStream.Close
    On Error Goto 0

    If Err.Number = 0 Then
        WScript.Echo "File downloaded successfully to " & strSaveTo
    Else
        WScript.Echo "Error saving the downloaded content to the file: " & Err.Description
    End If
Else
    WScript.Echo "Error downloading the file. HTTP Status Code: " & objXMLHTTP.Status
End If

' Clean up objects
Set objADOStream = Nothing
Set objXMLHTTP = Nothing