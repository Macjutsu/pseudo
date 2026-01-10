#!/bin/bash

# This Jamf Pro Extension Attribute returns the list of Platform SSO registered users.
local_users=($(dscl . list /Users | grep -v '^_'))
psso_enabled_users=()

for user_name in "${local_users[@]}";do
	[[ "$(dscl . read /Users/"${user_name}" dsAttrTypeStandard:AltSecurityIdentities 2>/dev/null | awk -F'SSO:' '/PlatformSSO/ {print $2}')" ]] && psso_enabled_users+=("${user_name}")
done

IFS=$'\n'

if [[ ${#psso_enabled_users[@]} -gt 0 ]]; then
	echo "<result>${psso_enabled_users[*]}</result>"
else
	echo "<result>False</result>"
fi

exit 0
