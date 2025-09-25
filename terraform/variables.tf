variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


variable "ami" {
  description = "AMI ID"
  type        = string
  default     = "ami-0a0e5d9c7acc336f1"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

