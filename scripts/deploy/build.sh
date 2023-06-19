#!/bin/bash
set -eo pipefail

#################################################
# Build  layers, steps:
#       . install node modules
#       . zip content
#           zip will be used by publish-delta.sh
#       . clean up
#################################################

ENV_NAME=$1

cd ../../nodejs

# Install node modules
if [[ "dev,prd" =~ ${ENV_NAME} ]]; then 
    npm install --production
else 
    npm install --save-dev
fi

# Prepare package
cd ../
zip -vr layer_delta.zip nodejs/ -x "*.DS_Store"
