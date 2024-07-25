param (
    [string]$password
)

Start-Process -FilePath "C:\Program Files\RustDesk\RustDesk.exe" -ArgumentList "--password $password" -Wait
