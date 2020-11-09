#!/bin/bash

SECRET_KEY=test_userpass2

# Get entire secret
# aws secretsmanager get-secret-value \
#   --secret-id $SECRET_KEY

# Get just the SecretString
# aws secretsmanager get-secret-value \
#   --secret-id $SECRET_KEY \
#   --query SecretString

# Get the String without quotes
# aws secretsmanager get-secret-value \
#   --secret-id $SECRET_KEY \
#   --query SecretString \
#   --output text

# Install jq on MacOS with Homebrew - brew install jq

# Get the secret and parse with jq to get username
aws secretsmanager get-secret-value \
  --secret-id $SECRET_KEY \
  --query SecretString \
  --output text \
  | jq -r .username

# Get the secret and parse with jq to get password
aws secretsmanager get-secret-value \
  --secret-id $SECRET_KEY \
  --query SecretString \
  --output text \
  | jq -r .password