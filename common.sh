#!/bin/bash

# validate entry arguments
if (( $# < 1 )); then
    echo "Application not selected!"
    exit 1
fi

if (( $# < 2 )); then
    echo "Envirment not selected!"
    exit 1
fi

# CONSTANTS
COMPANY=pietrum

PCK_NAME=$(node -p "require('./$1/package.json').name")
PCK_VERSION=$(node -p "require('./$1/package.json').version")
