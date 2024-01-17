variable "default_certificate_arn" {
  description = "The ARN of the default certificate"
  type        = string
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "logging_bucket" {
  description = "The name of the bucket to store the load balancer logs"
  type        = string
}
