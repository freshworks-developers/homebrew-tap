#!/bin/bash

# Get the installation location of the fdk formula
installation_location=$(brew info fdk | grep Cellar | cut -d ' ' -f 1)
export PATH="$installation_location/custom_node_location/bin:$PATH"