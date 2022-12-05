
output "blue_repo_url" {
  value = aws_ecr_repository.blue_weatherapp_ecrrepo.repository_url
}

output "green_repo_url" {
  value = aws_ecr_repository.green_weatherapp_ecrrepo.repository_url
}