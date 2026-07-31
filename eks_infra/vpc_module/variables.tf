variable "project" {
    type = string
}

variable "env" {
    type = string
}

variable "vpc_tag" {
    type = map
    default = { }
}

variable "vpc_cidr" {
    type = string
    default= "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    type = list
    default = [ "10.0.1.0/24" , "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
    type = list
    default = [ "10.0.11.0/24" , "10.0.12.0/24"]
}

variable "db_subnet_cidr" {
    type = list
    default = [ "10.0.21.0/24" , "10.0.22.0/24"]
}
variable "igw_tags" {
    type = map
    default = {}
}
var "public_subnet_tags" {
    type = map
    default =   {}
}
var "private_subnet_tags" {
    type = map
    default =   {}
}
var "db_subnet_tags" {
    type = map
    default =   {}
}