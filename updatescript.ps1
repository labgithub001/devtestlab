<#
.SYNOPSIS
    Installation automatisée des mises à jour Abacus - Version Finale Optimisée
#>

# 1. Privilèges Administrateur
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Veuillez lancer PowerShell en tant qu'administrateur."
    pause ; exit
}

# --- CONFIGURATION DES VERSIONS ---
# Vous pouvez ajouter autant de versions que vous voulez ici. 
# Veillez juste à ce que chaque "MM.AAAA" soit unique au sein d'une même année majeure.

$AbacusRepo = @{
    "2026" = @{
		"10.2026" = "https://storage.googleapis.com/images.abasky.net/98ee52108f801af879ba28051e277d0c7950a1cb203ee4688696756869c231d1/all/v2026.202.17318-hotfix-15.10.2026.iso"
		"09.2026" = "https://storage.googleapis.com/images.abasky.net/b5b4e55c8039a9110f2f8f8894ca92da9d32985e09b378842fac45093df109ba/all/v2026.202.17281-servicepack-15.09.2026.iso"
		"08.2026" = "https://storage.googleapis.com/images.abasky.net/ca92227031248e51767ce501cb2d973a3e9a4a912ec5c4a57c025265755acdf3/all/v2026.201.17251-hotfix-15.08.2026.iso"
		}
    "2025" = @{
		"10.2026" = "https://storage.googleapis.com/images.abasky.net/1ed7afab9cb3d46904bad248470b7b4552962d066648f7fda7d3f68462329c87/all/v2025.203.17157-hotfix-15.10.2026.iso"
		"09.2026" = "https://storage.googleapis.com/images.abasky.net/9f0ad2ad76a65004585849ca1416360a2b7531753a98aefc8286db20206907e4/all/v2025.203.17122-hotfix-15.09.2026.iso"
		"08.2026" = "https://storage.googleapis.com/images.abasky.net/ec231320d5bacaea806331d0edf4021d71d79d434d2e513ca95d4c3fbaf8f4d2/all/v2025.203.17085-hotfix-15.08.2026.iso"
		}
    "2024" = @{
		"10.2026" = "https://storage.googleapis.com/images.abasky.net/f631e87340bc465e7bed0d0fb70ed7b875ab809de0a96d2c282db5e4cc4efe1e/all/v2024.205.16885-hotfix-15.10.2026.iso"
		"09.2026" = "https://storage.googleapis.com/images.abasky.net/4673a1094a8be932ca5d17f06383284fb03545f00f86de958c30d396cd410157/all/v2024.205.16852-hotfix-15.09.2026.iso"
		"08.2026" = "https://storage.googleapis.com/images.abasky.net/efab9e9ed96a10770967f6b11c5e6ce4cdcadd6f369ea844c254c95cc1c7b394/all/v2024.205.16818-servicepack-15.08.2026.iso"
		}
	}

# --- LOGIQUE DE SÉLECTION ---
$majors = $AbacusRepo.Keys | Sort-Object -Descending
Write-Host "`n--- SELECTION DE LA VERSION MAJEURE ---" -ForegroundColor Cyan
for ($i = 0; $i -lt $majors.Count; $i++) { Write-Host " [$($i + 1)] Abacus v$($majors[$i])" }
$vChoice = Read-Host "`nChoisissez une version"
$selectedMajor = $majors[$vChoice - 1]

# TRI CHRONOLOGIQUE DES VERSIONS MINEURES (Même s'il y en a 30+)
Write-Host "`n--- HOTFIX DISPONIBLES (Le plus recent en haut) ---" -ForegroundColor Cyan
$sortedHotfixes = $AbacusRepo[$selectedMajor].Keys | Sort-Object { 
    [datetime]::ParseExact($_, "MM.yyyy", $null) 
} -Descending

for ($j = 0; $j -lt $sortedHotfixes.Count; $j++) { 
    Write-Host " [$($j + 1)] Build $($sortedHotfixes[$j])" 
}
$hChoice = Read-Host "`nChoisissez le hotfix"
$selectedHF = $sortedHotfixes[$hChoice - 1]
$downloadUrl = $AbacusRepo[$selectedMajor][$selectedHF]

# --- TÉLÉCHARGEMENT ---
$basePath = "C:\abasources"
$isoPath  = Join-Path $basePath "abacus.iso"
if (-not (Test-Path $basePath)) { New-Item $basePath -ItemType Directory | Out-Null }

if (Test-Path $isoPath) {
    Dismount-DiskImage -ImagePath $isoPath -ErrorAction SilentlyContinue
    Remove-Item $isoPath -Force
}

try {
    Write-Host "`nTelechargement : Abacus v$selectedMajor ($selectedHF)..." -ForegroundColor Green
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
