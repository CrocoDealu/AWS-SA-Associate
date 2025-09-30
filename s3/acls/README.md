## Create a new bucket

```sh
aws s3 mb s3://my-bucket-test-1902
```

## Turn off Block Public Acess for acls

```sh
aws s3api put-public-access-block \
--bucket my-bucket-test-1902 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block \
--bucket my-bucket-test-1902
```

## Change bucket ownership

```sh
aws s3api put-bucket-ownership-controls \
--bucket my-bucket-test-1902 \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change acls to allow for another user in another aws account

```sh
aws s3api put-bucket-acl \
--bucket my-bucket-test-1902 \
--grant-full-control emailaddress=idk182369236523657@example.com \
```

## Cleanup

```sh
aws s3 rb s3://my-bucket-test-1902
```
