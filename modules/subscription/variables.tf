variable "subscriptions" {
  description = "Map of lists defining SNS subscriptions. Each key is an existing SNS topic, and each member of the list is an object that defines a subscription to be managed for the corresponding SNS topic. Each object specifies the endpoint and protocol for the corresponding subscription."
  type = map(list(object({
    endpoint = string
    protocol = string
  })))
  # FIXME: Do validation?
}

# Debugging.

variable "_debug" {
  description = "Produce debug output (boolean)"
  type        = bool
  default     = false
}
