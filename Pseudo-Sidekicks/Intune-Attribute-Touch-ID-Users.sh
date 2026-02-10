#!/bin/bash

# This Intune Custom Attribute returns the list of Touch ID enabled users.
bioutil_users_ids=($(bioutil -c -s | awk '/User/ {print $2 $3}'))
bioutil_enabled_users=()

for user_id in "${bioutil_users_ids[@]}";do
	[[ $(echo "${user_id}" | awk -F ':' '{print $2}') -gt 0 ]] && bioutil_enabled_users+=($(id -P $(echo "${user_id}" | awk -F ':' '{print $1}') | awk -F ':' '{print $1}'))
done

IFS=$'\n'

if [[ ${#bioutil_enabled_users[@]} -gt 0 ]]; then
	echo "${bioutil_enabled_users[*]}"
else
	echo "None"
fi

exit 0
