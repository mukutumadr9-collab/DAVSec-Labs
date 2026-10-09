# Access Validation - Project 01

**System:** Windows 11 VM (`DAVSEC-WKS01`)  
**Test folder:** `C:\DAVSec-Confidential`  
**Test account:** `davsec_employee`

## Purpose

Check that the standard account cannot read the restricted folder and that an administrator still can.

## 1. Test with the standard account

From an administrator PowerShell window, open a separate session:

```powershell
runas /user:DAVSEC-WKS01\davsec_employee powershell.exe
```

In the **new** PowerShell window, run:

```powershell
whoami
Get-ChildItem "C:\DAVSec-Confidential" -ErrorAction Stop
```

**Observed in the lab:** `whoami` identified `davsec_employee`. The folder command returned **Access is denied**.

## 2. Test with the administrator

In the original **elevated administrator** PowerShell window, run:

```powershell
Get-ChildItem "C:\DAVSec-Confidential" -ErrorAction Stop
```

**Observed in the lab:** The command completed without an access error. The folder was empty, so no files were listed.

## 3. Confirm the folder ACL

```powershell
icacls "C:\DAVSec-Confidential"
```

**Observed in the lab:** Only `BUILTIN\Administrators` and `NT AUTHORITY\SYSTEM` had Full Control. The broad `Users` and `Authenticated Users` entries were no longer present.

## Result

The test showed that the folder permissions blocked the standard account while preserving administrator access. This was a controlled lab test, not a production security assessment.

**Note:** The saved command history contained `DAVSEC-WK01` in the `runas` command. The hostname above is corrected to match the VM name `DAVSEC-WKS01` shown in the lab screenshots.
