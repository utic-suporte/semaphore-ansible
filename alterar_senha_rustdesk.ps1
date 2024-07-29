# Encontrar o usuário atualmente logado
$current_user = (Get-WMIObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName).Split('\')[1]

# Caminho do arquivo de configuração do RustDesk no perfil do usuário logado
$config_path = "C:\Users\$current_user\AppData\Roaming\RustDesk\config"

# Certifique-se de que o diretório de configuração existe
if (Test-Path -Path $config_path) {
    # Caminho completo do arquivo de configuração
    $config_file = "$config_path\Rustdesk.toml"

    # Certifique-se de que o arquivo de configuração existe
    if (Test-Path -Path $config_file) {
        # Nova senha para substituir
        $nova_senha = '00vU35ke9AvERTkLsbZfJDcu/rKPqqHTg6'

        # Ler o conteúdo do arquivo de configuração
        $config_content = Get-Content $config_file

        # Substituir a linha que contém a senha
        $config_content = $config_content -replace "password = '.*'", "password = '$nova_senha'"

        # Gravar o conteúdo atualizado de volta no arquivo
        $config_content | Set-Content $config_file

        Write-Output "Senha alterada com sucesso."
    } else {
        Write-Output "Arquivo de configuração não encontrado: $config_file"
    }
} else {
    Write-Output "Diretório de configuração não encontrado: $config_path"
}
