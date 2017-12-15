#!/bin/bash

# Script that outputs a SSH config based on variables in host_vars directory
# Run from ansible directory and optionally add the output to your SSH config:
# ./ssh_config.sh >> ~/.ssh/config

echo '## Boerhaave exhibits'
for i in `find ./host_vars -type f`
do
  echo $i | sed -e 's/.*\///g' -e 's/\.yaml//g' -e 's/^/Host /g'
  echo "  User mansveld"
  grep ansible_ssh_host $i | sed -e 's/ansible_ssh_host:/  HostName/g'
done
