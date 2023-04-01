#!/bin/bash
terraform init | grep " successfully initialized!" && terraform validate && terraform plan &&  echo "Plan completed" && terraform apply --auto-approve 
