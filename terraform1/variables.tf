variable "customer_name" {
  type = string
}

variable "cert_arn" {
  type    = string
  default = ""
}

variable "collector" {
  type    = list(string)
  default = ["hgytu", "uytresdfguhi"]
}
