#!/bin/bash

# This Jamf Pro Extension Attribute returns the list of Touch ID enabled users.
# shellcheck disable=SC2012,SC2024,SC2207

ioreg_result=$(ioreg -l 2>/dev/null)
if [[ $(echo "${ioreg_result}" | grep -c -e '\"AppleBiometricSensor\"=[1-9]') -gt 0 ]] || [[ $(echo "${ioreg_result}" | grep -c -e 'with Touch ID') -gt 0 ]]; then
	bioutil_users_ids=($(bioutil -c -s | awk '/User/ {print $2 $3}'))
else
	echo "<result>No Touch ID Hardware</result>"
	exit 0
fi

bioutil_enabled_users=()
for user_id in "${bioutil_users_ids[@]}";do
	[[ $(echo "${user_id}" | awk -F ':' '{print $2}') -gt 0 ]] && bioutil_enabled_users+=("$(id -P "$(echo "${user_id}" | awk -F ':' '{print $1}')" | awk -F ':' '{print $1}')")
done

IFS=$'\n'
if [[ ${#bioutil_enabled_users[@]} -gt 0 ]]; then
	echo "<result>${bioutil_enabled_users[*]}</result>"
else
	echo "<result>No Touch ID Users</result>"
fi

exit 0
