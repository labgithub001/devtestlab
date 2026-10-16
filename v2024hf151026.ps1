<#
.SYNOPSIS
    Installation automatisée des mises à jour Abacus - Version Finale Optimisée
#>

# 1. Privilèges Administrateur
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Veuillez lancer PowerShell en tant qu'administrateur."
    pause ; exit
}

$downloadUrl = "https://storage.googleapis.com/images.abasky.net/f631e87340bc465e7bed0d0fb70ed7b875ab809de0a96d2c282db5e4cc4efe1e/all/v2024.205.16885-hotfix-15.10.2026.iso"

# --- TÉLÉCHARGEMENT ---
$basePath = "C:\abasources"
$isoPath  = Join-Path $basePath "abacus.iso"
if (-not (Test-Path $basePath)) { New-Item $basePath -ItemType Directory | Out-Null }

if (Test-Path $isoPath) {
    Dismount-DiskImage -ImagePath $isoPath -ErrorAction SilentlyContinue
    Remove-Item $isoPath -Force
}

try {
    Write-Host "`nTelechargement : Abacus v2024 HF 15.10.2026..." -ForegroundColor Green
    $ProgressPreference = 'SilentlyContinue'
    Start-BitsTransfer -Source $downloadUrl -Destination $isoPath -DisplayName "Abacus ISO"
    $ProgressPreference = 'Continue'
} catch {
    Write-Error "Echec du telechargement : $_"; pause; exit
}

# --- MONTAGE ET PARAMÉTRAGE ---
try {
    $mount = Mount-DiskImage -ImagePath $isoPath -PassThru
    Start-Sleep -Seconds 2
    $driveLetter = ($mount | Get-Volume).DriveLetter
    
    $env:ABASETUP_UNATTENDED = 1
    $env:ABASETUP_LANGUAGESETUP = "fr"

    $exePath = "${driveLetter}:\sp_cli.exe"
    if (Test-Path $exePath) {
        Write-Host "Lancement de l'installation..." -ForegroundColor Green
        Start-Process -FilePath $exePath -Wait
    } else {
        Write-Warning "abasetup.exe introuvable sur le lecteur $driveLetter :\"
    }
} finally {
    # Nettoyage automatique du lecteur virtuel
    Dismount-DiskImage -ImagePath $isoPath -ErrorAction SilentlyContinue
    Write-Host "Processus termine."
}
