# Windows IAM — Least Privilege and NTFS Permissions



## Project Overview



This project demonstrates the assessment and remediation of excessive NTFS permissions in a Windows environment.



The objective was to identify unnecessary access permissions, implement least-privilege controls, and validate that unauthorized users could no longer access a protected directory.



The exercise was completed in a Windows 11 virtual machine as part of DAVSec Labs.



## Business Scenario



An organization needs to restrict access to a directory containing confidential business information.



During an access-control review, inherited NTFS permissions were found to grant broader access than required.



The task was to review the existing permissions, remove unnecessary access, and verify that administrative access remained available.



## Lab Environment



- Windows 11 virtual machine

- Oracle VirtualBox

- Windows PowerShell

- NTFS file-system permissions

- ICACLS command-line utility



## Technical Implementation



### 1. User Account Configuration



Created a standard Windows account named `davsec_employee`.



Verified that the account was enabled and was not a member of the local Administrators group.



### 2. Protected Directory Creation



Created the directory:



`C:\DAVSec-Confidential`



This directory represented a location requiring restricted access.



### 3. Initial Permission Assessment



Reviewed the directory's access control list using PowerShell and ICACLS.



The assessment identified inherited permissions assigned to broad security groups, including:



- BUILTIN\Users

- NT AUTHORITY\Authenticated Users



These permissions were inconsistent with the intended restricted-access configuration.



### 4. Permission Remediation



Backed up the original ACL before making changes.



Disabled permission inheritance and removed unnecessary group permissions.



The resulting ACL retained Full Control permissions for:



- BUILTIN\Administrators

- NT AUTHORITY\SYSTEM



### 5. Access Validation



Tested directory access using the standard employee account.



The access attempt returned an **Access Denied** error.



A separate test from an elevated administrator session completed without an access-denied error.



These results confirmed that the intended access restrictions were functioning.



## Security Outcome



The lab demonstrated how reviewing and correcting NTFS permissions can reduce unnecessary access to protected resources.



The implementation reinforced the importance of access-control reviews, least-privilege enforcement, and validation after security configuration changes.



## Supporting Documentation



- [PowerShell Implementation](scripts/Windows-IAM-Least-Privilege.ps1)

- [Access Validation](documentation/Access-Validation.md)

- [Lab Screenshots](screenshots/)



## Skills Demonstrated



Identity and Access Management (IAM), Windows Security, NTFS Permissions, Access Control Lists (ACLs), PowerShell, Security Configuration Assessment, and Least Privilege.

