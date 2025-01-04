variable "tutorial_instance_type" {
  type        = string
  description = "The type of instance to start the Tutorial instance with (default: t2.micro)"
  default     = "t2.micro"
}

variable "tutorial_ami_id" {
  type        = string
  description = "The AMI ID to use for the Tutorial instance"
}

variable "environment" {
  type        = string
  description = "The environment to deploy the Tutorial infrastructure to"
}

variable "name" {
  type        = string
  description = "The name of the Tutorial infrastructure"
}
