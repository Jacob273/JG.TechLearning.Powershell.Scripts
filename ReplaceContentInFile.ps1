$pathToAppConfig1 = "C:\app\App1.exe.config"
$pathToAppConfig2 = "C:\app2\App2.exe.config"



(Get-Content -path $pathToAppConfig1 -Raw) -replace 
'net.tcp://localhost:50002/', 'net.tcp://localhost:63332' | 
Set-Content -Path $pathToAppConfig1


(Get-Content -path $pathToAppConfig2 -Raw) -replace 
{ 'net.tcp://localhost:50002', 'net.tcp://localhost:63332',
  'baseAddress="http://localhost:50001', 'baseAddress="http://localhost:63331' } | 
Set-Content -Path $pathToAppConfig2
