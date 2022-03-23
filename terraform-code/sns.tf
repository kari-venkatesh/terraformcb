provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA2GV7V4IAPECFGWFW"
  secret_key = "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"
}
resource "aws_sns_topic" "mytopic" {
  name = "mytopic-name"
}


