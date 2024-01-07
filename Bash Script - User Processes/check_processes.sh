#!/bin/bash

current_user="$USER"

echo "Processes for user: $current_user"
ps aux | grep "^$current_user"
