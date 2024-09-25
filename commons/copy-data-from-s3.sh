#!/bin/bash

# This init script shows how to (recursively) import data from MinIO to the service local storage
# using the mc client
# Expected parameters : None

# Bucket : `donnees-insee` 
# Remote directory which content we want to fetch : `diffusion/GEOGRAPHIE/2019 data`
# Local directory (created if it doesn't exist) : `data` 
mc cp -r s3/donnees-insee/diffusion/GEOGRAPHIE/2019 data/
