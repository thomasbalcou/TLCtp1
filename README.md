
# TLC tp 1

## Etapes 1 et 2

Le repo contient le docker compose de l'étape 2 chargé de mettre en place un reverse proxy avec l'image Docker nginx "jwilder/nginx-proxy".  

Cette image Docker est un conteneur Nginx qui agit en tant que reverse proxy pour les autres conteneurs Docker. Il gère la redirection automatique des requêtes HTTP vers les conteneurs associés en utilisant les en-têtes de l'hôte et les noms de domaine. Cela permet d'exécuter plusieurs applications sur un même serveur avec des URL distinctes sans avoir à configurer manuellement les réglages de proxy pour chaque application.


## Captures d'écran du fonctionnement de cette image:

![App Screenshot](https://github.com/thomasbalcou/TLCtp1/blob/main/capture-ecran-reverseproxy.png)

![App Screenshot](https://github.com/thomasbalcou/TLCtp1/blob/main/capture-ecran-reverseproxy2.png)

## Etape 3

Le DockerFile de l'étape 3 est aussi disponible dans le repo.

Ce script Dockerfile construit une image Docker à partir de l'image Ubuntu 16.04. Il installe les paquets nécessaires pour exécuter une application Java (openjdk-8-jdk, maven, libpng16-16, libjasper1, libdc1394-22 et git).

Ensuite, il clone le référentiel GitHub "TPDockerSampleApp" et travaille dans ce répertoire. La commande "mvn install:install-file" installe le fichier opencv-3410.jar dans le référentiel local de Maven. La commande "mvn package" compile l'application.

Enfin, la commande "CMD" exécute l'application en spécifiant le chemin d'accès à la bibliothèque Java nécessaire (java.library.path).
