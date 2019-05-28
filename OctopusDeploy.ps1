cd "C:\Program Files\Octopus Deploy\Tentacle\"

.\Tentacle.exe create-instance --instance "Tentacle" --config "C:\Octopus\Tentacle.config"

.\Tentacle.exe new-certificate --instance "Tentacle" --if-blank
.\Tentacle.exe configure --instance "Tentacle" --reset-trust

.\Tentacle.exe configure --instance "Tentacle" --app "C:\Octopus\Applications" --port "10933" --noListen "False"
.\Tentacle.exe configure --instance "Tentacle" --trust "58644C10E1A3FMCJ73DB31D02D806A0AAD17DF3"
 netsh advfirewall firewall add rule "name=Octopus Deploy Tentacle" dir=in action=allow protocol=TCP localport=10933
.\Tentacle.exe register-with --instance "Tentacle" --server "http://OctopusServerURL" --apiKey="API-APIKEY" --role "web-server" --environment "Env-name" --comms-style TentaclePassive --console #This is a listening tentacle
.\Tentacle.exe service --instance "Tentacle" --install --start --console