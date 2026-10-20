# Define the native Windows function to hide windows
$Win32Functions = @'
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
'@
$User32 = Add-Type -MemberDefinition $Win32Functions -Name "User32Windows" -PassThru

$TargetApps = @("teneo-node") 
$SW_HIDE = 0           # Constant to hide a window

Write-Host "Actively watching for $TargetApps to hide its GUI..."

while ($true) {
 foreach ($App in $TargetApps) {
    # Find all running instances of the app that have a visible window handle
    $Processes = Get-Process -Name $App -ErrorAction SilentlyContinue
    
    foreach ($Process in $Processes) {
       $Process.Refresh()
          if ($Process.MainWindowHandle -ne 0) {
        $User32::ShowWindowAsync($Process.MainWindowHandle, $SW_HIDE) | Out-Null
        Write-Host "[Intercepted] Hid the GUI for $App (PID: $($Process.Id))"
    }
 }
 }
    
    # High-frequency polling (adjust sleep for CPU performance vs speed)
    Start-Sleep -Milliseconds 100
}
