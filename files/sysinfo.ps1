Write-Output "CPU:"
(Get-CimInstance Win32_Processor).Name
Write-Output ""

Write-Output "RAM:"
$ram = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory
"{0:N2} GB" -f ($ram / 1GB)
Write-Output ""

Write-Output "GPU:"
(Get-CimInstance Win32_VideoController).Name
Write-Output ""

Write-Output "System Drive:"
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
"Size: {0:N2} GB" -f ($disk.Size / 1GB)
"Free: {0:N2} GB" -f ($disk.FreeSpace / 1GB)
pause
exit