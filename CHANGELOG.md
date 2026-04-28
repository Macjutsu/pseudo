# CHANGELOG

## [1.0.0-beta5]

2026-04-28

## Highlights (1.0.x)

- Automatically installs [swiftDialog](https://github.com/swiftDialog/swiftDialog) to provide customizable user messaging. (Thanks to @bartreardon for his dedication to the project!)
- Automatically (optionally) opens the Touch ID System Settings and then focuses the macOS user interface (by forcefully hiding all other applications) until Touch ID is enabled.
- Automatically opens the Platform SSO registration window and then focuses the macOS user interface (by forcefully hiding all other applications) until Platform SSO is registered.
- Automatically enables relevant AutoFill password extensions.
- For computers managed by [Jamf Pro](https://www.jamf.com/products/jamf-pro/), automatically (optionally) start Device Compliance registration and update computer inventory.
- For computers managed by [Workspace ONE](https://www.omnissa.com/products/workspace-one-unified-endpoint-management/), automatically (optionally) update Workspace ONE computer inventory and sensors.
- Detailed and easy-to-read command line feedback and local logging at `/var/log/pseudo.log`.

### Compatibility Notes (1.0.x)

- `pseudo` requires macOS 15 or newer.
- `pseudo` requires system (root) privileges.
- `pseudo` is compatible with Platform SSO workflows via Microsoft (Entra ID) Company Portal and Okta Verify.
- `pseudo` requires a [PPPC configuration profile](https://support.apple.com/guide/deployment/privacy-preferences-policy-control-payload-dep38df53c2a/web) granting specific permissions for the process that starts the `pseudo` script:
	- Allow use of Accessibility.
	- Allow sending AppleEvents to com.apple.finder, com.apple.systemuiserver, and com.apple.systemevents.
- The [Pseudo-Sidekicks folder](https://github.com/Macjutsu/pseudo/blob/main/Pseudo-Sidekicks) contains useful related items including:
	- Example PPPC configuration profiles.
	- Management inventory attribute scripts.

### Known Issues (1.x)

- User focus modes disable the Platform SSO notification, as such the `pseudo` script will not be able to open the notification.
- The `pseudo` workflow has not been thoroughly tested on macOS 15.
- The `pseudo` workflow has not been thoroughly tested with Okta Platform SSO.

### Specific Changes (1.0.0-beta5)

- New mechanism to open the Platform SSO registration via System Settings. This new method is faster, more reliable, and allows for repairing the Platform SSO registration. (Thanks to @sebLuns for help developing this new method!)
- New optional parameter `REPAIR_MODE` always runs the Platform SSO registration workflow even if the account was previously registered. This mode also skips the Touch ID workflow and the dialog that asks the user to start the Platfrom SSO registration. Setting this paramater to any other value besides "TRUE" will disable this option.
- New `TIMEOUT_DIALOG_SECONDS=60` parameter defines the specific timeout for waiting for the user to respond to swiftDialog.
- New `TIMEOUT_OPEN_SECONDS=10` parameter defines the specific timeout for opening a system dialog. This should generally only be a few seconds.
- Updated parameter name (to better align with other names) `TIMEOUT_WORKFLOW_SECONDS=300` defines the timeout for an entire workflow.
- Updated Touch ID workflow can run independent of Platform SSO workflow. This allows you to enforce or encourage Touch ID without Platform SSO.
- New error detection of conflicting Touch ID restrictions from a configuration profile.
- Updated Okta Platform SSO registration workflow allows the user's default browser to re-open in order to facilitate browser-based registration.
- Updated [swiftDialog 3.0.1](https://github.com/swiftDialog/swiftDialog/releases/tag/v3.0.1) is automatically installed. (Thanks to @bartreardon for his dedication to the project!)
- Countless typo fixes and improvements for dialogs and log output.
- `pseudo` [1.0.0-beta5 SHA-256: 45b44c58b594da849463d64ae44fdf2e0149e1d5826ea2084414ae24092cadb0](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta5/pseudo.checksum.txt)

### Specific Changes (1.0.0-beta4)

- New Platform SSO introduction dialog.
- New Platform SSO active dialog (indicating that the user is interacting with the Platform SSO registration dialog).
- New Platform SSO local account finalization dialogs. Including unique dialogs for local password sync and SmartCard pairing.
- New Touch ID and Platform SSO success dialogs. Including unique success dialogs for each Platform SSO authentication method (password, Secure Enclave, and SmartCard).
- New Touch ID and Platform SSO failure dialogs.
- New `/var/log/pseudo.log` entries for swfitDialog events including opening and closing of specific dialogs.
- Significant rewrite of all user interface detections in an effort to support the above dialogs and all localization languages.
- **NOTE: In order to support localization languages the [Platform SSO `AccountDisplayName` key](https://developer.apple.com/documentation/devicemanagement/extensiblesinglesignon/platformsso-data.dictionary) is now required for the `pseudo` workflow.**
- New optional `ENABLE_AUTOFILL_EXTENSIONS` parameter allows you to control the option to automatically enable AutoFill extensions. Setting this paramater to any other value besides "TRUE" will disable this option.
- New AutoFill extensions behavior now checks every time the `pseudo` script runs and will re-enable the extensions even if the Platform SSO workflow doesn't need to run (because the user is already registered for Platform SSO).
- New AutoFill extensions behavior now automatically closes the (unnecessary) Platform SSO AutoFill dialog.
- New Jamf Pro Extension Attribute script to collect the list of enabled third-party extensions in the [Pseudo-Sidekicks folder](https://github.com/Macjutsu/pseudo/blob/main/Pseudo-Sidekicks).
- New Jamf Pro device compliance update workflow now checks every time the `pseudo` script runs and will re-enable Jamf Pro device compliance even if the Platform SSO workflow doesn't need to run (because the user is already registered for Platform SSO).
- New Platform SSO configuration detection mechanism now checks for both the managed preference and output from the `app-sso` command.
- New identification of user Focus modes. A future version of `pseudo` will leverage this to attempt alternative methods to start the Platform SSO registration.
- Significant rewrite of the mechanism that hides other visible applications to improve reliability and support more workflow stages.
- Significant rewrite of timeout mechanisms to improve accuracy and support more workflow stages.
- Significantly improved Platform SSO registration failure detections.
- Significant reordering of workflow functions to better support new features. (Apologies to those who have branched earlier versions!)
- Resolved [an issue](https://github.com/Macjutsu/pseudo/issues/10#issuecomment-4077326668) that prevented accurate detection of previously registered Platform SSO user accounts.
- Resolved an issue where registration workflows start too soon on first login of a new user account. The startup workflow now waits for both Dock and Finder at login.
- Resolved an issue that was preventing swiftDialog validation if there is no actively logged in user.
- Resolved an issue where the Jamf Pro device compliance update workflow unnecessarily prompted the user to register.
- Updated Jamf Pro PPPC configuration profile in the [Pseudo-Sidekicks folder](https://github.com/Macjutsu/pseudo/blob/main/Pseudo-Sidekicks).
- New Terminal PPPC configuration profile in the [Pseudo-Sidekicks folder](https://github.com/Macjutsu/pseudo/blob/main/Pseudo-Sidekicks). **THIS CONFIGURATION PROFILE SHOULD ONLY BE DEPLOYED FOR TESTING AS IT ALLOWS FOR SIGNIFICANT SECURITY VULNERABILITIES!**
- Countless typo fixes and improvements for dialogs and log output.
- `pseudo` [1.0.0-beta4 SHA-256: e9e531bde61d92fe75e924d11588345832ec9ba8d49b9db147dff4caa1104cc0](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta4/pseudo.checksum.txt)

### Specific Changes (1.0.0-beta3)

- New optional `UPDATE_JAMF_PRO` parameter allows you to control the Jamf Pro inventory update workflow. Setting this paramater to any other value besides "TRUE" will disable this option.
- Updated optional parameter name (to better align with other names)`UPDATE_WORKSPACE_ONE` allows you to control the Workspace ONE inventory update workflow. Setting this paramater to any other value besides "TRUE" will disable this option.
- Updated optional parameter name and format (to better align with other parameter behavior)`UPDATE_WORKSPACE_ONE_SENSORS` allows you to specify a comma-separated list (previously space-separated) of Workspace ONE sensor names to trigger.
- Updated [swiftDialog 3.0.0 (out of beta)](https://github.com/swiftDialog/swiftDialog/releases/tag/v3.0.0) is automatically installed. (Thanks to @bartreardon for his dedication to the project!)
- Improved Notification Center menu selection should be more reliable on non-English (US) systems.
- Improved swiftDialog validation now derives the application path from the real path of the binary. This is an improvement over the previous static path now that the swiftDialog v3.x application is relocatable.
- Improved Platform SSO system configuration validation now parses the managed configuration profile (as opposed to using the technically unsupported `app-sso` command).
- Improved Platform SSO user configuration validation now parses output of the `app-sso` command using `jq` (as opposed to using `grep`).
- Improved error handling of management service inventory update issues.
- Various startup workflow optimizations and reorganization.
- Typo fixes and improvements for dialogs and log output.
- `pseudo` [1.0.0-beta3 SHA-256: 0f0719c531a1e6749107fca110e1602676610488a41eaa8737d5576eebd73f30](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta3/pseudo.checksum.txt)

### Specific Changes (1.0.0-beta2)

- New optional `CHECK_REQUIRED_CONFIG_PROFILES` paramater allows you to specify a comma-separated list of configuration profile identifiers that should be installed prior to running the `pseudo` workflow. This fail-safe mechanism prevents the workflow from running if the computer doesn't have all the appropriate configuration profiles required for your Platform SSO implementation.
- New validation to check if Touch ID hardware is available to the system. (Shout out to @acodega, @dan-snelson, @alexfinn, and @nonpunctual for their help identifying methods for this!)
- New optional `TOUCH_ID_CONFIG` parameter allows you to control the Touch ID registration workflow. Setting this parameter to `TOUCH_ID_CONFIG="REQUIRED"` enforces the Touch ID registration workflow, while setting it to `TOUCH_ID_CONFIG="OPTIONAL"` only presents the user with the opportunity to enable Touch ID. Finally, leaving this parameter blank `TOUCH_ID_CONFIG=""`, fully disables the Touch ID workflow. (Thanks to @patgmac for assisting with this new feature!)
- New Touch ID "introduction" dialogs for both required and optional workflows.
- New Workspace ONE integration automatically update sensors and computer inventory after the Platform SSO registration has completed. (Thanks to @patgmac for this new feature!)
- New Microsoft Intune example PPPC configuration profile and inventory attribute scripts in the [Pseudo-Sidekicks folder](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta2/Pseudo-Sidekicks). (Thanks to @anewhouse for these new additions!)
- Improved Jamf Pro Extension Attribute scripts in the [Pseudo-Sidekicks folder](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta2/Pseudo-Sidekicks).
- Updated [swiftDialog 3.0.0.4933](https://github.com/swiftDialog/swiftDialog/releases/tag/v3.0.0Beta5) is automatically installed. (Thanks to @bartreardon for his dedication to the project!)
- Typo fixes and improvements for dialogs and log output.
- `pseudo` [1.0.0-beta2 SHA-256: dea20b371a7cbeba043e731666c42ca1f64646d2217a6aa57444fa72bdbd42f5](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta2/pseudo.checksum.txt)

### Specific Changes (1.0.0-beta1)

- Initial public release.
- A special thanks goes out to others who directly assisted and/or inspired me to create `pseudo`; @PicoMitchell, @ScottEKendall, and @anewhouse.
- `pseudo` [1.0.0-beta1 SHA-256: 73f5b1d9f33008f89d79efcc984fd15bd7675697e711cdc44876d563f39bc526](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta1/pseudo.checksum.txt)
