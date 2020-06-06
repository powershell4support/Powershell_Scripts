CLEAR
Write-host ""
Write-host "______                          _          _ _     ___   _____                              _   " -ForegroundColor Cyan
Write-host "| ___ \                        | |        | | |   /   | /  ___|                            | |  " -ForegroundColor Cyan
Write-host "| |_/ /____      _____ _ __ ___| |__   ___| | |  / /| | \ `--. _   _ _ __  _ __   ___  _ __| |_ " -ForegroundColor Cyan
Write-host "|  __/ _ \ \ /\ / / _ \ '__/ __| '_ \ / _ \ | | / /_| |  `--. \ | | | '_ \| '_ \ / _ \| '__| __|" -ForegroundColor Cyan
Write-host "| | | (_) \ V  V /  __/ |  \__ \ | | |  __/ | | \___  | /\__/ / |_| | |_) | |_) | (_) | |  | |_ " -ForegroundColor Cyan
Write-host "\_|  \___/ \_/\_/ \___|_|  |___/_| |_|\___|_|_|     |_/ \____/ \__,_| .__/| .__/ \___/|_|   \__|" -ForegroundColor Cyan
Write-host "                                                                    | |   | |                   " -ForegroundColor Cyan
Write-host "                                                                    |_|   |_|                   " -ForegroundColor Cyan
Write-host "Developed by David Mena" -ForegroundColor Cyan
Write-Host "PLEASE SUBSCRIBE : https://www.youtube.com/channel/UCCJlFicsPdVld48G0ApdUJw/"
Write-host ""
Write-host "MODULE 4. CREATE A REMOTE SCHEDULE TASK USING WINDOWS POWERSHELL / CHECK SCHEDULED TASKS" -ForegroundColor Green
Write-host ""
Write-host ""

# Commands used:

# -Invoke-Command
# -New-ScheduledTaskAction
# -New-ScheduledTaskTrigger
# -New ScheduledTaskPrincipal
# -Read-Host


    $action = New-ScheduledTaskAction -Execute 'notepad.exe' 
    $trigger = New-ScheduledTaskTrigger -Daily -At 10am -RandomDelay (New-TimeSpan -Minutes 480)
    $principal = New-ScheduledTaskPrincipal -GroupID "BUILTIN\Administrators" -RunLevel Highest
    Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName "GetProcess" -Description "Task Description"
    $Task = Get-ScheduledTask -TaskName "GetProcess"
    $Task.Triggers[0].ExecutionTimeLimit= "PT30M"
    Set-ScheduledTask $Task
