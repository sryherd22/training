#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     sRFRF5ltrFulE4AB6iRgiRshoIWqiuUF
#
# Your Identity is:
#
#     manheim-b6d767d2f8ed5d21a44b0e5886680cb9
#
# Configure the DNSimple provider
provider "dnsimple" {
    token = "1b3fdL6IywZS2MUeYLCNj2LXdXzcpoa6"
    email = "sethvargo+terraform@gmail.com"
}

resource "dnsimple_record" "www" {
    domain = "terraform.rocks"
    type = "A"
    name = "myinstance"
    value = "${aws_instance.web.0.public_ip}"
}

