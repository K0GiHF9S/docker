@echo off
set ALIAS=Wi-Fi
powershell "$env:IPAddress=$(Get-NetIPAddress| ? {$_.InterfaceAlias -like $env:ALIAS -and $_.AddressFamily -like 'IPv4'}|select IPAddress)[0].IPAddress;docker-compose up -d"
