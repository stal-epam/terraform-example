variable "aws_region" {
  description = "AWS default region - Northern Virginia"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS default profile"
  type        = string
  default     = "iamadmin-general"
}

variable "instance_type" {
  description = "Instance type t2"
  type        = string
  default     = "t2.micro"
}