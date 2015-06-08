#!/bin/bash
middleman build
aws s3 sync /app/build ${BUCKET} --delete --acl public-read --region us-east-1