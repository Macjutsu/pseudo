# P.S.E.U.D.O.

### Platform SSO Enforcement (of) User Device Onboarding

P.S.E.U.D.O. optimizes the macOS Platform SSO registration experience.

by Kevin M. White

## Introduction

P.S.E.U.D.O. (or just `pseudo`) is an open source script that provides administrators with a solution to enforce Platform SSO registration and/or Touch ID enablement. Deployed using a single script and a required [PPPC configuration profile](https://support.apple.com/guide/deployment/privacy-preferences-policy-control-payload-dep38df53c2a/web), `pseudo` leverages [swiftDialog](https://github.com/swiftDialog/swiftDialog) and the macOS System Event, System Event UI, and Accessibility frameworks to ensure that uers are registering with Platform SSO and/or enabling Touch ID.

## Learn More

Detailed `pseudo` requirements and version progress can be found in the [Change Log](https://github.com/Macjutsu/pseudo/blob/main/CHANGELOG.md).

More P.S.E.U.D.O. documentation is coming soon...

## Screenshots

__Automatically opening and focusing the user to enable Touch ID.__

![Start to enable Touch ID via `pseudo`](https://github.com/Macjutsu/pseudo/blob/main/Pseudo-Screen-Captures/Touch-ID-Start.png)

__The user has enabled Touch ID__

![Touch ID enabled via `psuedo`](https://github.com/Macjutsu/pseudo/blob/main/Pseudo-Screen-Captures/Touch-ID-End.png)

__Automatically opening and focusing the user to register Platform SSO.__

![Start to register Platform SSO via `pseudo`](https://github.com/Macjutsu/pseudo/blob/main/Pseudo-Screen-Captures/PSSO-Start.png)

__The user has registered Platform SSO__

![Platform SSO registered via `psuedo`](https://github.com/Macjutsu/pseudo/blob/main/Pseudo-Screen-Captures/PSSO-End.png)
