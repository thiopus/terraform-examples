variable "region" {
  description = "AWS Home region"
  type        = string
  default     = "eu-central-1"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "env"
}


variable "service" {
  type        = string
  default     = "vpc"
  description = "vpc"
}