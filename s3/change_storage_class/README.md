# Changing a storage class

## Create a bucket

```sh
aws s3 mb s3://change-storage-class-md-1209
```

## Create a file

```sh
echo "Hello World" > myfile.txt
aws s3 cp myfile.txt s3://change-storage-class-md-1209 --storage-class STANDARD_IA
```

# Cleanup

```sh
aws s3 rm s3://change-storage-class-md-1209/myfile.txt
aws s3 rb s3://change-storage-class-md-1209
```
