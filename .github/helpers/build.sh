#!/bin/bash
environment_name=${1:-'local'}
token=${2:-'token'}
github_environment=${3:-'null'}

if [[ $# -gt 2 ]]; then
    echo "RPM_ENVIRONMENT=$environment_name" >>$github_environment
    echo "REACT_APP_RPM_ENVIRONMENT=$environment_name" >>$github_environment
else
    export RPM_ENVIRONMENT=$environment_name
    export REACT_APP_RPM_ENVIRONMENT=$environment_name
fi

echo 'Building RPM from environment: '$environment_name

rm -rf ./client
git clone --branch $environment_name https://${token}:x-oauth-basic@github.com/twattley/react-graphql.git client
cd client
ls -la