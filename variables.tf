variable "aws_region" {
  description = "The AWS region to deploy the EC2 instance in."
  default     = "us-east-1"
}

variable "ami-id" {
    type        = string
    description = "Image base OS EC2"
    default     = "ami-09a41e26df464c548"

    validation {
      condition     = length(var.ami-id) > 4 && substr(var.ami-id, 0, 4) == "ami-"
      error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
    }
}

variable "instance_type" {
  type        = string
  description = "instance type for ec2"
  default     = "t2.micro"
}

