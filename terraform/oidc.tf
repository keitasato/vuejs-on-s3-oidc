/*
data "aws_iam_policy_document" "document" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket", "s3:PutObject"]
    resources = [" ${aws_s3_bucket.s3_static_bucket.arn}", "${aws_s3_bucket.s3_static_bucket.arn}/*"]
  }
}

resource "aws_iam_policy" "policy" {
  name   = "${var.project}-${var.environment}-GitHub-OIDC-Policy"
  policy = data.aws_iam_policy_document.document.json
}
*/

module "oidc-with-github-actions" {
  source  = "thetestlabs/oidc-with-github-actions/aws"
  version = "0.1.4"

  github_org = "keitasato"
  github_repositories = [
    "vuejs-on-s3-oidc",
  ]

  iam_role_description = "${var.project}-${var.environment} IAM role to enable GitHub OIDC access"
  iam_role_name        = "${var.project}-${var.environment}-GitHubOIDC-Role"
  iam_role_policy      = "AmazonS3FullAccess"
}