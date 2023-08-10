terraform {
    backend "s3" {
        bucket         = "educacionit-tf-state"
        key            = "services/vms/terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "terraform-state-lock" // se puede conectar mas de un state en un mismo dynamodb
        encrypt        = true
    }
}