resource "aws_wafv2_web_acl" "alb" {
  #checkov:skip=CKV2_AWS_31
  name  = "docker_host_alb"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "docker-host-alb-waf"
    sampled_requests_enabled   = false
  }

  rule {
    name     = "AmazonIPReputationList"
    priority = 1
    override_action {
      none {}
    }
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "docker-host-alb-amazon-ip-reputation-list"
      sampled_requests_enabled   = false
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
  }

}

resource "aws_wafv2_web_acl_association" "alb" {
  resource_arn = aws_lb.load_balancer.arn
  web_acl_arn  = aws_wafv2_web_acl.alb.arn
}
