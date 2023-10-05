Write-Host "Creation des dossiers"
mkdir C:\abasources
mkdir C:\abalic
# Afficher les options disponibles
Write-Host "Version ABACUS souhaitee :"
Write-Host "1. v2021"
Write-Host "2. v2022"
Write-Host "3. v2023"
# Demander à l'utilisateur de choisir une option
$choice = Read-Host "Veuillez entrer le numéro de l'option choisie (1, 2 ou 3)"
# Définir la variable en fonction du choix de l'utilisateur
switch ($choice) {
    1 { $selectedOption = "v2021" }
    2 { $selectedOption = "v2022" }
    3 { $selectedOption = "v2023" }
    default { $selectedOption = "Option invalide" }
}
# Afficher les options disponibles
Write-Host "Version du HotFix souhaitee :"
Write-Host "1. 09.2023"
Write-Host "2. 08.2023"
Write-Host "3. 07.2023"
Write-Host "4. 06.2023"
Write-Host "5. 05.2023"
Write-Host "6. 04.2023"
Write-Host "7. 03.2023"
Write-Host "8. 02.2023"
Write-Host "9. 01.2023"
Write-Host "10. 12.2022"
Write-Host "11. 11.2022"
Write-Host "12. 10.2022"
Write-Host "13. 09.2022"
Write-Host "14. 08.2022"
Write-Host "15. 07.2022"
Write-Host "16. 06.2022"
Write-Host "17. 05.2022"
Write-Host "18. 04.2022"
Write-Host "19. 03.2022"
Write-Host "20. 02.2022"
Write-Host "21. 01.2022"
Write-Host "22. 12.2021"
Write-Host "23. 11.2021"
Write-Host "24. 10.2021"
Write-Host "25. 09.2021"
Write-Host "26. 08.2021"
Write-Host "27. 07.2021"
Write-Host "28. 06.2021"
Write-Host "29. 05.2021"
Write-Host "30. 04.2021"
Write-Host "31. 03.2021"
Write-Host "32. 02.2021"
# Demander à l'utilisateur de choisir une option
$choice = Read-Host "Veuillez entrer le numéro de l'option choisie (1, 2, 3, etc.)"
# Définir la variable en fonction du choix de l'utilisateur
switch ($choice) {
    1 { $selectedOption2 = ".09.2023" }
    2 { $selectedOption2 = ".08.2023" }
    3 { $selectedOption2 = ".07.2023" }
	4 { $selectedOption2 = ".06.2023" }
    5 { $selectedOption2 = ".05.2023" }
    6 { $selectedOption2 = ".04.2023" }
	7 { $selectedOption2 = ".03.2023" }
    8 { $selectedOption2 = ".02.2023" }
    9 { $selectedOption2 = ".01.2023" }
	10 { $selectedOption2 = ".12.2022" }
    11 { $selectedOption2 = ".11.2022" }
    12 { $selectedOption2 = ".10.2022" }
	13 { $selectedOption2 = ".09.2022" }
    14 { $selectedOption2 = ".08.2022" }
    15 { $selectedOption2 = ".07.2022" }
	16 { $selectedOption2 = ".06.2022" }
    17 { $selectedOption2 = ".05.2022" }
    18 { $selectedOption2 = ".04.2022" }
	19 { $selectedOption2 = ".03.2022" }
    20 { $selectedOption2 = ".02.2022" }
    21 { $selectedOption2 = ".01.2022" }
	22 { $selectedOption2 = ".12.2021" }
    23 { $selectedOption2 = ".11.2021" }
    24 { $selectedOption2 = ".10.2021" }
	25 { $selectedOption2 = ".09.2021" }
    26 { $selectedOption2 = ".08.2021" }
    27 { $selectedOption2 = ".07.2021" }
	28 { $selectedOption2 = ".06.2021" }
    29 { $selectedOption2 = ".05.2021" }
    30 { $selectedOption2 = ".04.2021" }
    31 { $selectedOption2 = ".03.2021" }
    32 { $selectedOption2 = ".02.2021" }	
    default { $selectedOption2 = "Option invalide" }
}
# Afficher la variable résultante
Write-Host "Vous avez choisi : $selectedOption2"
$selectedOption3 = $selectedOption + $selectedOption2
switch ($selectedOption3) {
    "v2021.09.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/fc8a0bf7575ab1bba3b97dac29d2b3142bfc4eb4c7fe98a8ee1732c55a1203ad/all/v2021.207.14672-complete-15.09.2023.iso" }
    "v2022.09.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/c8d2456a9c7c89386f9f467d890f1b69de4e4e75ca173a6804da8ba9fdb322a5/all/v2022.203.15319-complete-15.09.2023.iso" }
    "v2023.09.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ace6896952981e35c205c5b7ec600e46f99fa382cc193f14ef9457a059ca4f91/all/v2023.203.15525-complete-15.09.2023.iso" }
    default { $isovariable ="Option invalide" }
}
Write-Host "Telechargement du fichier iso"
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($isovariable,"C:\abasources\abacus.iso")
Write-Host "Montage du fichier iso"
$ImagePath= "C:\abasources\abacus.iso"
$ISODrive = (Get-DiskImage -ImagePath $ImagePath | Get-Volume).DriveLetter
IF (!$ISODrive) {
Mount-DiskImage -ImagePath $ImagePath -StorageType ISO
}
$ISODrive = (Get-DiskImage -ImagePath $ImagePath | Get-Volume).DriveLetter
$SetupPathAbacus = $ISODrive + ":\"
Write-Host "Definissez le mot de passe de l'administrateur ABACUS"
$env:ABASETUP_ADMINPASSWORD=Read-Host "Veuillez entrer le mot de passe :"
$env:ABASETUP_UNATTENDED=1
$env:ABASETUP_LANGUAGESETUP="fr"
$env:ABASETUP_METHODVISERVER=1
$env:ABASETUP_TARGETDIR="C:\"
$env:ABASETUP_REGISTRATION_LOCATION="C:\abalic\abareg.xml"
Write-Host "Merci de copier le fichier abareg.xml dans le dossier C:\abalic\ avant de continuer"
pause
Write-Host "Lancement de l'installation automatisée d'abacus"
cd $SetupPathAbacus
.\abasetup.exe