# CHANGELOG

## [1.0.0-beta2]

2026-02-17

## Highlights (1.0.x)

- Automatically installs [swiftDialog](https://github.com/swiftDialog/swiftDialog) to provide customizable user messaging. (Thanks to @bartreardon for his dedication to the project!)
- Automatically (optionally) opens the Touch ID System Settings and then focuses the macOS user interface (by forcefully hiding all other applications) until Touch ID is enabled.
- Automatically opens the Platform SSO registration window and then focuses the macOS user interface (by forcefully hiding all other applications) until Platform SSO is registered.
- Automatically enables relevant AutoFill password extensions.
- For computers managed by [Jamf Pro](https://www.jamf.com/products/jamf-pro/), automatically start Device Compliance (for Entra ID) registration and update computer inventory.
- For computers managed by [Workspace ONE](https://www.omnissa.com/products/workspace-one-unified-endpoint-management/), automatically update Workspace ONE sensors and computer inventory.
- Detailed and easy-to-read command line feedback and local logging at `/var/log/pseudo.log`.

### Compatibility Notes (1.0.x)

- `pseudo` requires macOS 15 or newer.
- `pseudo` requires system (root) privileges.
- `pseudo` is compatible with Platform SSO workflows via Microsoft (Entra ID) Company Portal and Okta Verify.
- `pseudo` requires a [PPPC configuration profile](https://support.apple.com/guide/deployment/privacy-preferences-policy-control-payload-dep38df53c2a/web) granting specific permissions for the process that starts the `pseudo` script:
	- Allow sending AppleEvents to com.apple.finder, com.apple.systemuiserver, and com.apple.systemevents.
	- Allow use of Accessibility.
- The [Pseudo-Sidekicks folder](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta2/Pseudo-Sidekicks) contains useful related items including:
	- Example PPPC configuration profiles.
	- Management inventory attribute scripts.

### Known Issues (5.x)

- The `pseudo` workflow has not been thoroughly tested on macOS 15.
- The `pseudo` workflow has not been thoroughly tested with Okta Platform SSO.

### Specific Changes (1.0.0-beta2)

- New optional `CHECK_REQUIRED_CONFIG_PROFILES` paramater allows you to specify a comma-separated list of configuration profile identifiers that should be installed prior to running the `pseudo` workflow. This fail-safe mechanism prevents the workflow from running if the computer doesn't have all the appropriate configuration profiles required for your Platform SSO implementation.
- New validation to check if Touch ID hardware is available to the system. (Shout out to @acodega, @dan-snelson, and @alexfinn for their help identifying methods for this!)
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
