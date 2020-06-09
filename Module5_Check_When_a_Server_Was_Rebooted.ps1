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
Write-host "MODULE 5. CHECK WHEN WAS THE LAST TIME A SERVER WAS REBOOTED AND DUMP DATA INTO A CSV" -ForegroundColor Green
Write-host ""
Write-host ""

#Check if the path we are going to dump the file is created, if not, create it.
$check_path=Test-path C:\scripts
If ($check_path -eq $false)
{
    mkdir c:\scripts
}
# Import the server list to run the query #
$Server_List=get-content C:\scripts\list.txt 

# Conditionals # 

foreach ($Server in $Server_List)
{
Write-host "Checking $server" -ForegroundColor Cyan
$query=Get-WmiObject win32_operatingsystem -ComputerName $Server | select csname, @{LABEL=’LastBootUpTime’;EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}} |Export-csv C:\scripts\LastBoot.csv -Append -NoTypeInformation
}



