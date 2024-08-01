# Mémo Docker

## Pour lancer l'image du Dockerfile

```bash
docker run -p 8080:80 --name myim mateonicoud/myim:latest
```

## Pour lancer Docker Compose

Le Docker Compose permet de lancer les 
containers WordPress, MariaDB, et Adminer.

```bash
docker-compose up -d
```

## Mémo des Commandes

Voici un mémo des diverses lignes de commande 
permettant de répondre à chaque partie :

### Docker Commands

- **Construire l'image Docker** :

  ```bash
  docker build -t mateonicoud/myim .
  ```

- **Lancer un container** :

  ```bash
  docker run -p 8080:80 --name myim mateonicoud/myim:latest
  ```

- **Afficher les containers en cours d'exécution** :

  ```bash
  docker ps
  ```

- **Afficher les images disponibles** :

  ```bash
  docker images
  ```

- **Arrêter un container** :

  ```bash
  docker stop myim
  ```

- **Supprimer un container** :

  ```bash
  docker rm myim
  ```

- **Supprimer une image** :

  ```bash
  docker rmi mateonicoud/myim
  ```

### Docker Compose Commands

- **Lancer les services en arrière-plan** :

  ```bash
  docker-compose up -d
  ```

- **Arrêter les services** :

  ```bash
  docker-compose down
  ```

- **Afficher les logs des services** :

  ```bash
  docker-compose logs
  ```

- **Afficher l'état des services** :

  ```bash
  docker-compose ps
  ```

## Containers Fonctionnels

Les containers doivent être fonctionnels, 

bien nommés, et répondre aux instructions fournies :

- **Container `myim`** : Un container web 

fonctionnel utilisant Apache, PHP-FPM, et MariaDB.
Assurez-vous que les configurations sont 
correctes et que les services sont opérationnels.

## Advantages et Inconvénients des Containers face aux Machines Virtuelles

### Advantages des Containers

- **Légèreté** : Les containers sont plus 

légers que les machines virtuelles 
car ils partagent le noyau de l'hôte.

- **Démarrage Rapide** : Les containers 

démarrent généralement plus rapidement que les machines 
virtuelles car ils n'ont pas besoin 
de démarrer un système d'exploitation complete.

- **Portabilité** : Les containers 

peuvent être déplacés entre différents 
environments (développement, test, production) 
de manière plus simple.

- **Consommation de Resources** : Les containers utilisent

moins de Resources (mémoire et stockage) 
que les machines virtuelles, car ils n'ont 
pas besoin d'un système d'exploitation complete.

### Inconvénients des Containers

- **Isolation** : Moins d'isolation par rapport 

aux machines virtuelles. Les containers 
partagent le noyau du système d'exploitation de 
l'hôte, ce qui peut poser des problèmes de sécurité.

- **Complexité de Gestion** : La gestion des containers 

peut devenir complexe à measure que 
le nombre de containers et de services augmente.

- **Compatibilité** : Certains logiciels ou services 

peuvent ne pas 
fonctionner correctement dans un 
environment de conteneurs, surtout s'ils 
nécessitent des configurations spécifiques 
du noyau ou du système d'exploitation.

### Advantages des Machines Virtuelles

- **Isolation Complète** : Les machines virtuelles 

offrent une isolation 
complète car elles exécutent des systèmes 
d'exploitation séparés.

- **Snapshot** : Les machines virtuelles 

peuvent être sauvegardées sous forme de
snapshots pour faciliter la restoration 
en cas de problème.

- **Compatibilité** : Elles peuvent exécuter

n'importe quel logiciel qui fonctionne sur le 
système d'exploitation invité,
indépendamment des configurations de l'hôte.

### Inconvénients des Machines Virtuelles

- **Lourdeur** : Les machines virtuelles sont 

plus lourdes que les containers 
car elles nécessitent un système 
d'exploitation complete.

- **Démarrage Lent** : Les machines

virtuelles prennent plus de temps à 
démarrer en reason du démarrage du 
système d'exploitation complete.

- **Portabilité** : Les machines 

virtuelles sont moins portables que les containers

- **Consommation de Resources** : Les machines 

virtuelles consomment 
plus de Resources (mémoire et stockage) 
que les containers.
