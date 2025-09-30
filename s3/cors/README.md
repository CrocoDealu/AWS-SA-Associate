## Create a bucket

```sh
aws s3 mb s3://new-test-bucket-129078
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket new-test-bucket-129078 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create bucket policy

```sh
aws s3api put-bucket-policy \
--bucket new-test-bucket-129078 \
--policy file://policy.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket new-test-bucket-129078 --website-configuration file://website.json
```

## Upload index.html file and include resource that would be cross origin

```sh
aws s3 cp index.html s3://new-test-bucket-129078
```

## View website

http://new-test-bucket-129078.s3-website.eu-north-1.amazonaws.com

## Apply CORS policy

```sh
aws s3api put-bucket-cors --bucket new-test-bucket-129078 --cors-configuration file://cors.json
```

## Cleanup

```sh
aws s3 rm s3://new-test-bucket-129078/index.html
aws s3 rb s3://new-test-bucket-129078
```
