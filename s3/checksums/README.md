# Create A New Bucket

```md
aws s3 mb s3://checksums-examples-md-1234
```

## Create a file to do a checksum on

```md
echo "Hello Mars" > myfile.txt
```

### Get the checksum of a file

```md
md5sum myfile.txt
8ed2d86f12620cdba4c976ff6651637f myfile.txt
```

## Upload file to aws s3

```md
aws s3 cp myfile.txt s3://checksums-examples-md-1234
aws s3api head-object --bucket checksums-examples-md-1234 --key myfile.txt
```

## Try to upload a file with a different checksum

```md
openssl dgst -sha1 -binary myfile.txt | base64
wozMLF4hQDaAYBTfn7Q2NPPncLI=
```

```sh
aws s3api put-object \
--bucket checksums-examples-md-1234 \
--key myfilesha1.txt \
--body myfile.txt \
--checksum-algorithm="SHA1" \
--checksum-sha1="wozMLF4hQDaAYBTfn7Q2NPPncLI="
```
