variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

resource "aws_security_group" "this" {
  name        = "${var.environment}-sg"
  description = "${var.environment}-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-sg"
  }
}
