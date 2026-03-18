#!/bin/bash

# This Jamf Pro Extension Attribute returns the list of enabled third-party (non-apple) extensions for the current user.
# shellcheck disable=SC2012,SC2024,SC2207

current_user_account_name=$(scutil <<<"show State:/Users/ConsoleUser" | awk '/Name :/ {$1=$2="";print $0;}' | xargs)

if [[ -z "${current_user_account_name}" ]] || [[ "${current_user_account_name}" == "root" ]] || [[ "${current_user_account_name}" == "_mbsetupuser" ]] || [[ "${current_user_account_name}" == "loginwindow" ]]; then
	exit 0
else
	current_user_id=$(id -u "${current_user_account_name}" 2> /dev/null)
	[[ -z "${current_user_id}" ]] && exit 0
	pluginkit_response=$(launchctl asuser "${current_user_id}" sudo -u "${current_user_account_name}" pluginkit -m 2> /dev/null | awk '!/apple/ && /\+/ {print $2}')
fi

if [[ -n "${pluginkit_response}" ]]; then
	echo "<result>${pluginkit_response}</result>"
else
	echo "<result>No Enabled Third-Party Extensions</result>"
fi

exit 0
