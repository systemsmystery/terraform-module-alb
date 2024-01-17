#tfsec:ignore:aws-elb-alb-not-public
resource "aws_lb" "load_balancer" {
  name                       = var.load_balancer_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.lb.id]
  subnets                    = [for subnet in data.aws_subnets.default.ids : subnet]
  drop_invalid_header_fields = true
  enable_deletion_protection = true
  access_logs {
    bucket  = var.logging_bucket
    prefix  = "lb_${var.load_balancer_name}"
    enabled = true
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = var.default_certificate_arn
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found"
      status_code  = "404"
    }
  }
}
