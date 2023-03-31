terraform{
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
        region = "ap-northeast-2"
    }
}	
  backend "s3" {
     bucket = "kibeom-test-terraform"
     key = "terraform_test/chapter6/terraform.tfstate"
     region = "ap-northeast-2"
     encrypt = true
     dynamodb_table = "terraform-lock"
 }
}
