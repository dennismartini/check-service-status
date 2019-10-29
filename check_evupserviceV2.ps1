$time = (Get-Date).ToString("ddMMyyyy-HHmm")
if ((get-service evup).status -contains "Stopped" ) { 
Start-Service EVUP
$MyToken = (Get-Content c:\puppet\arquivos\tkn.txt)
$chatID = -370673139
$hostname = $env:COMPUTERNAME
$Message = "Serviço Iniciado EVUP iniciado no host $hostname às $time"
$Response = Invoke-RestMethod -Uri "https://api.telegram.org/bot$($MyToken)/sendMessage?chat_id=$($chatID)&text=$($Message)"
write-output "Serviço Iniciado - $time" >> c:\puppet\arquivos\log-check-service.log } else {
write-host "Serviço em execução" }
