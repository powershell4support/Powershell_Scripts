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
Write-host "MODULE 7. CHECK WHAT PORT CORRESPONDS TO WHAT APPLICATION" -ForegroundColor Green
Write-host ""
Write-host ""

# Read Host to wait for an Input
    $Port=Read-host "Type the port number to query "
    $Q2=Read-host "Do you want to export the result to CSV? (Y/N) "
# Query using the input
    $check_port=get-nettcpconnection |where-object {$_.remoteport -eq $Port}| select local*,remote*,state,@{Name="Process";Expression={(Get-Process -Id $_.OwningProcess).ProcessName}} 
    $check_port |ft *
# Conditional in case you have selected Y TO CSV
    If ($Q2 -eq "Y")
{
    $test=Test-Path C:\scripts
# Check if the output folder exists, if not, creates it.
    If ($test -eq $false)
{
    mkdir C:\scripts
}
    If ($test -eq $true)
{
# Remove old files just in case there is one
    rm c:\scripts\Port_Query.csv -Force
# Export Output to a CSV
    $check_port |export-csv c:\scripts\Port_Query.csv -NoTypeInformation -Append
}
}

