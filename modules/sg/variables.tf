variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "extra_ports" {
  type = list(number)
}