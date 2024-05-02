#!/bin/bash

# Get the installation location of the fdk formula
# Check for fdk
installation_location=$(brew info fdk | grep Cellar | cut -d ' ' -f 1)
if [[ -n "$installation_location" ]]; then
    export PATH="$installation_location/custom_node_location/bin:$PATH"

# Check for fdk@9.1.1-beta
installation_location_beta=$(brew info fdk@9.1.1-beta | grep Cellar | cut -d ' ' -f 1)
if [[ -n "$installation_location_beta" ]]; then
    export PATH="$installation_location_beta/custom_node_location/bin:$PATH"
else
    echo "fdk not found"
fi
