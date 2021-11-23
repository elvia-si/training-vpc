terraform {
  backend "s3" {
    bucket = "talent-academy-954444250632-tfstates"
    key    = "sprint2/basic-vpc/terraform.tfstates"
    dynamodb_table="terraform-lock"
  }
}