# Windows Server -> basique

## Pré-requis

<p>Avant de commencer, il faut avoir installé <a href="https://www.vmware.com/fr/products/workstation-pro/workstation-pro-evaluation.html">VmWare Pro 17</a> et <a href="https://www.microsoft.com/fr-fr/evalcenter/evaluate-windows-server-2022">Windows Server 2022</a>.
Il vous faut au moins <strong>100Go</strong> de stockage et au moins <strong>16Go RAM</strong>.</p>

## 1. Installation de Windows Server basique

### 1.1. Création de la VM

<p>Créez une nouvelle VM avec les paramètres suivants :</p>
- 4 CPU
- 4Go de RAM
- 50Go de stockage
- Utilisateur : `Administrator`
- mot de passe : `Passw0rd`

### 1.2. Partitionnement du disque

<p>Une fois la VM créée, il faut partitionner le disque.<br>
Allez dans `<control>Gestion des disques</control>` et cliquez sur `<control>Initialiser le disque</control>`.<br>
Une fois le disque initialisé, cliquez sur `<control>Nouveau volume simple</control>`.<br>
Créez un volume `<strong>C:</strong>` de <strong>30Go</strong>.<br>
Créez un volume `<strong>D:</strong>` de <strong>20Go</strong>.</p>

## 2. Installation de l'Active Directory et du DNS

### 2. Sommaire
- [2.1. Installation du rôle](#2-1-installation-du-role)
- [2.2. Configuration du domaine Active Directory](#2-2-configuration-du-domaine-active-directory)

### 2.1. Installation du role

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Ajouter des rôles et des fonctionnalités</control>`.<br>
Cliquez sur le rôle `<control>Active Directory Domain Services</control>`.<br></p>
<img src="adinstallrole.png" alt="Installation du rôle Active Directory" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Installer</control>`.<br>
Cliquez sur `<control>Fermer</control>`.</p>

Pour finir l'installation de l'Active Directory, il faut redémarrer.

### 2.2. Configuration du domaine Active Directory

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Configurer cette fonctionnalité</control>`.<br>
Cliquez sur `<control>Configurer les services de domaine Active Directory</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Créer une forêt</control>`.<br>
Entrez le nom de domaine : `<control>contoso.adds</control>`.<br></p>
<img src="adconfig1.png" alt="Config du nom de domaine" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
<p>Entrez le mot de passe : `<control>Passw0rd</control>`.<br></p>
<img src="adconfig2.png" alt="Config du mot de passe" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br></p>
<img src="adconfig3.png" alt="Config du nom de domaine" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br></p>
<img src="adconfig4.png" alt="Config du nom de domaine" width="500px">
<p>Cliquez sur `<control>Installer</control>`.<br>
Cliquez sur `<control>Fermer</control>`.</p>

Pour finir la configuration de l'Active Directory, il faut redémarrer.

## 3. Installation du DHCP

### 3. Sommaire
- [3.1. Installation du rôle](#3-1-installation-du-role)
- [3.2. Après le redémarrage](#3-2-apres-le-redemarrage)
- [3.3. Configuration des routes DHCP](#3-3-configuration-des-routes-dhcp)

### 3.1. Installation du role

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Ajouter des rôles et des fonctionnalités</control>`.<br>
Cliquez sur le rôle `<control>DHCP Server</control>`.<br></p>
<img src="dhcpinstallrole.png" alt="Installation du rôle DHCP" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Installer</control>`.<br>
Cliquez sur `<control>Fermer</control>`.</p>

Pour finir l'installation du DHCP, il faut redémarrer.

### 3.2. Apres le redemarrage

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Configurer cette fonctionnalité</control>`.<br>
Cliquez sur `<control>Configurer le serveur DHCP</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Utiliser les informations d'identification actuelles</control>`.<br></p>
<img src="dhcpconfig.png" alt="Configuration du DHCP" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Installer</control>`.<br>
Cliquez sur `<control>Fermer</control>`.</p>

### 3.3. Configuration des routes DHCP

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Outils</control>`.<br>
Cliquez sur `<control>DHCP</control>`.<br>
Cliquez sur `<control>IPv4</control>`.<br>
Cliquez sur `<control>Ajouter une étendue</control>`.<br>
Entrez le nom de l'étendue : `<control>Etendue</control>`.<br></p>
<img src="dhcpconfig1.png" alt="Configuration du DHCP" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Entrez le début de l'adresse IP : `<control>192.168.5.101</control>`.<br>
Entrez la fin de l'adresse IP : `<control>192.168.5.110</control>`.<br>
Entrez le masque de sous-réseau : `<control>255.255.255.0</control>`.<br></p>
<img src="dhcpconfig2.png" alt="Configuration du DHCP" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br></p>
<img src="dhcpconfig3.png" alt="Configuration du DHCP" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Oui, je souhaite configurer ces options maintenant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Ajouter l'IP du routeur</control>`.<br>
Entrez l'IP du routeur : `<control>192.168.5.1</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Configurez les DNS comme ceci :<br></p>
<img src="dhcpconfig4.png" alt="Configuration du DHCP" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Oui, je souhaite configurer ces options maintenant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Terminé</control>`.<br></p>

## 4. Installation de WDS

### 4. Sommaire
- [4.1. Installation du rôle](#4-1-installation-du-role)
- [4.2. Configuration du serveur WDS](#4-2-configuration-du-serveur-wds)
- [4.3. Ajout de l'image de boot](#4-3-ajout-de-l-image-de-boot)
- [4.4. Ajout de l'image d'installation](#4-4-ajout-de-l-image-d-installation)

### 4.1. Installation du role

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Ajouter des rôles et des fonctionnalités</control>`.<br>
Cliquez sur le rôle `<control>Windows Deployment Services</control>`.<br></p>
<img src="wdsinstallrole.png" alt="Installation du rôle WDS" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Installer</control>`.<br>
Cliquez sur `<control>Fermer</control>`.</p>

### 4.2. Configuration du serveur WDS

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Outils</control>`.<br>
Cliquez sur `<control>Windows Deployment Services</control>`.<br>
Cliquez sur `<control>Configurer le serveur WDS</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Utiliser les informations d'identification actuelles</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Définir le chemin des installation `<control>D:\RemoteInstall</control>`.<br></p>
<img src="wdsconfig1.png" alt="Configuration du serveur WDS" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Répondre à tous les ordinateurs clients</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Terminé</control>`.<br></p>

### 4.3. Ajout de l'image de boot

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Outils</control>`.<br>
Cliquez sur `<control>Windows Deployment Services</control>`.<br>
Cliquez sur `<control>Serveur WDS</control>`.<br>
Cliquez sur `<control>Clic droit</control>`.<br>
Cliquez sur `<control>Ajouter une image de démarrage</control>`.<br>
Cliquez sur `<control>Parcourir</control>`.<br>
Récupérez le `<control>boot.wim</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Terminé</control>`.<br></p>

### 4.4. Ajout de l'image d'installation

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Outils</control>`.<br>
Cliquez sur `<control>Windows Deployment Services</control>`.<br>
Cliquez sur `<control>Serveur WDS</control>`.<br>
Cliquez sur `<control>Clic droit</control>`.<br>
Cliquez sur `<control>Ajouter une image de démarrage</control>`.<br>
Cliquez sur `<control>Parcourir</control>`.<br>
Installer le `<control> Windows 10 Education N</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Terminé</control>`.<br></p>

## 5. Installation de WSUS

### 5. Sommaire
- [5.1. Installation du rôle](#5-1-installation-du-role)
- [5.2. Apres l'installation du role](#5-2-apres-l-installation-du-role)

### 5.1 Installation du role

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Ajouter des rôles et des fonctionnalités</control>`.<br>
Cliquez sur le rôle `<control>Windows Server Update Services</control>`.<br></p>
<img src="wsusinstallrole.png" alt="Installation du rôle WSUS" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>
Indiquez le chemin `<control>D:\WSUS</control>`.<br>
<img src="wsusinstallrole2.png" alt="Installation du rôle WSUS" width="500px">
<p>Cliquez sur `<control>Suivant</control>`.<br>
Cliquez sur `<control>Installer</control>`.<br>
Cliquez sur `<control>Fermer</control>`.</p>

### 5.2 Apres l'installation du role

<p>Allez dans `<control>Gestionnaire de serveur</control>`.<br>
Cliquez sur `<control>Outils</control>`.<br>
Cliquez sur `<control>Windows Server Update Services</control>`.<br>
Cliquez sur `<control>Se connecter au serveur</control>`.<br>
Cliquez sur `<control>Suivant</control>`.<br>

