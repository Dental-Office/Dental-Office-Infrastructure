resource "aws_s3_bucket" "cupstone-bucket" {
  bucket = "dental-office-app" 

  tags = {
    Name        = "dental-office-app"
    Environment = "Production"
  }
}

locals {
  files = [
    {
      key    = "assets/image.jpg"
      source = "frontend-app/assets/image.jpg"
    },
    {
      key    = "3rdpartylicenses.txt"
      source = "frontend-app/3rdpartylicenses.txt"
    },
    {
      key    = "bootstrap-icons.51e2826a5e883791.woff"
      source = "frontend-app/bootstrap-icons.51e2826a5e883791.woff"
    },
    {
      key    = "bootstrap-icons.988b20fa812f3498.woff2"
      source = "frontend-app/bootstrap-icons.988b20fa812f3498.woff2"
    },
    {
      key    = "favicon.ico"
      source = "frontend-app/favicon.ico"
    },
    {
      key    = "index.html"
      source = "frontend-app/index.html"
    },
    {
      key    = "main.c7b031a13b9783b7.js"
      source = "frontend-app/main.c7b031a13b9783b7.js"
    },
    {
      key    = "polyfills.d44a9f93a583eaa2.js"
      source = "frontend-app/polyfills.d44a9f93a583eaa2.js"
    },
    {
      key    = "runtime.466a3aec414361f6.js"
      source = "frontend-app/runtime.466a3aec414361f6.js"
    },
    {
      key    = "scripts.357c01f9569cddb2.js"
      source = "frontend-app/scripts.357c01f9569cddb2.js"
    },
    {
      key    = "styles.53bb85ec0e34813b.css"
      source = "frontend-app/styles.53bb85ec0e34813b.css"
    }
  ]
}

resource "aws_s3_bucket_object" "frontend_files_upload" {
  content_type = each.value.key == "styles.53bb85ec0e34813b.css" ? "text/css" : each.value.key == "image.jpg" ? "image/jpg" : each.value.key == "index.html" ? "text/html" : "application/javascript" 
  # content_type = each.value.key == "index.html" ? "text/html" : each.value.key == ".js" ? "application/javascript" : "image/jpeg"
  for_each = { for file in local.files : file.key => file }
  bucket = aws_s3_bucket.cupstone-bucket.id
  key    = "frontend_app/${each.value.key}"
  source = each.value.source

  depends_on = [aws_s3_bucket.cupstone-bucket] 
}

resource "aws_s3_bucket_object" "JAR_file_upload" {
  bucket = aws_s3_bucket.cupstone-bucket.id
  key    = "dentaloffice-0.0.1-SNAPSHOT.jar"
  source = "backend-app/dentaloffice-0.0.1-SNAPSHOT.jar"

  depends_on = [aws_s3_bucket.cupstone-bucket] 
  
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.cupstone-bucket.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.cupstone-bucket.id

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = [
          "s3:GetObject",
          "s3:ListBucket",
        ]
        Resource  = [
          "arn:aws:s3:::dental-office-app/*",
          "arn:aws:s3:::dental-office-app",
        ]
      },
    ]
  })
}
