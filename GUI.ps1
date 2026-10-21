
$Win32Functions = @'
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
'@

if (-not ("User32Windows" -as [type])) {
    $User32 = Add-Type -MemberDefinition $Win32Functions -Name "User32Windows" -PassThru
} else {
    $User32 = [User32Windows]
}

$SW_HIDE = 0           


while ($true) {
    
    $CurrentProcesses = Get-Process -Name "teneo-node" -ErrorAction SilentlyContinue
    
    foreach ($P in $CurrentProcesses) {
        if ($P.MainWindowHandle -ne 0) {
         
             [void]$User32::ShowWindow($P.MainWindowHandle, $SW_HIDE)
            
            
        }
    }
    
    Start-Sleep -Milliseconds 100
}
