variable "account_id" {
  type      = string
  sensitive = true
}

variable "gh_username" {
  type = string
}

variable "user_profile_name" {
  type      = string
  sensitive = true
}

variable "pipeline" {
  type = bool
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "10.0.5.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.6.0/24"
}

variable "private_subnet_1_cidr" {
  default = "10.0.7.0/24"
}

variable "private_subnet_2_cidr" {
  default = "10.0.8.0/24"
}

variable "az" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ip_address" {
  type      = string
  sensitive = true
}

variable "ec2_key_name" {
  type      = string
  sensitive = true
}

variable "k8s_token" {
  type      = string
  sensitive = true
}