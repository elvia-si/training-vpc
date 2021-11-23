#Type è mandatory le altre cose sono optional
variable "vpc_cidr" {
    description = "The CIDR of my VPC"
    type = string
    # default = 
}

variable "vpc_name" {
    description = "The Name of my VPC"
    type = string
}

variable "internet_gw_name" {
    description = "The Name of my GW"
    type = string
}

variable "public_a_cidr" {
    description = "The CIDR of my public a"
    type = string
}

variable "public_b_cidr" {
    description = "The CIDR of my public b"
    type = string
}

variable "public_c_cidr" {
    description = "The CIDR of my public c"
    type = string
}

#PRIVATE
variable "private_a_cidr" {
    description = "The CIDR of my private a"
    type = string
}

variable "private_b_cidr" {
    description = "The CIDR of my private b"
    type = string
}

variable "private_c_cidr" {
    description = "The CIDR of my private c"
    type = string
}
variable "region" {
    description = "Default region for our VPC"
    type = string
}
