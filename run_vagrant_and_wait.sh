#!/bin/bash

vagrant up

if [ $? -ne 0 ]; then
  echo "Failed to start Vagrant machine. Exiting."
  exit 1
fi

echo "Vagrant started successfully. Waiting until terminated."

while [ $? -eq 0 ]
do
  sleep 10
  vagrant status | fgrep 'running'
done

echo "Finished."

