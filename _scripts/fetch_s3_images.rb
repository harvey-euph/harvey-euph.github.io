#!/usr/bin/env ruby
require "aws-sdk-s3"
require "fileutils"

# 讀環境變數
bucket_name = ENV["S3_BUCKET"]
aws_access_key_id = ENV["AWS_ACCESS_KEY_ID"]
aws_secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
aws_region = ENV.fetch("AWS_REGION", "ap-northeast-1")  # 改成東京
local_dir = "_assets/s3-bucket"                           # 改成本地路徑

FileUtils.mkdir_p(local_dir)

s3 = Aws::S3::Client.new(
  region: aws_region,
  access_key_id: aws_access_key_id,
  secret_access_key: aws_secret_access_key
)

puts "Fetching all files from bucket #{bucket_name}..."

continuation_token = nil
loop do
  resp = s3.list_objects_v2(
    bucket: bucket_name,
    continuation_token: continuation_token
  )

  resp.contents.each do |obj|
    next if obj.key.end_with?("/")  # 忽略資料夾
    filename = File.join(local_dir, File.basename(obj.key))
    puts "Downloading #{obj.key} -> #{filename}"
    s3.get_object({ bucket: bucket_name, key: obj.key }, target: filename)
  end

  break unless resp.is_truncated
  continuation_token = resp.next_continuation_token
end

puts "Done!"
