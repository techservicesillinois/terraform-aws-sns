# Look up specified topics to get ARN.

data "aws_sns_topic" "selected" {
  for_each = toset(keys(var.subscriptions))
  name     = each.key
}

locals {
  # Build flattened list of maps from var.subscriptions, which is a
  # map of map.

  subscriptions = flatten([
    for topic in keys(var.subscriptions) : [
      for sub in var.subscriptions[topic] : {
        endpoint  = sub.endpoint
        protocol  = sub.protocol
        topic     = topic
        topic_arn = data.aws_sns_topic.selected[topic].arn
      }
    ]
  ])

  # Build subscription map wherein each key is unique, and the value
  # stored under each key is an object from local.subscriptions,
  # which is the flattened list of maps. The key/value pair is used
  # to manage topic subscriptions.

  subscription_map = {
    for sub in local.subscriptions : format("%s:%s:%s", sub.topic, sub.protocol, sub.endpoint) => sub
  }
}

# Manage topic subscription for each value in var.subscriptions.

resource "aws_sns_topic_subscription" "default" {
  for_each = local.subscription_map

  endpoint  = each.value.endpoint
  protocol  = each.value.protocol
  topic_arn = each.value.topic_arn
}
