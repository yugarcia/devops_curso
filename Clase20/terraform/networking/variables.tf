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