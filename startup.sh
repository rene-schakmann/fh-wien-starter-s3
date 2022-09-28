#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo docker run --name demo-app -p 80:80 -e cloud.aws.credentials.access-key='YOUR-ACCESS-KEY' -e cloud.aws.credentials.secret-key='YOUR-SECRET_KEY' -e custom.bucket-name='YOUR-BUCKET-NAME' renes2/fh-wien:latest