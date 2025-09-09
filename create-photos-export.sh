#! /bin/bash

prefix="M_"

if [ $# != 2 ]; then
    echo "Usage: $0 <prefix> <file-to-use>"
    exit 1
fi    
if [ $1 != "M" ] && [ $1 != "L" ]; then
    echo "Prefix must be 'M' or 'L'"
    exit 1
fi
prefix=${1}_
file=$2

if [ ! -f $file ]; then
    echo "$file doesn't exist"
    exit 1
fi
trips=$(jq -r '.[] | .name' < $file )
for trip in $trips; do
    if [ ! -d $trip ]; then
        mkdir $trip
    fi
    start=$(jq -r --arg name $trip '.[]|select(.name==$name)|.start'  < $file )
    end=$(jq -r --arg name $trip '.[]|select(.name==$name)|.end'  < $file )
    osxphotos export $trip --from-date $start --to-date $end --filename "${prefix}{original_name}" --update
done