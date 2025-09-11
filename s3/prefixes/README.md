# Working with prefixes

## Creating a bucket

```sh
aws s3 mb s3://prefixes-work-1209
```

## Create folder

```sh
aws s3api put-object --bucket prefixes-work-1209 --key "home/"
```
