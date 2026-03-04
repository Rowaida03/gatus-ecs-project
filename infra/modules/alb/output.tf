output "target_group_arn" {
  description = "ARN of the ALB target group"
  value = aws_lb_target_group.target_group.arn
}

output "alb_dns_name" {
  description = "DNS name of the ALB"
   value = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  description = "Zone ID od the ALB"
  value = aws_lb.alb.zone_id
}

output "load_balancer_arn" {
  value = aws_lb.alb.arn
} 