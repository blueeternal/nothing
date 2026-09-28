Set WshShell = CreateObject("WScript.Shell")
' Launch grass.exe minimized (2 means minimized window, False means don't wait for it to close)
WshShell.Run """C:\Users\hp\Downloads\Telegram Desktop\Grass\grass.exe""", 2, False
