output "certificate_arn" {
    value = aws_acm_certificate_validation.https_validation.certificate_arn
}
