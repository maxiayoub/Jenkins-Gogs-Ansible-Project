#!/bin/bash

# Retrieve a list of users from the "nginxG" group
group_members=$(getent group nginxG | cut -d: -f4)

echo "Members of nginxG group:"
for member in $group_members; do
    echo "$member"
done
