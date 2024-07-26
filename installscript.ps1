# Creation des dossier pour l'ajout des licences et le telechargement de l'iso
Write-Host "Creation des dossiers"
mkdir C:\abasources
mkdir C:\abalic
# Fonction de generation d'un mot de passe aleatoire pour abacus
function Generate-RandomPassword {
    param (
        [int]$Length = 8  # Définition de la longueur du mot de passe
    )

    # Définition des caractères utilisés dans le mot de passe
    $LowerCaseChars = 'abcdefghijklmnopqrstuvwxyz'
    $UpperCaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    $NumericChars = '0123456789'
    $SpecialChars = '!@#$%^&*()-_+=<>?/[]{}|'

    # Initialisation d'un mot de passe vide
    $Password = ""

    # Ajout d'au moins un caractère de chaque type pour s'assurer de leur présence
    $Password += $LowerCaseChars | Get-Random -Count 1
    $Password += $UpperCaseChars | Get-Random -Count 1
    $Password += $NumericChars | Get-Random -Count 1
    $Password += $SpecialChars | Get-Random -Count 1

    # Génération des caractères restants
    for ($i = 0; $i -lt ($Length - 4); $i++) {
        # Sélection d'un caractère aléatoire parmi tous les types de caractères
        $RandomChar = $LowerCaseChars + $UpperCaseChars + $NumericChars + $SpecialChars | Get-Random -Count 1
        # Ajout du caractère au mot de passe
        $Password += $RandomChar
    }

    # Conversion de la chaîne en tableau de caractères, mélange et concaténation
    $Password = ($Password.ToCharArray() | Get-Random -Count $Length) -join ''
	
	return $Password
}

# Afficher les options disponibles
Write-Host "Version ABACUS souhaitee :"
Write-Host "1. v2021"
Write-Host "2. v2022"
Write-Host "3. v2023"
Write-Host "4. v2024"
# Demander à l'utilisateur de choisir une option
$choice = Read-Host "Veuillez entrer le numéro de l'option choisie (1, 2, 3 ou 4)"
# Définir la variable en fonction du choix de l'utilisateur
switch ($choice) {
    1 { $selectedOption = "v2021" }
    2 { $selectedOption = "v2022" }
    3 { $selectedOption = "v2023" }
	4 { $selectedOption = "v2024" }
    default { $selectedOption = "Option invalide" }
}
# Afficher les options disponibles
Write-Host "Version du HotFix souhaitee :"

Write-Host "1. 12.2024"
Write-Host "2. 11.2024"
Write-Host "3. 10.2024"
Write-Host "4. 09.2024"
Write-Host "5. 08.2024"
Write-Host "6. 07.2024"
Write-Host "7. 06.2024"
Write-Host "8. 05.2024"
Write-Host "9. 04.2024"
Write-Host "10. 03.2024"
Write-Host "11. 02.2024"
Write-Host "12. 01.2024"
Write-Host "13. 12.2023"
Write-Host "14. 11.2023"
Write-Host "15. 10.2023"
Write-Host "16. 09.2023"
Write-Host "17. 08.2023"
Write-Host "18. 07.2023"
Write-Host "19. 06.2023"
Write-Host "20. 05.2023"
Write-Host "21. 04.2023"
Write-Host "22. 03.2023"
Write-Host "23. 02.2023"
Write-Host "24. 01.2023"
Write-Host "25. 12.2022"
Write-Host "26. 11.2022"
Write-Host "27. 10.2022"
Write-Host "28. 09.2022"
Write-Host "29. 08.2022"
Write-Host "30. 07.2022"
Write-Host "31. 06.2022"
Write-Host "32. 05.2022"
Write-Host "33. 04.2022"
Write-Host "34. 03.2022"
Write-Host "35. 02.2022"
Write-Host "36. 01.2022"
Write-Host "37. 12.2021"
Write-Host "38. 11.2021"
Write-Host "39. 10.2021"
Write-Host "40. 09.2021"
Write-Host "41. 08.2021"
Write-Host "42. 07.2021"
Write-Host "43. 06.2021"
Write-Host "44. 05.2021"
Write-Host "45. 04.2021"
Write-Host "46. 03.2021"
Write-Host "47. 02.2021"


# Demander à l'utilisateur de choisir une option
$choice = Read-Host "Veuillez entrer le numéro de l'option choisie (1, 2, 3, etc.)"
# Définir la variable en fonction du choix de l'utilisateur
switch ($choice) {
1 { $selectedOption2 = ".12.2024" }
2 { $selectedOption2 = ".11.2024" }
3 { $selectedOption2 = ".10.2024" }
4 { $selectedOption2 = ".09.2024" }
5 { $selectedOption2 = ".08.2024" }
6 { $selectedOption2 = ".07.2024" }
7 { $selectedOption2 = ".06.2024" }
8 { $selectedOption2 = ".05.2024" }
9 { $selectedOption2 = ".04.2024" }
10 { $selectedOption2 = ".03.2024" }
11 { $selectedOption2 = ".02.2024" }
12 { $selectedOption2 = ".01.2024" }
13 { $selectedOption2 = ".12.2023" }
14 { $selectedOption2 = ".11.2023" }
15 { $selectedOption2 = ".10.2023" }
16 { $selectedOption2 = ".09.2023" }
17 { $selectedOption2 = ".08.2023" }
18 { $selectedOption2 = ".07.2023" }
19 { $selectedOption2 = ".06.2023" }
20 { $selectedOption2 = ".05.2023" }
21 { $selectedOption2 = ".04.2023" }
22 { $selectedOption2 = ".03.2023" }
23 { $selectedOption2 = ".02.2023" }
24 { $selectedOption2 = ".01.2023" }
25 { $selectedOption2 = ".12.2022" }
26 { $selectedOption2 = ".11.2022" }
27 { $selectedOption2 = ".10.2022" }
28 { $selectedOption2 = ".09.2022" }
29 { $selectedOption2 = ".08.2022" }
30 { $selectedOption2 = ".07.2022" }
31 { $selectedOption2 = ".06.2022" }
32 { $selectedOption2 = ".05.2022" }
33 { $selectedOption2 = ".04.2022" }
34 { $selectedOption2 = ".03.2022" }
35 { $selectedOption2 = ".02.2022" }
36 { $selectedOption2 = ".01.2022" }
37 { $selectedOption2 = ".12.2021" }
38 { $selectedOption2 = ".11.2021" }
39 { $selectedOption2 = ".10.2021" }
40 { $selectedOption2 = ".09.2021" }
41 { $selectedOption2 = ".08.2021" }
42 { $selectedOption2 = ".07.2021" }
43 { $selectedOption2 = ".06.2021" }
44 { $selectedOption2 = ".05.2021" }
45 { $selectedOption2 = ".04.2021" }
46 { $selectedOption2 = ".03.2021" }
default { $selectedOption2 = "Option invalide" }
}
# Afficher la variable résultante
Write-Host "Vous avez choisi : $selectedOption2"
$selectedOption3 = $selectedOption + $selectedOption2
switch ($selectedOption3) {
	"v2024.12.2024" { $isovariable = "" }
	"v2024.11.2024" { $isovariable = "" }
	"v2024.10.2024" { $isovariable = "" }
	"v2024.09.2024" { $isovariable = "" }
	"v2024.08.2024" { $isovariable = "" }
	"v2024.07.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/3ce29569bcb7e15e729f6872266f777f5766f0f291380baddc156d59fcb96853/all/v2024.201.16000-complete-15.07.2024.iso" }
	"v2024.06.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/06a8a92fa8d0b8f8f74648d326a5f0fd83e1d5c69b8397ad8f2b7c2b5b266f40/all/v2024.201.15951-complete-15.06.2024.iso" }
	"v2024.05.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/89895069d2bf9b6dcd0ad8acdb5546c882c2550466c09bc4782499c8f42da343/all/v2024.201.15914-complete-15.05.2024.iso" }
	"v2024.04.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8f9e69ad531a674c3df0be2ff144ee81d0c86a1c3f34422e555d6b534db5eda6/all/v2024.200.15872-complete-15.04.2024.iso" }
	"v2024.03.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5b62f3a6f56c32bee778d25159dc67c855868b265270d68a002d25f9d4d7cdf1/all/v2024.200.15845-complete-15.03.2024.iso" }
	"v2024.02.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/72adb0c831f04f70bf228b464a683210ff3d26e9da3890ae173c748fcbe5aa88/all/v2024.200.15818-release-15.02.2024.iso" }
	"v2023.12.2024" { $isovariable = "" }
	"v2023.11.2024" { $isovariable = "" }
	"v2023.10.2024" { $isovariable = "" }
	"v2023.09.2024" { $isovariable = "" }
    	"v2023.08.2024" { $isovariable = "" }
   	"v2023.07.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/03dd25d109d5358587f2314c6679916b9771bc3efc4b0c3494b9838115279316/all/v2023.205.15796-complete-15.07.2024.iso" }
	"v2023.06.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/1819d1ba66822cfaa42521ee1a160607f4bcd607d04a43bd9e25f7007b96a5d7/all/v2023.205.15763-complete-15.06.2024.iso" }
	"v2023.05.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ffc08d217f24d218bd6fb0db0fc7334ea864bc1e6348a21b7e22fc49ff982179/all/v2023.205.15723-complete-15.05.2024.iso" }
	"v2023.04.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/32646a68c6c38d4fb734d9edf6103e8ea17e170f5aabe975d4672481dfc8fcd6/all/v2023.205.15695-complete-15.04.2024.iso" }
	"v2023.03.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/eb7808a73fbaddf4d8830bfa698ffce57dfb70c5fe4f31ab66732b0fe0211b6c/all/v2023.205.15665-complete-15.03.2024.iso" }
	"v2023.02.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8d50d2b3dcc904850afd40edff643253f778e1ca90d5ed494d032312f519c526/all/v2023.203.15668-complete-15.02.2024.iso" }
	"v2023.01.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/2e230949e0d681fe7ebdc4a2d76068fa5907c6c8d7841530b4aff4228027638c/all/v2023.203.15635-complete-15.01.2024.iso" }
	"v2023.12.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/661ddf15b40093792fdf4b24089ff7de44f854fca59bb850e7d93d55c9d10b89/all/v2023.203.15609-complete-15.12.2023.iso" }
	"v2023.11.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/9b1a1060cc4f7b293357e6b19c3b3e87a9515abdc30ef26f1bde4cd9b9ac31e2/all/v2023.203.15580-complete-15.11.2023.iso" }
	"v2023.10.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8a1a94f76465278135af219f1d361153349c0741ff662b424f31bed7c03f6128/all/v2023.203.15552-complete-15.10.2023.iso" }
    	"v2023.09.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ace6896952981e35c205c5b7ec600e46f99fa382cc193f14ef9457a059ca4f91/all/v2023.203.15525-complete-15.09.2023.iso" }
   	"v2023.08.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ffcad0acad5156b73187c1a870947f31e1e702b4ee0d394869b4c8dae29feae5/all/v2023.201.15485-complete-15.08.2023.iso" }
	"v2023.07.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/cdfa2adb322c0da7db327429121a61ec92d4ec2cb20a62d34fd1d0696f3737d8/all/v2023.201.15460-complete-15.07.2023.iso" }
	"v2023.06.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a1ed30250beb15b27a44d6166d9921299a91a10c966b4f44a145db8312b68671/all/v2023.201.15429-complete-15.06.2023.iso" }
	"v2023.05.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/be85819280e7114a93174925fa0e7563c7990bdb401c26c270b721c9e0fd4e6d/all/v2023.201.15399-complete-15.05.2023.iso" }
	"v2023.04.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a04a74bf56ca09107edba2b9bb88e07d05b58485b012d0736a2ee7260f5df93a/all/v2023.200.15324-complete-15.04.2023.iso" }
	"v2023.03.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/31d8e4fff4ff6cd8c20efc37b0adfbaa9ecc19e8c6ea60a1b24740b6183491ea/all/v2023.200.15303-complete-28.03.2023.iso" }
	"v2023.02.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/4ae6a544a306efbd89adc249328bc0a0bc771f83396907f753671a74ac83aeea/all/v2023.200.15257-release-15.02.2023.iso" }
	"v2022.12.2024" { $isovariable = "" }
	"v2022.11.2024" { $isovariable = "" }
	"v2022.10.2024" { $isovariable = "" }
	"v2022.09.2024" { $isovariable = "" }
	"v2022.08.2024" { $isovariable = "" }
	"v2022.07.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/6e83812bd628d82db94650e7a5955e2f93c58b881d6e4fa48faf5ef54391f37a/all/v2022.204.15590-complete-15.07.2024.iso" }
	"v2022.06.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/23a3af9e3c2862c802dd1251eb3390e0be1b6336400462b834839c5db745bd42/all/v2022.204.15557-complete-15.06.2024.iso" }
	"v2022.05.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/cbd68d69361fdcf4a1a720ee7903885dea1564fa6a09adb616b3a75381456425/all/v2022.204.15513-complete-15.05.2024.iso" }
	"v2022.04.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8776bfdea48cd5b81444039661714b67ea3b8c14f591e6108f0dbf103ec6d7b3/all/v2022.204.15486-complete-15.04.2024.iso" }
	"v2022.03.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/1cbc9517a43b34c8c70e3be8fe2df57e2cf2bd702de8c5fb04628817ad84a50f/all/v2022.204.15458-complete-15.03.2024.iso" }
	"v2022.02.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/9f7d0d4228ccd1ff4fb4d3b2584cf0a5f7c81b5967be426b84919bf06a625ed3/all/v2022.204.15430-complete-15.02.2024.iso" }
	"v2022.01.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/b6e89140e30ed5a40084c0a6a8ef3fc3e926c8176ed7f509a47d3de209e5d33f/all/v2022.204.15400-complete-15.01.2024.iso" }	
	"v2022.12.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/31efafcdfa9b75402f3d4b3bfcdf6582b7211e41e76b69c599471da2d130356e/all/v2022.203.15344-complete-15.10.2023.iso" }
	"v2022.11.2023" { $isovariable = "https://storage.googleapis.com/images.abasky.net/c8d2456a9c7c89386f9f467d890f1b69de4e4e75ca173a6804da8ba9fdb322a5/all/v2022.203.15319-complete-15.09.2023.iso" }
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
$RandomPassword = Generate-RandomPassword  -Length 8
Write-Host "!!! Veuillez noter le mot de passe d'ABACUS: $RandomPassword" -ForegroundColor Red
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
