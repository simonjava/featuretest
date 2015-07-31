#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: ./ship_to.sh CHANNEL_ID"
  exit
fi

git checkout ./src/main/java/com/csm/feature/config/Constants.java

#pushd ./
python gen_build_settings.py $1
#popd

echo $1 > ./src/main/assets/channelId

#pushd ../
gradle clean build
#popd

if [ ! -d "ship" ]; then
  mkdir ship
fi

cp build/outputs/apk/app-debug.apk ship/mivTalk-$1-debug.apk
git checkout ./src/main/java/com/csm/feature/config/Constants.java
git checkout ./src/main/assets/channelId

