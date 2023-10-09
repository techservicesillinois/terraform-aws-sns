output "arns" {
  value = [for topic_sub in aws_sns_topic_subscription.default : topic_sub.arn]
}

# Debug outputs.

output "_subscriptions" {
  value = (var._debug) ? local.subscriptions : null
}

output "_subscription_map" {
  value = (var._debug) ? local.subscription_map : null
}
