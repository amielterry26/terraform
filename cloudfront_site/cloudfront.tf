# All resource names/labels within the code itself begin with "cf" for CloudFront, and then the name of the resource.
# Cloudfront is a CDN (handles pushing content out to everyone if you are hosting a website in s3).

resource "aws_s3_bucket" "cfS3" {
  bucket = "atd-cloudfront-s3"
}

resource "aws_cloudfront_distribution" "cfdistro" {
  enabled = true
  default_root_object = "index.html"
  price_class = "PriceClass_200"

  viewer_certificate {
    cloudfront_default_certificate = "true"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = aws_s3_bucket.cfS3.bucket
    viewer_protocol_policy = "allow-all"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }
  origin {
    domain_name = aws_s3_bucket.cfS3.bucket_domain_name
    origin_id   = aws_s3_bucket.cfS3.bucket
  }
}
