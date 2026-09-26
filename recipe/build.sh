#!/bin/bash

BASE_URL="https://conda.anaconda.org"
NAME=fake_services
CHANNEL_NAME="services"
URL=${BASE_URL}/${CHANNEL_NAME}

for platform in win-64 linux-64 osx-64 osx-arm64 noarch
do 
  echo "Working on $platform"  
  mkdir -p $PREFIX/$NAME/$platform

  # without this file - conda is very slow on windows
  echo "{}" >> $PREFIX/$NAME/$platform/current_repodata.json

  curl -o $PREFIX/$NAME/$platform/repodata.json $URL/$platform/repodata.json
  curl -o $PREFIX/$NAME/$platform/patch_instructions.json $URL/$platform/patch_instructions.json
  curl -o $PREFIX/$NAME/$platform/repodata_from_packages.json $URL/$platform/repodata_from_packages.json

  echo "Contents of ${PREFIX}/$NAME/$platform"
  ls -ls $PREFIX/$NAME/$platform

done


