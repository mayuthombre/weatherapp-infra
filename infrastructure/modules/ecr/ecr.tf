# Create ECR repository
resource "aws_ecr_repository" "weatherapp_ecrrepo" {
  name         = "mayu-weatherapp-repo" # Naming my repository
  force_delete = true                   # enabling this feature so that github actions can delete repo with images.           

  image_scanning_configuration {
    scan_on_push = true # setting image scanning for all pushed images
  }

  tags = var.tags
}
