# Terraform - S3 Advanced Project

## Project Overview

This project creates an Amazon S3 bucket using Terraform and configures:

- S3 Bucket
- Object Upload
- Public Access
- Bucket Policy
- Versioning
- Static Website Hosting
- Lifecycle Management

---

## Files

### provider.tf
- Configures the AWS Provider and Region.

### s3.tf
Contains all S3 resources:
- S3 Bucket
- S3 Object Upload
- Public Access Block
- Bucket Policy
- Versioning
- Static Website Hosting
- Lifecycle Management

### index.html
- Home page for the static website.

---

# Resources Used

### aws_s3_bucket
Creates an Amazon S3 bucket.

### aws_s3_object
Uploads the `index.html` file to the S3 bucket.

### aws_s3_bucket_public_access_block
Configures public access settings for the bucket.

### aws_s3_bucket_policy
Allows users to access website files publicly.

### aws_s3_bucket_versioning
Enables versioning to keep multiple versions of objects.

### aws_s3_bucket_website_configuration
Configures the bucket to host a static website.

### aws_s3_bucket_lifecycle_configuration
Automatically manages objects using lifecycle rules.

---

# What We Did

1. Configured the AWS Provider.
2. Created an S3 Bucket.
3. Uploaded `index.html` to the bucket.
4. Configured Public Access settings.
5. Added a Bucket Policy for public read access.
6. Enabled Bucket Versioning.
7. Configured Static Website Hosting.
8. Added a Lifecycle Rule to automatically expire objects after 90 days.
9. Accessed the website using the S3 Static Website Endpoint.
