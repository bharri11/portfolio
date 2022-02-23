#!/bin/bash

# Script to display the /etc/passwd file in a neat tabular format
# Brett Harris 22/2/2022

# The awk script is lengthy so is called from its own resource file
cat /etc/passwd | awk -F ":" -f "./awkscript"
