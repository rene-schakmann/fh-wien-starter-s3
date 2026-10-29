# fh-wien-starter-s3

Terraform starter that deploys a VPC with a public subnet and an EC2 instance
(latest Amazon Linux 2023) running the `renes2/fh-wien` S3 demo app in Docker on port 80.

## Setup

* Add your infrastructure code to main.tf
* Adapt the startup.sh to add your access key, secret key & bucket name
  (the app fails to start with the placeholder values)

## Usage

Requires Terraform >= 1.x and AWS credentials for `eu-central-1`.

```sh
terraform init
terraform apply                         # without SSH access
terraform apply -var key_name=my-key    # with an existing EC2 key pair for SSH
```

The app is then reachable at `http://<public_ip>` (printed as output; give the
instance ~2 minutes to boot).

Clean up afterwards to avoid costs:

```sh
terraform destroy
```

Terraform state is stored locally and is not committed to git.
