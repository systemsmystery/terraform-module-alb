# kics-scan disable=ffac8a12-322e-42c1-b9b9-81ff85c39ef7
#tfsec:ignore:aws-ec2-no-public-ingress-sgr tfsec:ignore:aws-ec2-no-public-egress-sgr
resource "aws_security_group" "lb" {
  name        = "docker-host-lb-sg"
  description = "Rules for docker-host load balancer"
  vpc_id      = data.aws_vpc.default.id
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  description       = "LB Inbound HTTPS Access"
  security_group_id = aws_security_group.lb.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  # checkov:skip=CKV_AWS_260:Port 80 needs to be enable for redirection
  description       = "LB Inbound HTTP Access"
  security_group_id = aws_security_group.lb.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}
