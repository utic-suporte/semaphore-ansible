# Caminho para o arquivo de configuração do RustDesk
$configFilePath = "$env:APPDATA\RustDesk\config\RustDesk.toml"

# Nova senha que você quer definir
$newPassword = "novaSenhaAqui"

# Função para parar o serviço do RustDesk
function Stop-RustDeskService {
    Stop-Service -Name "RustDesk" -Force
}

# Função para iniciar o serviço do RustDesk
function Start-RustDeskService {
    Start-Service -Name "RustDesk"
}

# Função para alterar a senha no arquivo de configuração
function Set-RustDeskPassword {
    if (Test-Path -Path $configFilePath) {
        $configContent = Get-Content -Path $configFilePath -Raw
        $newConfigContent = $configContent -replace 'password = ".*"', "password = `"$newPassword`""
        Set-Content -Path $configFilePath -Value $newConfigContent -Force
        Write-Host "Senha alterada com sucesso."
    } else {
        Write-Host "Arquivo de configuração não encontrado: $configFilePath"
    }
}

# Executar as funções
Stop-RustDeskService
Set-RustDeskPassword
Start-RustDeskService
