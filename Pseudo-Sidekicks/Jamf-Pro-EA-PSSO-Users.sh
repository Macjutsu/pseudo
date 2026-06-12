#!/bin/bash

# This Jamf Pro Extension Attribute returns the list of Platform SSO enabled users.
# Expected output includes both the local user account name and the redacted IDp account name (due to macOS limitations) or accounts that need to repair their registration.
# shellcheck disable=SC2012,SC2024,SC2207

user_accounts=($(dscl . list /Users | grep -v '^_'))
psso_user_accounts=()
for user_account in "${user_accounts[@]}";do
	[[ "$(dscl . read /Users/"${user_account}" dsAttrTypeStandard:AltSecurityIdentities 2>/dev/null | awk -F'SSO:' '/PlatformSSO/ {print $2}')" ]] && psso_user_accounts+=("${user_account}")
done
IFS=$'\n'

if [[ ${#psso_user_accounts[@]} -gt 0 ]]; then
	psso_verified_user_accounts=()
	for psso_user_account in "${psso_user_accounts[@]}"; do
		psso_user_login_name=$(launchctl asuser "$(id -u "${psso_user_account}" 2> /dev/null)" sudo -u "${psso_user_account}" app-sso platform -s 2> /dev/null | sed -e '1,/User Configuration:/d' | tr -d '\\' | jq -r '.userLoginConfiguration.loginUserName' 2> /dev/null)
		[[ -n "${psso_user_login_name}" ]] && psso_verified_user_accounts+=($(echo "${psso_user_account}:${psso_user_login_name}"))
		[[ -z "${psso_user_login_name}" ]] && psso_verified_user_accounts+=($(echo "${psso_user_account}:Needs Platform SSO Repair"))
	done
fi

if [[ ${#psso_verified_user_accounts[@]} -gt 0 ]]; then
	echo "<result>${psso_verified_user_accounts[*]}</result>"
else
	echo "<result>No Platform SSO Registered Users</result>"
fi

exit 0
