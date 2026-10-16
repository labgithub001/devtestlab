#Requires -Version 5.1
#Requires -RunAsAdministrator

[CmdletBinding()]
param(
    [string]$RootFolder = 'C:\AbacusSHF'
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

$Packages = @(
    [PSCustomObject]@{
        Name     = 'shf-20'
        FileName = 'shf-20_ManualInstall.zip'
        Url      = 'https://sr0054.blob.core.windows.net/abacusshf/shf-20_ManualInstall.zip'
    }
    [PSCustomObject]@{
        Name     = 'shf-21'
        FileName = 'shf-21_ManualInstall.zip'
        Url      = 'https://sr0054.blob.core.windows.net/abacusshf/shf-21_ManualInstall.zip'
    }
    [PSCustomObject]@{
        Name     = 'shf-22'
        FileName = 'shf-22_ManualInstall.zip'
        Url      = 'https://sr0054.blob.core.windows.net/abacusshf/shf-22_ManualInstall.zip'
    }
    [PSCustomObject]@{
        Name     = 'shf-23'
        FileName = 'shf-23_ManualInstall.zip'
        Url      = 'https://sr0054.blob.core.windows.net/abacusshf/shf-23_ManualInstall.zip'
    }
)

# ---------------------------------------------------------------------------
# Fonctions
# ---------------------------------------------------------------------------

function Write-Log {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message,

        [ValidateSet('INFO', 'OK', 'WARN', 'ERROR')]
        [string]$Level = 'INFO'
    )

    $TimeStamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $Line = "[$TimeStamp] [$Level] $Message"

    switch ($Level) {
        'OK' {
            Write-Host $Line -ForegroundColor Green
        }

        'WARN' {
            Write-Host $Line -ForegroundColor Yellow
        }

        'ERROR' {
            Write-Host $Line -ForegroundColor Red
        }

        default {
            Write-Host $Line -ForegroundColor Cyan
        }
    }

    if ($script:LogFile) {
        Add-Content `
            -LiteralPath $script:LogFile `
            -Value $Line `
            -Encoding UTF8
    }
}

function Test-ZipArchive {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    Add-Type -AssemblyName System.IO.Compression.FileSystem

    $Archive = $null

    try {
        $Archive = [System.IO.Compression.ZipFile]::OpenRead($Path)

        if ($Archive.Entries.Count -eq 0) {
            throw "L'archive ZIP ne contient aucun fichier."
        }

        return $true
    }
    catch {
        throw "Le fichier '$Path' n'est pas une archive ZIP valide. $($_.Exception.Message)"
    }
    finally {
        if ($null -ne $Archive) {
            $Archive.Dispose()
        }
    }
}

function Invoke-Download {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Uri,

        [Parameter(Mandatory)]
        [string]$Destination,

        [ValidateRange(1, 10)]
        [int]$MaxAttempts = 3
    )

    # Activation de TLS 1.2 pour Windows PowerShell 5.1
    [Net.ServicePointManager]::SecurityProtocol = `
        [Net.ServicePointManager]::SecurityProtocol -bor `
        [Net.SecurityProtocolType]::Tls12

    for ($Attempt = 1; $Attempt -le $MaxAttempts; $Attempt++) {
        try {
            Write-Log (
                "Téléchargement vers '$Destination' - " +
                "tentative $Attempt/$MaxAttempts"
            )

            if (Test-Path -LiteralPath $Destination) {
                Remove-Item `
                    -LiteralPath $Destination `
                    -Force
            }

            $InvokeWebRequestParameters = @{
                Uri             = $Uri
                OutFile         = $Destination
                UseBasicParsing = $true
                ErrorAction     = 'Stop'
            }

            Invoke-WebRequest @InvokeWebRequestParameters

            if (-not (Test-Path -LiteralPath $Destination)) {
                throw "Le fichier téléchargé est introuvable."
            }

            $DownloadedFile = Get-Item -LiteralPath $Destination

            if ($DownloadedFile.Length -eq 0) {
                throw "Le fichier téléchargé est vide."
            }

            Test-ZipArchive -Path $Destination | Out-Null

            Write-Log (
                "Téléchargement terminé : {0:N2} Mo" -f
                ($DownloadedFile.Length / 1MB)
            ) 'OK'

            return
        }
        catch {
            Write-Log (
                "Échec du téléchargement, tentative " +
                "$Attempt/$MaxAttempts : $($_.Exception.Message)"
            ) 'WARN'

            if (Test-Path -LiteralPath $Destination) {
                Remove-Item `
                    -LiteralPath $Destination `
                    -Force `
                    -ErrorAction SilentlyContinue
            }

            if ($Attempt -eq $MaxAttempts) {
                throw
            }

            Start-Sleep -Seconds 3
        }
    }
}

# ---------------------------------------------------------------------------
# Initialisation et contrôle administrateur
# ---------------------------------------------------------------------------

try {
    $CurrentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()

    $CurrentPrincipal = New-Object `
        Security.Principal.WindowsPrincipal($CurrentIdentity)

    $IsAdministrator = $CurrentPrincipal.IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )

    if (-not $IsAdministrator) {
        throw (
            "Le script doit être exécuté dans une console " +
            "PowerShell lancée en tant qu'administrateur."
        )
    }

    if (-not (Test-Path -LiteralPath $RootFolder)) {
        New-Item `
            -Path $RootFolder `
            -ItemType Directory `
            -Force |
            Out-Null
    }

    $script:LogFile = Join-Path $RootFolder (
        'Installation_SHF_{0}.log' -f
        (Get-Date -Format 'yyyyMMdd_HHmmss')
    )

    Write-Log "Démarrage de l'installation SHF."
    Write-Log "Dossier racine : $RootFolder"
    Write-Log "Journal : $script:LogFile"

    # -----------------------------------------------------------------------
    # 1. Téléchargement et extraction
    # -----------------------------------------------------------------------

    foreach ($Package in $Packages) {
        Write-Log "Traitement du paquet '$($Package.Name)'."

        $PackageFolder = Join-Path $RootFolder $Package.Name
        $ZipPath = Join-Path $PackageFolder $Package.FileName
        $ExtractFolder = Join-Path $PackageFolder 'Extracted'

        if (-not (Test-Path -LiteralPath $PackageFolder)) {
            New-Item `
                -Path $PackageFolder `
                -ItemType Directory `
                -Force |
                Out-Null
        }

        Invoke-Download `
            -Uri $Package.Url `
            -Destination $ZipPath

        if (Test-Path -LiteralPath $ExtractFolder) {
            Write-Log (
                "Suppression de l'ancienne extraction " +
                "'$ExtractFolder'."
            )

            Remove-Item `
                -LiteralPath $ExtractFolder `
                -Recurse `
                -Force
        }

        New-Item `
            -Path $ExtractFolder `
            -ItemType Directory `
            -Force |
            Out-Null

        Write-Log "Extraction de '$($Package.FileName)'."

        Expand-Archive `
            -LiteralPath $ZipPath `
            -DestinationPath $ExtractFolder `
            -Force `
            -ErrorAction Stop

        Write-Log (
            "Archive '$($Package.FileName)' extraite dans " +
            "'$ExtractFolder'."
        ) 'OK'
    }

# -----------------------------------------------------------------------
# 2. Exécution interactive et séquentielle des scripts ManualSHF.ps1
# -----------------------------------------------------------------------

foreach ($Package in $Packages) {
    $PackageFolder = Join-Path $RootFolder $Package.Name
    $ExtractFolder = Join-Path $PackageFolder 'Extracted'

    $ManualScripts = @(
        Get-ChildItem `
            -LiteralPath $ExtractFolder `
            -Filter 'ManualSHF.ps1' `
            -File `
            -Recurse `
            -ErrorAction Stop
    )

    if ($ManualScripts.Count -eq 0) {
        throw (
            "Aucun script ManualSHF.ps1 trouvé dans " +
            "'$ExtractFolder'."
        )
    }

    if ($ManualScripts.Count -gt 1) {
        $FoundScripts = (
            $ManualScripts.FullName |
            ForEach-Object { "'$_'" }
        ) -join ', '

        throw (
            "Plusieurs scripts ManualSHF.ps1 ont été trouvés dans " +
            "'$ExtractFolder' : $FoundScripts. " +
            "L'exécution est arrêtée par sécurité."
        )
    }

    $ManualScript = $ManualScripts[0]
    $ScriptFolder = $ManualScript.Directory.FullName

    Write-Log "Exécution interactive de '$($ManualScript.FullName)'."
    Write-Log "Dossier de travail : '$ScriptFolder'."
    Write-Log (
        "Répondez aux questions affichées par le script. " +
        "Le paquet suivant ne sera pas lancé avant sa fin."
    ) 'WARN'

    $PreviousLocation = Get-Location
    $ManualScriptExitCode = $null

    try {
        # Important si ManualSHF.ps1 utilise des chemins relatifs
        Set-Location -LiteralPath $ScriptFolder

        # Le sous-script utilise la console courante :
        # - les Read-Host sont visibles ;
        # - l'utilisateur peut saisir ses réponses ;
        # - le script principal attend automatiquement sa fin.
        & "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe" `
            -NoLogo `
            -NoProfile `
            -ExecutionPolicy Bypass `
            -File $ManualScript.FullName

        $ManualScriptExitCode = $LASTEXITCODE
    }
    finally {
        Set-Location -LiteralPath $PreviousLocation
    }

    if ($null -eq $ManualScriptExitCode) {
        throw (
            "Impossible de récupérer le code de sortie de " +
            "'$($ManualScript.FullName)'."
        )
    }

    if ($ManualScriptExitCode -ne 0) {
        throw (
            "Le script '$($ManualScript.FullName)' s'est terminé " +
            "avec le code de sortie $ManualScriptExitCode."
        )
    }

    Write-Log (
        "Le script ManualSHF.ps1 du paquet " +
        "'$($Package.Name)' s'est terminé correctement."
    ) 'OK'
}

Write-Log "Tous les paquets SHF ont été installés avec succès." 'OK'

    exit 0
}
catch {
    $ErrorMessage = $_.Exception.Message

    if ($script:LogFile) {
        Write-Log $ErrorMessage 'ERROR'

        Add-Content `
            -LiteralPath $script:LogFile `
            -Value ($_ | Out-String) `
            -Encoding UTF8
    }
    else {
        Write-Host "ERREUR : $ErrorMessage" -ForegroundColor Red
    }

    exit 1
}
