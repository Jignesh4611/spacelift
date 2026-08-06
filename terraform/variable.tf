variable "region" {
  default = "ap-south-1"
}

variable "key_name" {
  description = "EC2 Key Pair"
}

variable "instance_type" {
  default = "t3.micro"
}