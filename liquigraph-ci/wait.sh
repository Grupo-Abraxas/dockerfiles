#!/bin/sh

set -e

url="$1"
shift
max_retries="$1"
shift
wait_between="$1"
shift
cmd="$@"

retries=0
until wget --spider -q "$url"; do
  retries=$((retries + 1))
  if [ "$retries" -eq "$max_retries" ]
    then
      exit 1
    else
      >&2 echo "Waiting for $wait_between second(s)"
      sleep $wait_between
  fi
done

>&2 echo "$url is available"
exec $cmd