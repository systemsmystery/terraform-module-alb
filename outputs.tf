output "lb_arn" {
  value       = aws_lb.load_balancer.arn
  description = "The ARN of the load balancer"
}

output "lb_security_group_id" {
  value       = aws_security_group.lb.id
  description = "The ID of the security group that allows access to the load balancer"
}

output "lb_zone_id" {
  value       = aws_lb.load_balancer.zone_id
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)"
}

output "lb_dns_name" {
  value       = aws_lb.load_balancer.dns_name
  description = "The DNS name of the load balancer"
}

output "https_listener_arn" {
  value       = aws_lb_listener.https.arn
  description = "The ARN of the HTTPS listener"
}
