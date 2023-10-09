resource "aws_sns_topic" "default" {
  for_each = toset(var.topics)
  name     = each.key
  tags     = merge({ Name = each.key }, var.tags)
}
