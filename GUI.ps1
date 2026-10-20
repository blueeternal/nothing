
$Win32Functions = @'
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
'@
$User32 = Add-Type -MemberDefinition $Win32Functions -Name "User32Windows" -PassThru

$TargetApps = @("teneo-node") 
$SW_HIDE = 0          

Write-Host "Actively watching for $TargetApps to hide its GUI..."

while ($true) {
 foreach ($App in $TargetApps) {
    
    $Processes = Get-Process -Name $App -ErrorAction SilentlyContinue
    
    foreach ($Process in $Processes) {
       $Process.Refresh()
          if ($Process.MainWindowHandle -ne 0) {
        $User32::ShowWindowAsync($Process.MainWindowHandle, $SW_HIDE) | Out-Null
       
    }
 }
 }
    
   
    Start-Sleep -Milliseconds 100
}
