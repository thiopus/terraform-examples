module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 2.3.0"



  repository_name = "${var.environment}-${var.service}"

  create_lifecycle_policy = true
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 5 images",
        selection = {
          tagStatus   = "any",
          countType   = "imageCountMoreThan",
          countNumber = 5
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  repository_image_tag_mutability = "MUTABLE"

  repository_force_delete = true
}
