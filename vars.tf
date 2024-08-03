variable "ami_id" {
  description = "The ID of the AMI to use for the instance."
  type        = string
  default     = "ami-0ba9883b710b05ac6"
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance."
  type        = string
  default     = "demo"
}

variable "source_script_path" {
  description = "The path to the local install script."
  type        = string
  default     = "scripts/install_scripts.sh"
}

variable "private_key_path" {
  description = "The path to the private key file."
  type        = string
  default     = "demo.pem"
}

variable "security_group_name" {
  description = "The name of the security group."
  type        = string
  default     = "cms-sg"
}

variable "security_group_description" {
  description = "The description of the security group."
  type        = string
  default     = "Creating security group for CMS applications."
}

variable "cidr_blocks" {
  description = "The CIDR blocks for the security group."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}