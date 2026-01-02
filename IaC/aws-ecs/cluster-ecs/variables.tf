variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Nome do cluster ECS"
  type        = string
  default     = "ecs-cluster-poc"
}

variable "environment" {
  description = "Ambiente (dev, hml, prod)"
  type        = string
  default     = "dev"
}
