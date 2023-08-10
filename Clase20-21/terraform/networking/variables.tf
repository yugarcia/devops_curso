variable "vpc_name" {
    type = string
    default = "vpc-1"
}
variable "cidr" {
    type = string
}
variable "azs" {
    type = list(string)
}

variable "public_subnets" {
    type = list(string)
}
variable "resource_tags" {
    description = "tag reusables para el recurso"
    type = object({
        Terraform = string
        Environment = string
        OWNER = string
    })
    default = {
        Terraform = "true"
        Environment = "dev"
        OWNER = "DevOps"
    }
}