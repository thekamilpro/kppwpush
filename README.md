# The KpPwpush Module

Module is a wrapper for [pwpush.com](https://pwpush.com) API

## How to install

Module is available at [PowerShell Gallery](https://www.powershellgallery.com/packages/KpPwpush/) and you can install it with:

```ps1
Install-Module -Name kppwpush
```

## Example use

At first, you need to initialise the module by calling ```Connect-KpPwpush```, if not providing any parameters, it connects to pwpush.com server.

Create new password push with password 1234 which expires after 3 days (and default 5 views):

```ps1
New-KpPwpush -Payload 1234 -ExpireAfterDays 3
```