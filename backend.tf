terraform {
  backend "s3" {
    bucket  = "w7-jaebar-terraform-state" #replace with your bucket
    key     = "wk10/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    //dynamodb_table = "locktable" #replace with the table
  }
}