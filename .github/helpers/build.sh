#!/bin/bash
environment_name=${1:-'local'}
github_environment=${2:-'null'}

if [[ $# -gt 1 ]]; then
    echo "RPM_ENVIRONMENT=$environment_name" >>$github_environment
    echo "REACT_APP_RPM_ENVIRONMENT=$environment_name" >>$github_environment
else
    export RPM_ENVIRONMENT=$environment_name
    export REACT_APP_RPM_ENVIRONMENT=$environment_name
fi

echo 'Building RPM from environment: '$environment_name

rm -rf ./client
git clone --branch $environment_name git@github.com:twattley/react-graphql.git client
cd client
ls -la