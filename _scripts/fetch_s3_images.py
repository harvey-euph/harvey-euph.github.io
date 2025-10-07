import os
import boto3

bucket_name = os.environ['S3_BUCKET']
region_name = os.environ.get('AWS_REGION', 'ap-northeast-1')
local_dir = os.environ.get('LOCAL_DIR', 'asset/img-from-aws-s3')

os.makedirs(local_dir, exist_ok=True)

s3 = boto3.client('s3', region_name=region_name)

# 列出 bucket 下所有物件
paginator = s3.get_paginator('list_objects_v2')
for page in paginator.paginate(Bucket=bucket_name):
    for obj in page.get('Contents', []):
        key = obj['Key']
        if not key.lower().endswith(('.png', '.jpg', '.jpeg', '.gif', '.webp')):
            continue  # 只抓圖片

        # 本地檔案路徑
        local_path = os.path.join(local_dir, os.path.basename(key))
        s3.download_file(bucket_name, key, local_path)
        print(f"Downloaded {key} -> {local_path}")
