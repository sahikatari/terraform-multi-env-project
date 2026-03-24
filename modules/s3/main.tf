resource "random_id" "rand" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.env}-bucket-${random_id.rand.hex}"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Environment = var.env
  }
}