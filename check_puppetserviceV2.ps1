$time = (Get-Date).ToString("ddMMyyyy-HHmm")
if ((get-service evup).status -contains "Stopped" ) { 
Start-Service EVUP
$MyToken = (Get-Content c:\puppet\arquivos\tkn.txt)
$chatID = -299517315
$hostname = $env:COMPUTERNAME
$Message = "Servico Puppet iniciado no host $hostname as $time"
$Response = Invoke-RestMethod -Uri "https://api.telegram.org/bot$($MyToken)/sendMessage?chat_id=$($chatID)&text=$($Message)"
write-output "Servico Iniciado - $time" >> c:\puppet\arquivos\puppet-log-check-service.log } else {
write-host "Serviço em execução" }
