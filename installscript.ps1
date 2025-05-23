# Verification et creation des dossier si besoin pour l'ajout des licences et le telechargement de l'iso
$abasourcesfolder = "C:\abasources"
Write-Host "Creation des dossiers"
if (-not (Test-Path $abasourcesfolder)) {
    # Si le dossier n'existe pas, le créer
    New-Item -Path $abasourcesfolder -ItemType Directory
    Write-Host "Le dossier C:\abasources a ete cree."
} else {
    Write-Host "Le dossier C:\abasources existe deja."
}
$abalicfolder = "C:\abalic"
if (-not (Test-Path $abalicfolder)) {
    # Si le dossier n'existe pas, le créer
    New-Item -Path $abalicfolder -ItemType Directory
    Write-Host "Le dossier C:\abalic a ete cree."
} else {
    Write-Host "Le dossier C:\abalic existe deja."
}
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
# Boucle pour le choix de version
do {
# Afficher les options disponibles
Write-Host "Version ABACUS souhaitee :"
Write-Host "1. v2020"
Write-Host "2. v2021"
Write-Host "3. v2022"
Write-Host "4. v2023"
Write-Host "5. v2024"
Write-Host "6. v2025"
# Demander à l'utilisateur de choisir une option
$choice = Read-Host "Veuillez entrer le numéro de l'option choisie (1-6)"
# Définir la variable en fonction du choix de l'utilisateur
switch ($choice) {
    1 { $selectedOption = "v2020" }
    2 { $selectedOption = "v2021" }
    3 { $selectedOption = "v2022" }
    4 { $selectedOption = "v2023" }
    5 { $selectedOption = "v2024" }
    6 { $selectedOption = "v2025" }
    default { $selectedOption = "Option invalide" }
}
} until ($choice -gt 0)
# Boucle pour le choix de HF
do {
# Afficher les options disponibles
Write-Host "Version du HotFix souhaitee :"

Write-Host "1. 03.2025"
Write-Host "2. 02.2025"
Write-Host "3. 01.2025"
Write-Host "4. 12.2024"
Write-Host "5. 11.2024"
Write-Host "6. 10.2024"
Write-Host "7. 09.2024"
Write-Host "8. 08.2024"
Write-Host "9. 07.2024"
Write-Host "10. 06.2024"
Write-Host "11. 05.2024"
Write-Host "12. 04.2024"
Write-Host "13. 03.2024"
Write-Host "14. 02.2024"
Write-Host "15. 01.2024"
Write-Host "16. 12.2023"
Write-Host "17. 11.2023"
Write-Host "18. 10.2023"
Write-Host "19. 09.2023"
Write-Host "20. 08.2023"
Write-Host "21. 07.2023"
Write-Host "22. 06.2023"
Write-Host "23. 05.2023"
Write-Host "24. 04.2023"
Write-Host "25. 03.2023"
Write-Host "26. 02.2023"
Write-Host "27. 01.2023"
Write-Host "28. 12.2022"
Write-Host "29. 11.2022"
Write-Host "30. 10.2022"
Write-Host "31. 09.2022"
Write-Host "32. 08.2022"
Write-Host "33. 07.2022"
Write-Host "34. 06.2022"
Write-Host "35. 05.2022"
Write-Host "36. 04.2022"
Write-Host "37. 03.2022"
Write-Host "38. 02.2022"
Write-Host "39. 01.2022"
Write-Host "40. 12.2021"
Write-Host "41. 11.2021"
Write-Host "42. 10.2021"
Write-Host "43. 09.2021"
Write-Host "44. 08.2021"
Write-Host "45. 07.2021"
Write-Host "46. 06.2021"
Write-Host "47. 05.2021"
Write-Host "48. 04.2021"
Write-Host "49. 03.2021"
Write-Host "50. 02.2021"
Write-Host "51. 01.2021"
Write-Host "52. 12.2020"
Write-Host "53. 11.2020"
Write-Host "54. 10.2020"
Write-Host "55. 09.2020"
Write-Host "56. 08.2020"
Write-Host "57. 07.2020"
Write-Host "58. 06.2020"
Write-Host "59. 05.2020"
Write-Host "60. 04.2020"
Write-Host "61. 03.2020"
Write-Host "62. 02.2020"


# Demander à l'utilisateur de choisir une option
$choice = Read-Host "Veuillez entrer le numéro de l'option choisie (1, 2, 3, etc.)"
# Définir la variable en fonction du choix de l'utilisateur
switch ($choice) {
1 { $selectedOption2 = ".03.2025" }
2 { $selectedOption2 = ".02.2025" }
3 { $selectedOption2 = ".01.2025" }
4 { $selectedOption2 = ".12.2024" }
5 { $selectedOption2 = ".11.2024" }
6 { $selectedOption2 = ".10.2024" }
7 { $selectedOption2 = ".09.2024" }
8 { $selectedOption2 = ".08.2024" }
9 { $selectedOption2 = ".07.2024" }
10 { $selectedOption2 = ".06.2024" }
11 { $selectedOption2 = ".05.2024" }
12 { $selectedOption2 = ".04.2024" }
13 { $selectedOption2 = ".03.2024" }
14 { $selectedOption2 = ".02.2024" }
15 { $selectedOption2 = ".01.2024" }
16 { $selectedOption2 = ".12.2023" }
17 { $selectedOption2 = ".11.2023" }
18 { $selectedOption2 = ".10.2023" }
19 { $selectedOption2 = ".09.2023" }
20 { $selectedOption2 = ".08.2023" }
21 { $selectedOption2 = ".07.2023" }
22 { $selectedOption2 = ".06.2023" }
23 { $selectedOption2 = ".05.2023" }
24 { $selectedOption2 = ".04.2023" }
25 { $selectedOption2 = ".03.2023" }
26 { $selectedOption2 = ".02.2023" }
27 { $selectedOption2 = ".01.2023" }
28 { $selectedOption2 = ".12.2022" }
29 { $selectedOption2 = ".11.2022" }
30 { $selectedOption2 = ".10.2022" }
31 { $selectedOption2 = ".09.2022" }
32 { $selectedOption2 = ".08.2022" }
33 { $selectedOption2 = ".07.2022" }
34 { $selectedOption2 = ".06.2022" }
35 { $selectedOption2 = ".05.2022" }
36 { $selectedOption2 = ".04.2022" }
37 { $selectedOption2 = ".03.2022" }
38 { $selectedOption2 = ".02.2022" }
39 { $selectedOption2 = ".01.2022" }
40 { $selectedOption2 = ".12.2021" }
41 { $selectedOption2 = ".11.2021" }
42 { $selectedOption2 = ".10.2021" }
43 { $selectedOption2 = ".09.2021" }
44 { $selectedOption2 = ".08.2021" }
45 { $selectedOption2 = ".07.2021" }
46 { $selectedOption2 = ".06.2021" }
47 { $selectedOption2 = ".05.2021" }
48 { $selectedOption2 = ".04.2021" }
49 { $selectedOption2 = ".03.2021" }
50 { $selectedOption2 = ".02.2021" }
51 { $selectedOption2 = ".01.2021" }
52 { $selectedOption2 = ".12.2020" }
53 { $selectedOption2 = ".11.2020" }
54 { $selectedOption2 = ".10.2020" }
55 { $selectedOption2 = ".09.2020" }
56 { $selectedOption2 = ".08.2020" }
57 { $selectedOption2 = ".07.2020" }
58 { $selectedOption2 = ".06.2020" }
59 { $selectedOption2 = ".05.2020" }
60 { $selectedOption2 = ".04.2020" }
61 { $selectedOption2 = ".03.2020" }
62 { $selectedOption2 = ".02.2020" }
default { $selectedOption2 = "Option invalide" }
}
} until ($choice -gt 0)
# Afficher la variable résultante
$selectedOption3 = $selectedOption + $selectedOption2
Write-Host "Vous avez choisi : $selectedOption3"
switch ($selectedOption3) {
	"v2025.03.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/84bad47bfe62b7b2a0575a3ea84feb6df9f41cd93dc9f0ced60e8b47a9aa7813/all/v2025.200.16549-complete-15.03.2025.iso" }
 	"v2025.02.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/da966d8f3406a1b4d68b926753359da845f0dc98d4be73689381614aa09b0e7f/all/v2025.200.16519-release-15.02.2025.iso" }	
 	"v2025.01.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/e54b8eace515107f778ee01af3f879a560d08ea5217b6cfeb24bc7f02d988e4e/all/v2025.100.16497-complete-15.01.2025.iso" }
 	"v2025.12.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/412d496dfa1afcc8ba26e3996ac19cfe448369cf9c3fbf5d48ef219514e8cc13/all/v2025.100.16463-complete-15.12.2024.iso" }
	"v2024.03.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a4899a9e2b0ebbd5a5f2d537e4ab3aa4a09fa5b0a16a70530f3a9b7d322d9f1e/all/v2024.203.16268-complete-15.03.2025.iso" }	
 	"v2024.02.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ac074f505d92e6e1a3f9b4c1243d801c08da2111fde4e5c57379f9a48f2760ec/all/v2024.202.16260-complete-15.02.2025.iso" }	
  	"v2024.01.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/438cff49997d417fe94fa37223a253fdb932b41d65aa46da13bc2296133581ff/all/v2024.202.16227-complete-15.01.2025.iso" }
 	"v2024.12.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5ce860a5a02cf068a53a43e126467b2c708d601a34c19e739dabbac7a7bff69a/all/v2024.202.16194-complete-15.12.2024.iso" }
	"v2024.11.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/e2652265d5ea905981735af2ce3b1dbaf9369844cf3a31d7a008c907bf4459ef/all/v2024.202.16163-complete-15.11.2024.iso" }
	"v2024.10.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/36f3145ec4134be37a2b10e7baf4c7657152bc30ddade1dc7294b6e8fead1999/all/v2024.202.16127-complete-15.10.2024.iso" }
	"v2024.09.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a6f511029e5df057bdf99f7452a266a2a889d01e9ac78405a0d5b8c7ae7b17a9/all/v2024.202.16094-complete-15.09.2024.iso" }
	"v2024.08.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/102bd77dba4311553470393184a72659b8be02ac73e0996cb6b29b0987646799/all/v2024.201.16036-complete-15.08.2024.iso" }
	"v2024.07.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/3ce29569bcb7e15e729f6872266f777f5766f0f291380baddc156d59fcb96853/all/v2024.201.16000-complete-15.07.2024.iso" }
	"v2024.06.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/06a8a92fa8d0b8f8f74648d326a5f0fd83e1d5c69b8397ad8f2b7c2b5b266f40/all/v2024.201.15951-complete-15.06.2024.iso" }
	"v2024.05.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/89895069d2bf9b6dcd0ad8acdb5546c882c2550466c09bc4782499c8f42da343/all/v2024.201.15914-complete-15.05.2024.iso" }
	"v2024.04.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8f9e69ad531a674c3df0be2ff144ee81d0c86a1c3f34422e555d6b534db5eda6/all/v2024.200.15872-complete-15.04.2024.iso" }
	"v2024.03.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5b62f3a6f56c32bee778d25159dc67c855868b265270d68a002d25f9d4d7cdf1/all/v2024.200.15845-complete-15.03.2024.iso" }
	"v2024.02.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/72adb0c831f04f70bf228b464a683210ff3d26e9da3890ae173c748fcbe5aa88/all/v2024.200.15818-release-15.02.2024.iso" }
	"v2023.03.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/ade13b474573d8f01d50a4f493b642442d002ab4c06f3738d6e7f54f94d649c8/all/v2023.206.16021-complete-15.03.2025.iso" }
 	"v2023.02.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5dbeff3a32f26a2e9d298957ff70c32bda6539c2752592d6dcd17bcbfcf6f49b/all/v2023.206.15992-complete-15.02.2025.iso" }
	"v2023.01.2025" { $isovariable = "https://storage.googleapis.com/images.abasky.net/d8dfb345d6fb9c3f5ea44d61940f25fab3b6e3173b7798b38beeb59eb0345610/all/v2023.206.15957-complete-15.01.2025.iso" }
 	"v2023.12.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/1fcbe509f8651a62441bfad1a5b66c2fc08d6506d7eddd5e016e0d7cc77b17a9/all/v2023.206.15922-complete-15.12.2024.iso" }
	"v2023.11.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/db156f76166b316ff3f1d5886b227aa022d5556f63abdcbade0a0e1ddd18c6c8/all/v2023.206.15891-complete-15.11.2024.iso" }
	"v2023.10.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a7112a0d75f01c594d52246f09e56549acb71483acc050f9843a4ee6c5fdfa67/all/v2023.205.15891-complete-15.10.2024.iso" }
	"v2023.09.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a56af6bd4352801240b71b796a0b0e60e79eb4c855aeb22b33455adb384aaf32/all/v2023.205.15861-complete-15.09.2024.iso" }
    	"v2023.08.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/909e70992ba3f0f0f8604ad2a5cb72be8e087dd2432b62062dac94c6925214f1/all/v2023.205.15833-complete-15.08.2024.iso" }
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
	"v2022.10.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/560c09b6ccd0a1d7cbb166a0534bc430056438f9ac19acd92103554199eef14c/all/v2022.205.15605-complete-15.10.2024.iso" }
	"v2022.09.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/dee48ee9b738fc97084afd13444bdb6eb67396448081db9b96a887c51b9536c2/all/v2022.205.15576-complete-15.09.2024.iso" }
	"v2022.08.2024" { $isovariable = "https://storage.googleapis.com/images.abasky.net/024b2ebdbb8b604be67e88d38e84f838720d1061bd4827f8c2a1b3719845fecd/all/v2022.205.15542-complete-15.08.2024.iso" }
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
 	"v2020.10.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/26af1e70eb7aee62fb79819d85af5101bbe1855a3f024e3bf9e7587d3f6b0f57/all/v2020.206.13869-complete-15.10.2022.iso" }
  	"v2020.09.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8db3616bba0e03d25f8a18d30c4fa4d708e7fe4951d256b2d2a0592d2a70767e/all/v2020.206.13842-complete-15.09.2022.iso" }
   	"v2020.08.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a435ecd930e00e7d0a45add212b4f5101757555a60928bdf1f3f11ca1305f6f9/all/v2020.206.13813-complete-15.08.2022.iso" }
    	"v2020.07.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/d7fad8318c032e9dad7a4a4e178141ecd7e7691a0113a07075cf7309a348e480/all/v2020.205.13879-complete-15.07.2022.iso" }
       	"v2020.06.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/9f5591d6ad57dbaba866dda77788e4a00e6e73cf6b0120cb9b74fb95334a637b/all/v2020.205.13849-complete-15.06.2022.iso" }
   	"v2020.05.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/d41c034a38e8704199cf1aaf9cb7353285ffaea2e660ec8ca75250be861795c3/all/v2020.205.13823-complete-15.05.2022.iso" }
    	"v2020.04.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/bb8309825a56e3c711fe33c7352555493e38b56f19982bded35099004dd13941/all/v2020.205.13798-complete-15.04.2022.iso" }
       	"v2020.03.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/b9ce29c0eb5eaf11bce43f05d0d11d5056bcc285843170fb6587cc3ae4fbe734/all/v2020.205.13762-complete-15.03.2022.iso" }
   	"v2020.02.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/234d65469b07109bde2bec91431f0264d7cd8f62aec8531d370a2b552481f085/all/v2020.205.13731-complete-15.02.2022.iso" }
    	"v2020.01.2022" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a696c3e70791a2081ee66e74f6cfc36f130578c76b657f27051e6746c06e42a9/all/v2020.205.13701-complete-15.01.2022.iso" }
       	"v2020.12.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/6072dfc88e08532b74555eb3c57c485d035e12222c902a60136df84d679a707f/all/v2020.205.13672-complete-15.12.2021.iso" }
   	"v2020.11.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/6db34bbe654d0eabef7b51050bcc1ceeb622efc1da215803a2dd9ceb1d9a1805/all/v2020.205.13640-complete-15.11.2021.iso" }
    	"v2020.10.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/82020061e1c7d3fa020335e1f1d6ffcb79f9c27eb8dcaa4414e59ab1b8f27bb7/all/v2020.204.13572-complete-15.10.2021.iso" }
       	"v2020.09.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/f40c67d3e0e9a79bbff86bf3bf45f17f1e11e509de781d7a392d21442de22b31/all/v2020.204.13540-complete-15.09.2021.iso" }
   	"v2020.08.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8f0e98b2372976af55444227d62259f886228d6f71183ef681da964569d76b89/all/v2020.204.13512-complete-15.08.2021.iso" }
    	"v2020.07.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/e05fc069990dfab90f83f8e83f0665dd86bc159315c031f054c1c0c54d1fb1ba/all/v2020.204.13477-complete-15.07.2021.iso" }
       	"v2020.06.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/53d7508a70d927e34d3333affcd3e376192e9710b8a1183f64389b868bf8663c/all/v2020.204.13449-complete-15.06.2021.iso" }
   	"v2020.05.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/69d5b88d2f6318ec4065d6a5de0b88ae6fe13c9f8633fe78c83e93d1fc9885db/all/v2020.204.13423-complete-15.05.2021.iso" }
    	"v2020.04.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/706b42515523c46858f5f226bf58efab9dc681d3dcc69304367a1d9948e3566b/all/v2020.204.13394-complete-15.04.2021.iso" }
       	"v2020.03.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/546dc26e9be5b50f60ca346d6eb675788ce05a95de3f78249c20178c10b86f0a/all/v2020.204.13359-complete-15.03.2021.iso" }
   	"v2020.02.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/5548affcf6ee52e50bf27bac51b284c232a55d8dba11e7aada11509050515ca0/all/v2020.203.13289-complete-24.02.2021.iso" }
    	"v2020.01.2021" { $isovariable = "https://storage.googleapis.com/images.abasky.net/00026905fc971a89bf74d04e9d8c5551c9c21450f638f79e8fbe17c640c38b43/all/v2020.203.13255-complete-15.01.2021.iso" }
        "v2020.12.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/3d6554c7537b5dae05fea8bdcbc24f84864d3280366db8ca177ecd68a8c66fda/all/v2020.203.13223-complete-15.12.2020.iso" }
   	"v2020.11.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/a4e1ed1e1674c051a2944b1fb61fec56c572da9c577edbd0f9de84162729ddba/all/v2020.203.13191-complete-15.11.2020.iso" }
    	"v2020.10.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8961cc277895355d7387ad56fa3d2bb61067db726a66b6482a3703ce78c0953e/all/v2020.203.13147-complete-15.10.2020.iso" }
       	"v2020.09.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/03e4783f116c92d6beddd863032142d69e7755af0c63dbaeefdc0866fee901d1/all/v2020.203.13105-complete-15.09.2020.iso" }
   	"v2020.08.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/c5af1a9a2eeb834c1c4cdcf56894c310b582cd4234bc36b9d156e07f85acae5f/all/v2020.201.12983-complete-15.08.2020.iso" }
    	"v2020.07.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/0b93fba0d266287f3e0c2465c0fe5f0948d9978d5c33ffa0f43c9ad1bb2b0389/all/v2020.201.12944-complete-15.07.2020.iso" }
       	"v2020.06.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/d4abac5da8fea86e25fb8118ce751c6c459153fc6320c296ebd78a48b3c92a87/all/v2020.201.12926-complete-25.06.2020.iso" }
   	"v2020.05.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/cc14e8cd9f5557217041597e5ec0fcec8ecfa77da8eac25cf1458de963b0041d/all/v2020.201.12888-complete-15.05.2020.iso" }
    	"v2020.04.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/d8e6d2e5d7923e4e139260d791f1e8d8e9824b73e134cdbace358db875c9da51/all/v2020.200.12761-complete-15.04.2020.iso" }
       	"v2020.03.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/8e18c314c1244a26c6788ba471c8b663a403e55d0234e53da9dbda2ca797d29d/all/v2020.200.12734-complete-15.03.2020.iso" }
   	"v2020.02.2020" { $isovariable = "https://storage.googleapis.com/images.abasky.net/d281a2993acb83306536d14ae472f5fc149f36aedb568ce30149a875173e213f/all/v2020.200.12701-release-15.02.2020.iso" }
	default { $isovariable ="Option invalide" }
}
# Verification de l'existence de l'URL pour l'iso
if ($null -ne $isovariable -and $isovariable -eq "Option invalide") {
	Write-Host "La version choisie n'est pas disponible, merci de relancer le script"
	pause
	exit
}
else {
	$ImagePath= "C:\abasources\abacus.iso"
	# Verification de l'existence d'un fichier iso dans le repertoire
 	if (Test-Path $ImagePath) { 
	  	# Demontage et suppression du fichier
		Dismount-DiskImage -ImagePath $ImagePath
		Remove-Item $ImagePath -Force
		Write-Host "L'ancien fichier abacus.iso a ete supprime"
	}
	Write-Host "Telechargement du fichier iso"
	$WebClient = New-Object System.Net.WebClient
	$WebClient.DownloadFile($isovariable,"C:\abasources\abacus.iso")
	Write-Host "Montage du fichier iso"
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
}
