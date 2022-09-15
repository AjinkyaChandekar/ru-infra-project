resource "aws_security_group" "sg_web" {
  name        = "ureport-sg-web"
  description = "Web Security Group"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = module.tags.common_tags
}