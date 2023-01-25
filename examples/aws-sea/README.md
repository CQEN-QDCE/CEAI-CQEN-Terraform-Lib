# Exemple de déploiement utilisant la librairie AWS

## Modules déployés

* [sea-network](../../aws/sea-network)
* [sea-rds-aurora-mysql](../../aws/sea-rds-aurora-mysql)
* [sea-ecs-cluster](../../aws/sea-ecs-cluster)
* [sea-ecs-fargate-service](../../aws/sea-ecs-fargate-service)

## Procédure

1. Créer workspace

```bash
terraform workspace new test
```

2. Créer le profil vers le compte de travail AWS 

Dans $HOME/.aws/config, ajouter le bloc suivant en remplaçant les {valeurs} par celles du compte AWS utilisé.
```bash
[profile {nom_du_compte}]
sso_start_url = {Url de connexion AWS SSO}
sso_region = ca-central-1
sso_account_id = {Numéro du compte}
sso_role_name = {Nom du role que vous possédez sur ce compte}
region = ca-central-1
output = json
```

3. Renommer le fichier environment/test/terraform.tfvars.example: terraform.tfvars. Y renseigner les variables avec les informations du compte AWS ainsi qu'un identifiant pour votre déploiement.

```
aws_profile           = "{Nom du profile}"
workload_account_type = "{Type de compte de travail (Sandbox, Dev ou Prod)}"
identifier            = "{Nom du déploiement}"
```

4. Démarrer une session AWS CLI vers le compte de travail. 

```bash
aws sso login --profile [nom_profile]
```

5. Lancer la commande d'initialisation 

```
terraform init
```

6. Lancer la commande plan 

```
terraform plan
```