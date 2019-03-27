$appendMsg = "Invoke-Item C:\Users\mk\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$realProfile = "C:\Users\mk\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1"

"if (Get-ExecutionPolicy -!eq ""unrestricted""){
    Write-Host ""sorry! I'll reset it right now for you!"";
    start-process powershell.exe -FilePath ""X:/SOURCE"" -Verb RunAs -ArgumentList ""Set-ExecutionPolicy unrestricted"", ""Invoke-Item $realProfile -Force""
    Start-Sleep -Seconds 10
    exit
    }"

if (Test-Path -Path $PROFILE.AllUsersAllHosts ){
    Set-Content -Value $appendMsg -Path $PROFILE.AllUsersAllHosts -Confirm -Force
}else{
    New-Item -Path $PROFILE.AllUsersAllHosts -Confirm -Force
    Set-Content -Value $appendMsg -Path $PROFILE.AllUsersAllHosts -Confirm -Force
}
if (Test-Path -Path $PROFILE.AllUsersCurrentHost ){
    Set-Content -Value $appendMsg -Path $PROFILE.AllUsersCurrentHost -Confirm -Force
}else{
    New-Item -Path $PROFILE.AllUsersCurrentHost -Confirm -Force
    Set-Content -Value $appendMsg -Path $PROFILE.AllUsersCurrentHost -Confirm -Force
}
if (Test-Path -Path $PROFILE.CurrentUserAllHosts ){
    Set-Content -Value $appendMsg -Path $PROFILE.CurrentUserAllHosts -Confirm -Force
}else{
    New-Item -Path $PROFILE.CurrentUserAllHosts -Confirm -Force
    Set-Content -Value $appendMsg -Path $PROFILE.CurrentUserAllHosts -Confirm -Force
}

Test-Path -Path $PROFILE.AllUsersAllHosts
Test-Path -Path $PROFILE.AllUsersCurrentHost
Test-Path -Path $PROFILE.CurrentUserAllHosts

exit