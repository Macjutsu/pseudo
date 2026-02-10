# CHANGELOG

## [1.0.0-beta1]

2026-01-09

## Highlights (1.0.x)

- Automatically installs [swiftDialog](https://github.com/swiftDialog/swiftDialog) to provide customizable user messaging. (Thanks to @bartreardon for his dedication to the project!)
- Automatically opens the Touch ID System Settings and then focuses the macOS user interface (by forcefully hiding all other applications) until Touch ID is enabled.
- Automatically opens the Platform SSO registration window and then focuses the macOS user interface (by forcefully hiding all other applications) until Platform SSO is registered.
- Automatically enables relevant AutoFill password extensions.
- For computers managed by [Jamf Pro](https://www.jamf.com/products/jamf-pro/), automatically start Device Compliance (for Entra ID) registration and update computer inventory.
- Detailed and easy-to-read command line feedback and local logging at `/var/log/pseudo.log`.

### Compatibility Notes (1.0.x)

- `pseudo` requires macOS 15 or newer.
- `pseudo` requires system (root) privileges.
- `pseudo` is compatible with Platform SSO workflows via Microsoft Company Portal and Okta Verify.
- `pseudo` requires a [PPPC configuration profile](https://support.apple.com/guide/deployment/privacy-preferences-policy-control-payload-dep38df53c2a/web) granting specific permissions for the process that starts the `pseudo` script:
	- Allow sending AppleEvents to com.apple.finder, com.apple.systemuiserver, and com.apple.systemevents.
	- Allow use of Accessibility.
- [Example required PPPC configuration profile for Jamf Pro](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta1/Pseudo-Sidekicks/Jamf-Pro-PPPC-Allow-User-Interface-Automation.mobileconfig).
- Useful `pseudo` related [Jamf Pro Extension Attribute scripts](https://github.com/Macjutsu/pseudo/tree/1.0.0-beta1/Pseudo-Sidekicks).

### Known Issues (5.x)

- The `pseudo` workflow has not been thoroughly tested on macOS 15.
- The `pseudo` workflow has not been thoroughly tested with Okta Platform SSO.

### Specific Changes (1.0.0-beta1)

- Initial public release.
- A special thanks goes out to others who directly assisted and/or inspired me to create `pseudo`; @PicoMitchell, @ScottEKendall, and @anewhouse.
- `pseudo` [1.0.0-beta1 SHA-256: 73f5b1d9f33008f89d79efcc984fd15bd7675697e711cdc44876d563f39bc526](https://github.com/Macjutsu/pseudo/blob/1.0.0-beta1/pseudo.checksum.txt)
