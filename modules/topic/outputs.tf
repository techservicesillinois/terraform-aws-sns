output "topic_arns" {
  value = [for topic in aws_sns_topic.default : topic.arn]
}
