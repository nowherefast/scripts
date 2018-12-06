#!/bin/bash

#Note: Requires realpath to run.

while getopts ":p:k:s:o:r:t:h" opt; do
  case ${opt} in
    p )
	  profile=$OPTARG
      ;;
    k )
      accessKey=$OPTARG
      ;;
    s )
	  secretKey=$OPTARG
      ;;
    o )
      osType=$OPTARG
      ;;
    r )
      region=$OPTARG
      ;;
    t )
      outputType=$OPTARG
      ;;
    h )
	  echo "Usage:"
	  echo "    -h  help"
	  echo "    -p  name of profile (required)"
	  echo "    -k  aws access key (required)"
	  echo "    -s  aws secret key (required)"
	  echo "    -o  type of OS (required), can be 'ubuntu' only"
	  echo "    -r  aws region"
	  echo "    -t  output type (json|text)"
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



case ${osType} in
	ubuntu )
	  credentialPath=$(realpath ~/.aws/credentials) #path must not be in quotes
	  configPath=$(realpath ~/.aws/config)
	  ;;
esac

#
# Generating the credentials file
#
echo "" >> ${credentialPath} #/n not recognized
echo "[${profile}]" >> ${credentialPath}
echo "aws_access_key_id = ${accessKey}" >> ${credentialPath}
echo "aws_secret_access_key = ${secretKey}" >> ${credentialPath}

#
# Generating the config file
#
echo "" >> ${configPath} #/n not recognized
echo "[${profile}]" >> ${configPath}
echo "region = ${accessKey}" >> ${configPath}
echo "output = ${secretKey}" >> ${configPath}
