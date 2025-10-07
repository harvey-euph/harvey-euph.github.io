import os
import boto3

bucket_name = os.environ['S3_BUCKET']
region_name = os.environ.get('AWS_REGION', 'ap-northeast-1')
local_dir = os.environ.get('LOCAL_DIR', 'asset/img-from-aws-s3')

os.makedirs(local_dir, exist_ok=True)

s3 = boto3.client('s3', region_name=region_name)

paginator = s3.get_paginator('list_objects_v2')
for page in paginator.paginate(Bucket=bucket_name):
    for obj in page.get("Contents", []):
        key = obj["Key"]  # e.g., "anime/hikikomori.png"
        local_path = os.path.join(local_base, key)
        os.makedirs(os.path.dirname(local_path), exist_ok=True)
        s3.download_file(bucket, key, local_path)
        print(f"Downloaded {key} -> {local_path}")
