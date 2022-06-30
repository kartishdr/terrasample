variable "subnet_range" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "tags" {
  type = string
  default = "module_subnet"
}
