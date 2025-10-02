## Create a user with no permissions

```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```

```sh
export AWS_ACCESS_KEY_ID= && export AWS_SECRET_ACCESS_KEY= && export AWS_REGION=eu-north-1
```

```sh
chmod u+x deploy.sh && ./deploy.sh
```

## Create a role

```sh
aws cloudformation deploy \
--template-file /path_to_template/template.json \
--stack-name my-new-stack \
```

## Assume the new role and try to get buckets

```sh
aws sts assume-role \
--role-arn arn:aws:iam::215726089494:role/my-sts-stack-StsRole-yK9hCKqXzzKU \
--role-session-name s3-sts-fun \
--profile sts
```
