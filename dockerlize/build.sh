#! /bin/bash 
###########################################
# Build Client Image for songni
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)

## Get app version
## CIT_ID=`git rev-parse HEAD` # long version
CIT_ID=`cd $baseDir && git log --pretty=format:'%h' -n 1` # short version

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..

eval "$(docker-machine env docker-default)"

docker build \
    --force-rm=true \
    --tag hain/cnodebb:$CIT_ID \
    --file="Dockerfile" .

docker tag -f hain/cnodebb:$CIT_ID hain/cnodebb:latest
