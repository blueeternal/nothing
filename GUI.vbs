Dim objShell
Set objShell = CreateObject("Wscript.Shell")

objShell.Run "powershell.exe -ExecutionPolicy Bypass -File ""C:\Users\hp\GUI.ps1""", 0, True
