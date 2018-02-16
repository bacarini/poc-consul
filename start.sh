#!/bin/bash

set -ex

consul agent -config-dir config.json &

curl \
    --request PUT \
    --data-binary "@contract.json" \
    http://52.87.186.115/v1/kv/contracts/function

ruby app.rb
