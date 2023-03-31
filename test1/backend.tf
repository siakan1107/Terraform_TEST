terraform{
  backend "s3" {
     bucket = "kibeom-test-terraform"
     key = "terraform_test/chapter6/terraform.tfstate"
     region = "ap-northeast-2"
     encrypt = true
     dynamodb_table = "terraform-lock"
 }
}
