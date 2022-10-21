#!/bin/bash 

# Get the fully qualified board name (FQBN) and the port address from `arduino-cli board list`.
# Those two details will be used by `arduino-cli compile` and `arduino-cli upload`.

set -xe

arduino-cli board list --format json | jq .[0].matching_boards[0].fqbn | tr -d '"' >fqbn.txt
arduino-cli board list --format json | jq .[0].port.address | tr -d '"' >paddr.txt
