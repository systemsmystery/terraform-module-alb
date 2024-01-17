# Terraform Module - ALB

Creates a ALB with a default listener of 443 and 80. The 443 listener will have a default certificate attached.

## Terraform Resources

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.load_balancer](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/lb_listener) | resource |
| [aws_security_group.lb](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/security_group) | resource |
| [aws_vpc_security_group_ingress_rule.http](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.https](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_wafv2_web_acl.alb](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/wafv2_web_acl) | resource |
| [aws_wafv2_web_acl_association.alb](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/wafv2_web_acl_association) | resource |
| [aws_subnets.default](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/subnets) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_certificate_arn"></a> [default\_certificate\_arn](#input\_default\_certificate\_arn) | The ARN of the default certificate | `string` | n/a | yes |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | The name of the load balancer | `string` | n/a | yes |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | The name of the bucket to store the load balancer logs | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_https_listener_arn"></a> [https\_listener\_arn](#output\_https\_listener\_arn) | The ARN of the HTTPS listener |
| <a name="output_lb_arn"></a> [lb\_arn](#output\_lb\_arn) | The ARN of the load balancer |
| <a name="output_lb_dns_name"></a> [lb\_dns\_name](#output\_lb\_dns\_name) | The DNS name of the load balancer |
| <a name="output_lb_security_group_id"></a> [lb\_security\_group\_id](#output\_lb\_security\_group\_id) | The ID of the security group that allows access to the load balancer |
| <a name="output_lb_zone_id"></a> [lb\_zone\_id](#output\_lb\_zone\_id) | The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
