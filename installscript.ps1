# Creation des dossier pour l'ajout des licences et le telechargement de l'iso
Write-Host "Creation des dossiers"
mkdir C:\abasources
mkdir C:\abalic
# Fonction de generation d'un mot de passe aleatoire pour abacus
function Generate-RandomPassword {
    param (
        [int]$Length = 8  # Definition de la longueur du mot de passe
    )

    # Definition des caracteres utilises dans le mot de passe
    $LowerCaseChars = 'abcdefghijklmnopqrstuvwxyz'
    $UpperCaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    $NumericChars = '0123456789'
    $SpecialChars = '!@#$%^&*()-_+=<>?/[]{}|'

    # Combinaison de tous les types de caracteres
    $AllChars = $LowerCaseChars + $UpperCaseChars + $NumericChars + $SpecialChars

    # Generation d'une variable string pour le mot de passe aleatoire
    $Password = ''

    # Boucle pour la generation du mot de passe
    for ($i = 0; $i -lt $Length; $i++) {
        # Selection d'un caractere aleatoire pour le mot de passe
        $RandomChar = $AllChars | Get-Random -Count 1
        # Ajout du caractere au mot de passe
        $Password += $RandomChar
    }

    return $Password
}

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
Write-Host "1. 10.2023"
Write-Host "2. 09.2023"
Write-Host "3. 08.2023"
Write-Host "4. 07.2023"
Write-Host "5. 06.2023"
Write-Host "6. 05.2023"
Write-Host "7. 04.2023"
Write-Host "8. 03.2023"
Write-Host "9. 02.2023"
Write-Host "10. 01.2023"
Write-Host "11. 12.2022"
Write-Host "12. 11.2022"
Write-Host "13. 10.2022"
Write-Host "14. 09.2022"
Write-Host "15. 08.2022"
Write-Host "16. 07.2022"
Write-Host "17. 06.2022"
Write-Host "18. 05.2022"
Write-Host "19. 04.2022"
Write-Host "20. 03.2022"
Write-Host "21. 02.2022"
Write-Host "22. 01.2022"
Write-Host "23. 12.2021"
Write-Host "24. 11.2021"
Write-Host "25. 10.2021"
Write-Host "26. 09.2021"
Write-Host "27. 08.2021"
Write-Host "28. 07.2021"
Write-Host "29. 06.2021"
Write-Host "30. 05.2021"
Write-Host "31. 04.2021"
Write-Host "32. 03.2021"
Write-Host "33. 02.2021"

# Demander à l'utilisateur de choisir une option
$choice = Read-Host "Veuillez entrer le numéro de l'option choisie (1, 2, 3, etc.)"
# Définir la variable en fonction du choix de l'utilisateur
switch ($choice) {
    1 { $selectedOption2 = ".10.2023" }
    2 { $selectedOption2 = ".09.2023" }
    3 { $selectedOption2 = ".08.2023" }
	4 { $selectedOption2 = ".07.2023" }
    5 { $selectedOption2 = ".06.2023" }
    6 { $selectedOption2 = ".05.2023" }
	7 { $selectedOption2 = ".04.2023" }
    8 { $selectedOption2 = ".03.2023" }
    9 { $selectedOption2 = ".02.2023" }
	10 { $selectedOption2 = ".01.2023" }
	11 { $selectedOption2 = ".12.2022" }
    12 { $selectedOption2 = ".11.2022" }
    13 { $selectedOption2 = ".10.2022" }
	14 { $selectedOption2 = ".09.2022" }
    15 { $selectedOption2 = ".08.2022" }
    16 { $selectedOption2 = ".07.2022" }
	17 { $selectedOption2 = ".06.2022" }
    18 { $selectedOption2 = ".05.2022" }
    19 { $selectedOption2 = ".04.2022" }
	20 { $selectedOption2 = ".03.2022" }
    21 { $selectedOption2 = ".02.2022" }
    22 { $selectedOption2 = ".01.2022" }
	23 { $selectedOption2 = ".12.2021" }
    24 { $selectedOption2 = ".11.2021" }
    25 { $selectedOption2 = ".10.2021" }
	26 { $selectedOption2 = ".09.2021" }
    27 { $selectedOption2 = ".08.2021" }
    28 { $selectedOption2 = ".07.2021" }
	29 { $selectedOption2 = ".06.2021" }
    30 { $selectedOption2 = ".05.2021" }
    31 { $selectedOption2 = ".04.2021" }
    32 { $selectedOption2 = ".03.2021" }
    default { $selectedOption2 = "Option invalide" }
}
# Afficher la variable résultante
Write-Host "Vous avez choisi : $selectedOption2"
$selectedOption3 = $selectedOption + $selectedOption2
switch ($selectedOption3) {
	"v2023.10.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8a1a94f76465278135af219f1d361153349c0741ff662b424f31bed7c03f6128/all/v2023.203.15552-complete-15.10.2023.iso" }
    "v2023.09.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ace6896952981e35c205c5b7ec600e46f99fa382cc193f14ef9457a059ca4f91/all/v2023.203.15525-complete-15.09.2023.iso" }
    "v2023.08.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ffcad0acad5156b73187c1a870947f31e1e702b4ee0d394869b4c8dae29feae5/all/v2023.201.15485-complete-15.08.2023.iso" }
	"v2023.07.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/cdfa2adb322c0da7db327429121a61ec92d4ec2cb20a62d34fd1d0696f3737d8/all/v2023.201.15460-complete-15.07.2023.iso" }
	"v2023.06.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a1ed30250beb15b27a44d6166d9921299a91a10c966b4f44a145db8312b68671/all/v2023.201.15429-complete-15.06.2023.iso" }
	"v2023.05.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/be85819280e7114a93174925fa0e7563c7990bdb401c26c270b721c9e0fd4e6d/all/v2023.201.15399-complete-15.05.2023.iso" }
	"v2023.04.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a04a74bf56ca09107edba2b9bb88e07d05b58485b012d0736a2ee7260f5df93a/all/v2023.200.15324-complete-15.04.2023.iso" }
	"v2023.03.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/31d8e4fff4ff6cd8c20efc37b0adfbaa9ecc19e8c6ea60a1b24740b6183491ea/all/v2023.200.15303-complete-28.03.2023.iso" }
	"v2023.02.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/4ae6a544a306efbd89adc249328bc0a0bc771f83396907f753671a74ac83aeea/all/v2023.200.15257-release-15.02.2023.iso" }
	"v2022.10.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/31efafcdfa9b75402f3d4b3bfcdf6582b7211e41e76b69c599471da2d130356e/all/v2022.203.15344-complete-15.10.2023.iso" }
	"v2022.09.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/c8d2456a9c7c89386f9f467d890f1b69de4e4e75ca173a6804da8ba9fdb322a5/all/v2022.203.15319-complete-15.09.2023.iso" }
	"v2022.08.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a693eb476775537258cc1d95134ab225fa8ef1c8a1d11f9bf9eeb0de3310c00e/all/v2022.203.15288-complete-15.08.2023.iso" }
	"v2022.07.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/1223bdc13c6fcf632c69e1b3b2bc1be259b9f6f84adf43ae80e3be01206d81af/all/v2022.203.15257-complete-15.07.2023.iso" }
	"v2022.06.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/f2a13fefc300fc6bc8fa7a061f41f4bf8a02c0f0609a141742e9082d89f157e5/all/v2022.203.15219-complete-15.06.2023.iso" }
	"v2022.05.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/09e1b7c074f35e885e1a2bad0a3813b0abc9b694295c709c35d681712c2cba11/all/v2022.203.15189-complete-15.05.2023.iso" }
	"v2022.04.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/30834087f23fd2907cd856fe0e47dbe313724a578993c00430e86c222c9a6a16/all/v2022.203.15157-complete-15.04.2023.iso" }
	"v2022.03.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/20db57a5dc28698f1da12cb83c6742df8a10c04ebf58a3c2ad70c8fe5beeb1ed/all/v2022.203.15136-complete-28.03.2023.iso" }
	"v2022.02.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/edd7cf39438dec6dc4f3cfa3162f5788d56fad54fc8dc41175925199400e3d60/all/v2022.202.15098-complete-15.02.2023.iso" }
	"v2022.01.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5fa23f3c3c636da51a901f9bce2ac045aac15b0e5eaaf9142e529f271c4360f2/all/v2022.202.15067-complete-15.01.2023.iso" }
	"v2022.12.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/86da3449b6dd5d8b1371d70f960366a2fe5aa720cf2eedc35556b2170e6e1295/all/v2022.202.15034-complete-15.12.2022.iso" }
	"v2022.11.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/122ac66edefd8544001339e7621af15577be3f12544844682a0b67be1ab0b0f1/all/v2022.202.15006-complete-15.11.2022.iso" }
	"v2022.10.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/e9431455977656817d61e0b904fa7a6956336748b5755ed5998c61525d4487d1/all/v2022.202.14973-complete-15.10.2022.iso" }
	"v2022.09.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5f097988c695c7ed55c9bddefd5c7761d0ab96d547d3f3e7c53400f8ffa77f90/all/v2022.202.14953-complete-30.09.2022.iso" }
	"v2022.08.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/d9ace57edd7b91a2bf85f5ae9bb82dc4d93f1307898c0f91af962fda7de2c0e2/all/v2022.201.14829-complete-15.08.2022.iso" }
	"v2022.07.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/b037feaac2cb23da3f15697a0fb071b7f292b0442791ae044e806a1904392f68/all/v2022.201.14801-complete-15.07.2022.iso" }
	"v2022.06.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/bb30eeb7b8b3b77c406757206e1c770f6488d5bfa9c471304fdd26d11a1e60d4/all/v2022.201.14759-complete-15.06.2022.iso" }
	"v2022.05.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/e70fe48caf1028cdcf2af345103df3cee9798c98dd1ca65a979b540ce6f14343/all/v2022.201.14729-complete-15.05.2022.iso" }
	"v2022.04.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5396f9cf6af4bca58188ba96d972508fbf25e74c613e20c2f5f4aae4d206a618/all/v2022.200.14601-complete-15.04.2022.iso" }
	"v2022.03.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/cb0a6cf788ce07421bcbfd4aa81afaa2c30131b85b1dba8e6ca1eeba10892569/all/v2022.200.14562-complete-15.03.2022.iso" }
	"v2022.02.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/fb44e5e5cb5e1c122a050427890c6b7f93282a0d2354c9b2601aa88faa69259f/all/v2022.200.14525-release-15.02.2022.iso" }
	"v2021.10.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/0a2a7ddce7fd91b7ce22b215738505e57caae684629a216653637c2f5bd91a87/all/v2021.207.14689-complete-15.10.2023.iso" }
	"v2021.09.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/fc8a0bf7575ab1bba3b97dac29d2b3142bfc4eb4c7fe98a8ee1732c55a1203ad/all/v2021.207.14672-complete-15.09.2023.iso" }
	"v2021.08.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/1a7dc06f981b28560a898953801fc3917a9b86aac7d5ab4d95fbfffa36cc4eb3/all/v2021.207.14642-complete-15.08.2023.iso" }
	"v2021.07.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/45a429e6650513483cb4a6006887ef44a06a77bbacfc3183ab203b70a931fab9/all/v2021.206.14699-complete-15.07.2023.iso" }
	"v2021.06.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ae88588b62d1e49b20bd2b3259a7db68b84cfe0e3b82f762504c4996e8f81687/all/v2021.206.14671-complete-15.06.2023.iso" }
	"v2021.05.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/2c8f5173e7bc57a365d764da871d5ab88f172e334ee91ddcc2fb1655cb322757/all/v2021.206.14640-complete-15.05.2023.iso" }
	"v2021.04.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/678bf8a3997a0f4460af74d069c0a330b891cf308c60a5b7b0880438309e60da/all/v2021.206.14610-complete-15.04.2023.iso" }
	"v2021.03.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a273cafc885f1be201f46f1521d3424bfa3aa805684aca3a0d21073669c7b0ce/all/v2021.206.14577-complete-15.03.2023.iso" }
	"v2021.02.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/558cc775e4873060d911df1b98695d78ad20d91aa1f784ba9ddaf55eb573d943/all/v2021.206.14543-complete-15.02.2023.iso" }
	"v2021.01.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/752332b6ee7d162ffd2aef6d981362f40dc0b1f478bed62ca0a64be000dd6938/all/v2021.206.14514-complete-15.01.2023.iso" }
	"v2021.12.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/32b3d5ec387be26ba429b973dc55b19e04872a3642de94ad469ab5e013fa30a9/all/v2021.206.14481-complete-15.12.2022.iso" }
	"v2021.11.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/9499e23c7dd9ba5ab0c5f2c90b1902c95a70a67d1f53833ca04787c5243e9a72/all/v2021.206.14453-complete-15.11.2022.iso" }
	"v2021.10.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/33e4522b09a8b3550d44fef1e098400343c1e8168748a1ffc42d2e662c458ca1/all/v2021.205.14415-complete-15.10.2022.iso" }
	"v2021.09.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/24f724faad3ee33b0e4d9a709eb04e5f06565def463be031741b0ad3400b57bb/all/v2021.205.14382-complete-15.09.2022.iso" }
	"v2021.08.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/c6e76b2224b0d3cc1d8381dc9d11caa9b25a3d6aa71372c887c293f28dbb76d3/all/v2021.205.14348-complete-15.08.2022.iso" }
	"v2021.07.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/c11139a8aa8bbba35b147c64cfcd0bdef63fae1c252d4cb587a013d547f8199a/all/v2021.205.14322-complete-15.07.2022.iso" }
	"v2021.06.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/d550293c2d022063cf27789bb3fb6736076ec4fb4827e3682b29c23fe8497efb/all/v2021.204.14290-complete-15.06.2022.iso" }
	"v2021.05.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/45f932889844cd2d2faa3203da8037b93a6b5cfee905c1cadd8713d995c5bfe4/all/v2021.204.14260-complete-15.05.2022.iso" }
	"v2021.04.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/4476718151bdf7a7110a581a0ffe06f7981a5cefc06568d3a7234fe351fad422/all/v2021.204.14234-complete-15.04.2022.iso" }
	"v2021.03.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/4dcb0c53f37f6bbb06f471bdac311f03bb50a484eb7c0bb75aa1d2e86a653779/all/v2021.204.14194-complete-15.03.2022.iso" }
	"v2021.02.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8ba2cbc79ff7d892dfbced9b0e9ac8f72d037ba2c51768178c2d5bf9487353a7/all/v2021.202.14138-complete-15.02.2022.iso" }
	"v2021.01.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/b928033a49040adffbb3a58dff30a3695f0ddb2003de4989f8abd1864272e236/all/v2021.202.14108-complete-15.01.2022.iso" }
	"v2021.12.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/b2096a3ee9396680ee254135b18f0ec969d9b4089fccc730d70259a1982f1c50/all/v2021.202.14080-complete-15.12.2021.iso" }
	"v2021.11.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/1b80206b8da21cc716bbb9a448ee1df9ee9b9063fde2c3f580a9c5eb0ded7cda/all/v2021.202.14043-complete-15.11.2021.iso" }
	"v2021.10.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/7d718f3c8f82733915f299671e6e5fa83e4dc5036be00f6ea4ce36e99a8a0e8f/all/v2021.202.14019-complete-20.10.2021.iso" }
	"v2021.09.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/4d6978a7045006e4e1ab3dedc93f9c588f67a49aeaa40e3fb343660b3557783e/all/v2021.202.13975-complete-15.09.2021.iso" }
	"v2021.08.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/2fd8790d7b1a90236a0906ac28a556d0814191b9c503e18d29e8ad85a227bbd2/all/v2021.201.13902-complete-15.08.2021.iso" }
	"v2021.07.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/449e448ed5c489265e96f6b866480d907a91ab537cf6ab6599df799e0bfeb087/all/v2021.201.13867-complete-15.07.2021.iso" }
	"v2021.06.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5c5809c3f90f6f6b6ec873e0a516f9226a3d23537f96c6632fdaa229c75cbfa5/all/v2021.201.13836-complete-15.06.2021.iso" }
	"v2021.05.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/64d35114cb2d4b980a644aada615929abc579bcd917bf126c0d6a28546e0f7c3/all/v2021.201.13808-complete-15.05.2021.iso" }
	"v2021.04.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a593ea471f5a92473a515cff84b90b0a879e1625b2f687ad6761320d131d34dd/all/v2021.200.13701-complete-15.04.2021.iso" }
	"v2021.03.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/c6462f4c72a97272cd09bb6af444a3cdf5b3ed191889cc38b9a58fc87dce7711/all/v2021.200.13668-complete-15.03.2021.iso" }
	"v2021.02.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/1411b4241da32e44a68614c8583f5e29bb1ef635c78fa7d8f525dabfd002e033/all/v2021.200.13641-release-15.02.2021.iso" }
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
# Creation du mot de passe aleatoire pour ABACUS
$RandomPassword = Generate-RandomPassword -Length 8
Write-Host "!!!! Merci de noter le mot de passe d'ABACUS : $RandomPassword"
$env:ABASETUP_ADMINPASSWORD=$RandomPassword
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
