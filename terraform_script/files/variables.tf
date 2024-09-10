variable "AWS_ACCESS_KEY" {
    default = "" # access key
}

variable "AWS_SECRET_KEY" {
    default = ""# secret key
}

variable "key_name" {
    default = "cloud"
    description = "Name of the key pair"
}

variable "instance_type" {
    default = "t2.micro"
    description = "Type of the instance"
}

variable "image" {
    default = "ami-0e86e20dae9224db8"
    description = "AMI ID"
}

variable "region" {
    default = "us-east-1"
    description = "AWS region"
}

variable "Total_Instances" {
    description = "Total number of instances"
    default     = 2
}
