variable "customer_name" {
  type = string
}

variable "cert_arn" {
  type    = string
  default = ""
}

variable "project_count" {
  type    = number
  default = 1
}

variable "collector" {
  type    = list(string)
  default = ["hgytu", "uytresdfguhi"]
}
