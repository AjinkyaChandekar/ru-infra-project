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

  tags = merge(module.tags.common_tags, {
    Name = "ureport-sg-web"

  })
}

resource "aws_security_group_rule" "sg_web_in_all" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_web.id
}