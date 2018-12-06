#!/bin/bash

while getopts ":p:f:b:i:h" opt; do
  case ${opt} in
    p )
      profile=$OPTARG
      ;;
  	f )
	    file=$OPTARG
      ;;
    b )
	    bucketPath=$OPTARG
      ;;
    i )
	    includePattern=$OPTARG
      ;;  
    h )
      echo "Usage:"
      echo "    -h  help"
      echo "    -p  aws profile name (TODO)"
      echo "    -f  path to a file"
      echo "    -b  bucket and path in s3 e.g. 'bucket-name/some/path/'"
      echo "    -i  include all files matching pattern (TODO)"
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))


if [[ ! -z "$file" ]] && [[ ! -z "$bucketPath" ]]
then
  aws s3 cp ${file} s3://${bucketPath}
fi