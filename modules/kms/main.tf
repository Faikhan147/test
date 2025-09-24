variable "environment" {
  type = string
}

resource "aws_kms_key" "this" {
  description             = "${var.environment}-kms-key"
  deletion_window_in_days = 10

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowRootAccountFullAccess"
        Effect    = "Allow"
        Principal = { AWS = "arn:aws:iam::923884399206:root" }
        Action    = "kms:*"
        Resource  = "*"
      },
      {
        Sid       = "AllowEKSUseOfKey"
        Effect    = "Allow"
        Principal = { Service = "eks.amazonaws.com" }
        Action    = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:DescribeKey",
          "kms:GenerateDataKey*"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "${var.environment}-kms-key"
  }
}
