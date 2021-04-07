variable "ami_image_id" {
}

variable "ami_instance_type" {
}

variable "asg_min_size" {
}

variable "asg_max_size" {
}

variable "desired_capacity" {
}

variable "name" {
}

#variable "health_check_type" {}

variable "ami_iam_profile_id" {
  default = ""
}

variable "associate_public_ip" {
  default = "false"
}

variable "force_delete" {
  default = "false"
}

variable "health_check_grace_period" {
  default = "300"
}

variable "key_name" {
  default = "terraform"
}

variable "load_balancer_arns" {
}

variable "security_group_ids" {
}

variable "spot_price" {
  default = ""
}

variable "subnet_ids" {
}

variable "tags" {
  default = []
}

variable "user_data" {
  default = ""
}

variable "user_data_base64" {
  default = ""
}

variable "cbd" {
  default = false
}

