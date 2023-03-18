## ANSIBLE VARIABLES
Create the following variables in a file called secrets.yml
- db_user
- db_password
- email
- receiver
- email_password
Then encrypt the secrets.yml file with ansible vault.

## CREATING THE S3 AND DYNAMO DB BACKEND FOR TERRAFORM
* Once the variables and sensitive information are in place, `cd` into the backend directory and adjust the `variables.tf`.
* Open the `s3.tf` file and comment out `force_destroy = true` in the `aws_s3_bucket` resource block.
* Then run ```terraform init && terraform apply -auto-approve```

## CREATING THE JENKINS SERVER
* After creating Terraform backend, `cd` into the jenkins directory and adjust the `variables.tf`.
* Then run ```terraform init && terraform apply -auto-approve```

## PROVISION AND DEPLOY
### JENKINS CREDENTIALS
* Create an password file; add your ansible vault password to that file.
* Then upload the file to a secret file credential with ID: `ANSIBLE_VAULT_PASSWORD_FILE`.
* Create four secret texts with IDs: ```TF_VARS_db_user, TF_VARS_db_password, AWS_ACCESS_KEY_ID, and AWS_SECRET_ACCESS_KEY```
* Then Build
