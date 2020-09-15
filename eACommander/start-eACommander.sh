#!/bin/sh

# Path to binary
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Make sure binary is runnable
#chmod 754 "$DIR"/eACommander

# Run with libs
export LD_LIBRARY_PATH="$DIR":"$LD_LIBRARY_PATH"
"$DIR"/eACommander "$@"

