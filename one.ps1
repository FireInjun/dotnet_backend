$job = Register-ScheduledJob `
    -Name GpgAgent `
        -ScriptBlock { gpg-connect-agent.exe /bye } `
            -Trigger (New-JobTrigger -AtLogOn -User $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)) `
                -ScheduledJobOption (New-ScheduledJobOption -StartIfOnBattery -ContinueIfGoingOnBattery) `
                    -RunNow
                    
                    # Change principal to run only on interactive logon instead of S4A.
                    $principal = New-ScheduledTaskPrincipal -LogonType Interactive -UserId $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)
                    Set-ScheduledTask -TaskPath \Microsoft\Windows\PowerShell\ScheduledJobs\ -TaskName $job.Name -Principal $principal`
