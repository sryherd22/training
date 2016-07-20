#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-5a424367
#
# Your security group ID is:
#
#     sg-ca91a0b1
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     manheim-b6d767d2f8ed5d21a44b0e5886680cb9
#
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
	default = "us-east-1"
}

provider "aws" {
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
	region = "${var.aws_region}"
}

#provider "aws" {
#  access_key = "AKIAJXQ3CTJRE4GFN4WQ"
#  secret_key = "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"
#  region     = "us-east-1"
#}

resource "aws_instance" "web" {
    ami = "ami-db24d8b6"
    count = "1"
    instance_type = "t2.micro"
    subnet_id = "subnet-5a424367"
    vpc_security_group_ids = ["sg-ca91a0b1"]
    tags {
        Identity = "manheim-b6d767d2f8ed5d21a44b0e5886680cb9"
	Owner = "sonya"
	Class = "training"
    }
}

output "public_ip" {
	value = "${join(",", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
        value = "${join(",", aws_instance.web.*.public_dns)}"
}
