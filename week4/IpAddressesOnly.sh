#!/bin/bash

# Script to take the output from IpInfo.sh script and only print
# lines containing "IP Address" in them.
# Brett Harris 15/2/2022

# Store the output of IpInfo.sh into a variable
iponly=$(./IpInfo.sh)

# Pass the contents of the variable thru sed printing only the
# required lines
echo "$iponly" | sed -n '/IP Address/p'