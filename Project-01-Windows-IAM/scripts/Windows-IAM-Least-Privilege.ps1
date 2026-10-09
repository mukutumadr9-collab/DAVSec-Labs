# DAVSec Labs - Project 01
# Windows IAM and NTFS permissions
# Windows 11 lab VM: DAVSEC-WKS01
# Run these commands in an elevated PowerShell session on the lab VM.
# This file records the lab steps. Review before running; do not rerun blindly.

# 1. Check the current account's groups.
whoami /groups

# 2. Create a standard local account and confirm it exists.
$Password = Read-Host "Enter a password for the lab account" -AsSecureString
New-LocalUser -Name "davsec_employee" -Password $Password -Description "DAVSec IAM least privilege lab account"
Get-LocalUser -Name "davsec_employee"

# 3. Check who belongs to the local Administrators group.
Get-LocalGroupMember -Group "Administrators"

# 4. Create the test folder and confirm it exists.
New-Item -Path "C:\DAVSec-Confidential" -ItemType Directory
Get-Item "C:\DAVSec-Confidential"

# 5. Review the folder's existing permissions.
Get-Acl "C:\DAVSec-Confidential" | Format-List Access
(Get-Acl "C:\DAVSec-Confidential").Access
icacls "C:\DAVSec-Confidential"

# 6. Save the original ACL before making changes.
icacls "C:\DAVSec-Confidential" /save "C:\DAVSec-ACL-Backup.txt"

# 7. Disable inheritance, keeping a copy of the inherited entries.
icacls "C:\DAVSec-Confidential" /inheritance:d

# 8. Remove broad group permissions from this lab folder.
icacls "C:\DAVSec-Confidential" /remove:g "BUILTIN\Users"
icacls "C:\DAVSec-Confidential" /remove:g "NT AUTHORITY\Authenticated Users"

# 9. Check the final permissions.
icacls "C:\DAVSec-Confidential"
