variable "tags" {
  description = "Tags to be applied to resources where supported"
  type        = map(string)
  default     = {}
}

variable "topics" {
  description = "SNS topics to be managed"
  type        = list(string)
}
