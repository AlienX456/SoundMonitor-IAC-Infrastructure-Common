resource "aws_lambda_permission" "allow_bucket-1" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.s-1.arn
}

resource "aws_lambda_permission" "allow_bucket-2" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.s-2.arn
}


resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = data.aws_s3_bucket.s-1.bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.func.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_bucket-1]

}resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = data.aws_s3_bucket.s-1.bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.func.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_bucket-2]
}
