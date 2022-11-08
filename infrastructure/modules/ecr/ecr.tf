# Create ECR repository

#==== Blue repository ====#
resource "aws_ecr_repository" "blue_weatherapp_ecrrepo" {
  name         = "mayu-weatherapp-blue" # Naming my repository
  force_delete = true                   # enabling this feature so that github actions can delete repo with images.           

  image_scanning_configuration {
    scan_on_push = true # setting image scanning for all pushed images
  }

  tags = var.tags
}

#==== Green repository ====#

resource "aws_ecr_repository" "green_weatherapp_ecrrepo" {
  name         = "mayu-weatherapp-green" # Naming my repository
  force_delete = true                   # enabling this feature so that github actions can delete repo with images.           

  image_scanning_configuration {
    scan_on_push = true # setting image scanning for all pushed images
  }

  tags = var.tags
}