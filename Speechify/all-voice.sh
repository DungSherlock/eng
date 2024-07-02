#!/bin/bash

## bỏ "john" 
voice=("presidential" "mrbeast" "snoop" "gwyneth" "nate" "jamie" "bwyneth" "cliff" "mary" "henry" "david" "emma" "kristy" "oliver" "benwilson" "tasha" "joe" "lisa" "george" "emily" "rob" "jessica" "aria" "kyle" "carly" "sally" "simon")

for name in "${voice[@]}"; do
  cp voice-scripts/john.sh voice-scripts/$name.sh
done
wait
for script in voice-scripts/*.sh; do
  bash "$script" &
done
wait