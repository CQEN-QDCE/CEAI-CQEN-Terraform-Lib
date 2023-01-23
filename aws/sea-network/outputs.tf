output "shared_vpc" {
  value   = data.aws_vpc.shared_vpc
  description = "VPC partagé du compte de travail"
}

output "web_subnets" {
  value   = data.aws_subnets.web_subnets
  description = "Subnet partagé Web"
}

output "app_subnets" {
  value   = data.aws_subnets.app_subnets
  description = "Subnet partagé App"
}

output "data_subnets" {
  value   = data.aws_subnets.data_subnets
  description = "Subnet partagé Data"
}

output "web_security_group" {
  value   = data.aws_security_group.web_security_group
  description = "Groupe de sécurité partagé Web"
}

output "app_security_group" {
  value   = data.aws_security_group.app_security_group
  description = "Groupe de sécurité partagé App"
}

output "data_security_group" {
  value   = data.aws_security_group.data_security_group
  description = "Groupe de sécurité partagé Data"
}

output "elb_access_log_bucket_name" {
  value   = data.external.config_rule_elb_logging_enabled.result.s3BucketNames
  description = "Nom du bucket S3 oiù déposer les logs d'accès des ELB pour satisfaire la règle AWS Config :ELB_LOGGING_ENABLED"
}

output "all" {
    value = {
        shared_vpc = data.aws_vpc.shared_vpc
        web_subnets = data.aws_subnets.web_subnets
        app_subnets = data.aws_subnets.app_subnets
        data_subnets = data.aws_subnets.data_subnets
        web_security_group = data.aws_security_group.web_security_group
        app_security_group = data.aws_security_group.app_security_group
        data_security_group = data.aws_security_group.data_security_group
        elb_access_log_bucket_name = data.external.config_rule_elb_logging_enabled.result.s3BucketNames
    }
    description = "Objet contenant toutes les data sources concernant la réseautique partagée des comptes de travail SEA"
}
