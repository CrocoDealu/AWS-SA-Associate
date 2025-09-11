# Playing with metadata

## Creating a bucket

```sh
aws s3 mb s3://metadata-fun-md-1209
```

## Create a new file

```sh
echo "Hey Mike" > myfile.txt
```

## Upload the file to the bucket and set its metadata

```sh
aws s3api put-object --bucket metadata-fun-md-1209 --key "myfile.txt" --body myfile.txt --metadata Planet=mars
```

## Get metadata

```sh
aws s3api head-object --bucket metadata-fun-md-1209 --key myfile.txt
```
