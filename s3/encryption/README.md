## Create a bucket

```sh
aws s3 mb s3://encryption-fun-19028
```

## Create a file

```sh
echo ""Hello World" > myfile.txt
aws s3 cp myfile.txt s3://encryption-fun-19028
```

## Put object with encryption of KMS

```sh
aws s3api put-object \
--bucket encryption-fun-19028 \
--key myfile.txt \
--body myfile.txt \
--server-side-encryption aws:kms
--sse-kms-key-id YOUR_KEY
```

## Put object with SSE-C

```sh
aws s3api put-object \
--bucket encryption-fun-19028 \
--key myfile.txt \
--body myfile.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $YOUR_CUSTOMER_KEY \
--sse-customer-md5 MD5_HASH_OF_KEY
```
