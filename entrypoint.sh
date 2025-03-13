#!/bin/env bash

echo "Initializing Globus Container..."

# Set up directories and permissions
mkdir -p /home/gridftp/globus_config /home/gridftp/data
chmod -R 777 /home/gridftp/globus_config /home/gridftp/data

# Check if optional mode is enabled
if [ "$GLOBUS_OPTIONAL_MODE" = "true" ]; then
    echo "Globus is running in optional mode. External connections can be configured later."
else
    echo "Globus is starting normally..."
    if [ "$START_GLOBUS" = "true" ]; then
        su gridftp -c "cd /home/gridftp && source ./globus-connect-personal.sh"
    else
        su gridftp -c "cd /home/gridftp && source ./initialization.sh"
    fi
fi

echo "Globus setup complete."

# Keep container running
tail -f /dev/null
