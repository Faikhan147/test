resource "aws_kms_key" "this" {
  deletion_window_in_days = 10
  description             = "${var.env}-kms-key"

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
    Name = "${var.env}-kms-key"
  }
}
