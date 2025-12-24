# Script para autenticarse con GitHub usando navegador
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AUTENTICACION CON GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Abrir navegador para crear token
Write-Host "Abriendo GitHub para crear un token de acceso..." -ForegroundColor Yellow
Write-Host ""
Start-Process "https://github.com/settings/tokens/new"

Write-Host "INSTRUCCIONES:" -ForegroundColor Green
Write-Host "1. En la pagina que se abrio, completa:" -ForegroundColor White
Write-Host "   - Note: GitHub Desktop (o cualquier nombre)" -ForegroundColor Gray
Write-Host "   - Expiration: Elige una duracion (ej: 90 dias)" -ForegroundColor Gray
Write-Host "   - Scopes: Marca 'repo' (acceso completo a repositorios)" -ForegroundColor Gray
Write-Host "2. Haz clic en 'Generate token'" -ForegroundColor Gray
Write-Host "3. COPIA el token (solo se muestra una vez)" -ForegroundColor Yellow
Write-Host ""

$token = Read-Host "Pega aqui el token que copiaste"

if ([string]::IsNullOrWhiteSpace($token)) {
    Write-Host "Token vacio. Saliendo..." -ForegroundColor Red
    exit
}

Write-Host ""
Write-Host "Configurando Git con tus credenciales..." -ForegroundColor Yellow

# Cambiar al directorio del proyecto
Set-Location "C:\Users\usuario\Desktop\economia"

# Configurar usuario
$usuario = "cuevasn050"
& "C:\Program Files\Git\bin\git.exe" config user.name $usuario
& "C:\Program Files\Git\bin\git.exe" config user.email "$usuario@users.noreply.github.com"

# Configurar remote con token
Write-Host "Configurando repositorio remoto..." -ForegroundColor Yellow
& "C:\Program Files\Git\bin\git.exe" remote remove origin 2>$null
& "C:\Program Files\Git\bin\git.exe" remote add origin "https://$usuario`:$token@github.com/$usuario/evaluacion-proveedores.git"

# Verificar estado
Write-Host ""
Write-Host "Verificando archivos..." -ForegroundColor Yellow
& "C:\Program Files\Git\bin\git.exe" status

# Hacer push
Write-Host ""
Write-Host "Subiendo archivos a GitHub..." -ForegroundColor Yellow
& "C:\Program Files\Git\bin\git.exe" push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ARCHIVOS SUBIDOS EXITOSAMENTE!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Tu repositorio esta en:" -ForegroundColor Cyan
    Write-Host "https://github.com/$usuario/evaluacion-proveedores" -ForegroundColor White
    Write-Host ""
    Write-Host "Ahora activa GitHub Pages:" -ForegroundColor Yellow
    Write-Host "1. Ve a: https://github.com/$usuario/evaluacion-proveedores/settings/pages" -ForegroundColor White
    Write-Host "2. En 'Source', selecciona 'main' branch" -ForegroundColor White
    Write-Host "3. Guarda" -ForegroundColor White
    Write-Host "4. Tu sitio estara en: https://$usuario.github.io/evaluacion-proveedores/" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ERROR AL SUBIR ARCHIVOS" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Verifica:" -ForegroundColor Yellow
    Write-Host "- Que el token sea correcto" -ForegroundColor White
    Write-Host "- Que tengas permisos en el repositorio" -ForegroundColor White
}

Write-Host ""
pause
