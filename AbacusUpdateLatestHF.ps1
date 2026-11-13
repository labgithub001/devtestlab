<#
.SYNOPSIS
    Installation automatisée des mises à jour Abacus - Version Finale Optimisée
#>

# 1. Privilèges Administrateur
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Veuillez lancer PowerShell en tant qu'administrateur."
    pause
    exit
}

# --- RECUPERATION DE LA VERSION MAJEURE ---

$RegPath = 'HKLM:\SOFTWARE\ABACUS Research AG'

try {
    $ProgramLocation = (Get-ItemProperty -Path $RegPath -Name 'ProgramLocation' -ErrorAction Stop).ProgramLocation
    $AbaSetupIni = Join-Path -Path $ProgramLocation -ChildPath 'abac\system\abasetup.ini'

    if (-not (Test-Path -LiteralPath $AbaSetupIni -PathType Leaf)) {
        throw "Le fichier abasetup.ini est introuvable : $AbaSetupIni"
    }

    Write-Host "Fichier trouvé : $AbaSetupIni"
}
catch {
    Write-Error "Impossible de déterminer le chemin d'abasetup.ini : $($_.Exception.Message)"
    pause
    exit
}

# Lire le fichier INI
$iniContent = Get-Content -LiteralPath $AbaSetupIni -ErrorAction Stop

# Rechercher la valeur Major
$majorLine = $iniContent | Where-Object { $_ -match '^\s*Major\s*=\s*(\d+)\s*$' } | Select-Object -First 1

if (-not $majorLine) {
    throw "La valeur Major est absente du fichier abasetup.ini"
}

if ($majorLine -match '^\s*Major\s*=\s*(\d+)\s*$') {
    $majorAbacus = $Matches[1]
} else {
    throw "Impossible de lire la valeur Major"
}

$versionAbacus = "v$majorAbacus"

Write-Output "========================================"
Write-Output "Informations Abacus"
Write-Output "========================================"
Write-Output "Version              : $versionAbacus"
Write-Output "========================================"

# --- CONFIGURATION DES VERSIONS ---
$AbacusRepo = @{
    "2026" = "https://storage.googleapis.com/images.abasky.net/98ee52108f801af879ba28051e277d0c7950a1cb203ee4688696756869c231d1/all/v2026.202.17318-hotfix-15.10.2026.iso"
    "2025" = "https://storage.googleapis.com/images.abasky.net/1ed7afab9cb3d46904bad248470b7b4552962d066648f7fda7d3f68462329c87/all/v2025.203.17157-hotfix-15.10.2026.iso"
    "2024" = "https://storage.googleapis.com/images.abasky.net/f631e87340bc465e7bed0d0fb70ed7b875ab809de0a96d2c282db5e4cc4efe1e/all/v2024.205.16885-hotfix-15.10.2026.iso"
}

# --- LOGIQUE DE SÉLECTION ---
$selectedMajor = $majorAbacus
$downloadUrl = $AbacusRepo[$selectedMajor]

if (-not $downloadUrl) {
    Write-Error "Aucune URL de téléchargement trouvée pour la version majeure : $selectedMajor"
    pause
    exit
}

# --- TÉLÉCHARGEMENT ---
$basePath = "C:\abasources"
$isoPath  = Join-Path $basePath "abacus.iso"
if (-not (Test-Path $basePath)) { New-Item $basePath -ItemType Directory | Out-Null }

if (Test-Path $isoPath) {
    Dismount-DiskImage -ImagePath $isoPath -ErrorAction SilentlyContinue
    Remove-Item $isoPath -Force
}

try {
    Write-Host "`nTéléchargement : Abacus v$selectedMajor..." -ForegroundColor Green
    $ProgressPreference = 'SilentlyContinue'
    Start-BitsTransfer -Source $downloadUrl -Destination $isoPath -DisplayName "Abacus ISO"
    $ProgressPreference = 'Continue'
} catch {
    Write-Error "Échec du téléchargement : $_"
    pause
    exit
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
        Write-Warning "sp_cli.exe introuvable sur le lecteur $driveLetter :\"
    }
} finally {
    # Nettoyage automatique du lecteur virtuel
    Dismount-DiskImage -ImagePath $isoPath -ErrorAction SilentlyContinue
    Write-Host "Processus terminé." -ForegroundColor Cyan
}
