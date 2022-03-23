provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA2GV7V4IAPECFGWFW"
  secret_key = "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"
}
resource "aws_sns_topic" "mytopic" {
  name = "mytopic-name"
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.mytopic.arn
  protocol  = "email"
  endpoint  = "venkyroyal66@gmail.com"
}
#scripct for 5xx for dev-control-plane-api
resource "aws_cloudwatch_metric_alarm" "gateway5xx_error_1" {
  alarm_name          = "dev-dev-control-plane-api-5xx-tf"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "5xx for dev-control-plane-api"
  treat_missing_data  = "notBreaching"
  metric_name         = "5XXError"
  namespace           = "AWS/ApiGateway"
  period              = 300
  evaluation_periods  = 1
  threshold           = 5
  statistic           = "Average"
  unit                = "Percent"
  alarm_actions       = ["aws_sns_topic.mytopic.arn"]
  ok_actions          = ["aws_sns_topic.mytopic.arn"]
  dimensions = {
    ApiName = "	demo-api"
  }
}
