# Encontrar o usuário atualmente logado
$current_user = (Get-WMIObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName).Split('\')[1]

# Caminho do arquivo de configuração do RustDesk no perfil do usuário logado
$config_path = "C:\Users\$current_user\AppData\Roaming\RustDesk\config"

# Certifique-se de que o diretório de configuração existe
if (Test-Path -Path $config_path) {
    # Caminho completo do arquivo de configuração (adaptar conforme o nome do arquivo real)
    $config_file = "$config_path\Rustdesk.toml"

    # Certifique-se de que o arquivo de configuração existe
    if (Test-Path -Path $config_file) {
        # Alterar a senha no arquivo de configuração
        # Exemplo: substituindo a linha que contém a senha (adaptar conforme o formato real do arquivo de configuração)
        (Get-Content $config_file) -replace '00vU35ke9AvERTkLsbZfJDcu/rKPqqHTg6', 'nova_senha' | Set-Content $config_file
        Write-Output "Senha alterada com sucesso."
    } else {
        Write-Output "Arquivo de configuração não encontrado: $config_file"
    }
} else {
    Write-Output "Diretório de configuração não encontrado: $config_path"
}
