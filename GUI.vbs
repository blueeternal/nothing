Dim objShell
Set objShell = CreateObject("Wscript.Shell")

' 0 = Hide the window; True = Wait for the PowerShell script to finish before continuing
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File ""C:\Users\hp\GUI.ps1""", 0, True
