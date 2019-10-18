if ((get-service evup).status -contains "Stopped" ) { Start-Service EVUP } else {write-host "Serviço em execução" }
