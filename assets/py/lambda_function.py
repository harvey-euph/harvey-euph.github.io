import boto3
import json
import os
from urllib.parse import unquote_plus

s3 = boto3.client("s3")
BUCKET = os.environ["BUCKET_NAME"]

def lambda_handler(event, context):
    params = event.get("queryStringParameters") or {}
    filename = unquote_plus(params.get("filename", ""))
    content_type = params.get("type", "application/octet-stream")

    if not filename:
        return {"statusCode": 400, "body": json.dumps({"error": "Missing filename"})}

    url = s3.generate_presigned_url(
        "put_object",
        Params={
            "Bucket": BUCKET,
            "Key": filename,
            "ContentType": content_type,
        },
        ExpiresIn=3600,
    )

    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": json.dumps({"url": url}),
    }
