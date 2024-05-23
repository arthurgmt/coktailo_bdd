# coktailo_bdd

Cette application permet de gérer une base de données de recettes de cocktails en ligne.

## Configuration et Installation

Clonez le repo :

git clone https://github.com/votre_repo/cocktail-app.git
cd cocktail-app

Installez les dépendances :

pip install -r requirements.txt
Configurez les variables d'environnement dans app/config.py.

Lancez l'application :

docker-compose up


Initialisation de Citus
Pour initialiser Citus, exécutez les commandes suivantes après avoir démarré les conteneurs :

docker-compose up -d

docker-compose exec master psql -U citus -d citus -c "SELECT * from master_add_node('worker1', 5432);"
docker-compose exec master psql -U citus -d citus -c "SELECT * from master_add_node('worker2', 5432);"

Utilisation des Scripts SQL
Pour créer les tables et configurer Citus, exécutez les scripts SQL dans l'ordre suivant :

Création des tables :
docker-compose exec master psql -U citus -d citus -f /path/to/sql/create_tables.sql

Création des procédures stockées :
docker-compose exec master psql -U citus -d citus -f /path/to/sql/stored_procedures.sql

Création des triggers :
docker-compose exec master psql -U citus -d citus -f /path/to/sql/triggers.sql

Configuration de Citus :
docker-compose exec master psql -U citus -d citus -f /path/to/sql/configure_citus.sql
