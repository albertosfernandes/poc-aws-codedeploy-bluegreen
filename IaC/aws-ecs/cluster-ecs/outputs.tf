output "ecs_cluster_id" {
  description = "ID do cluster ECS"
  value       = module.ecs_cluster.id
}

output "ecs_cluster_arn" {
  description = "ARN do cluster ECS"
  value       = module.ecs_cluster.arn
}

output "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  value       = module.ecs_cluster.name
}
