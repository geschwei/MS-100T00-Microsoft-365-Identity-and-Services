# Module 3 - Lab 1 - Exercise 1 - Lab Introduction 

This exercise introduces you to the lab environment for this course; it does not include any lab instruction. 

Please read through this instruction carefully before proceeding to the next exercise. This introduction identifies the key components of the lab environment used in this course. You will need to understand this information to successfully complete the labs.

### MS-100T00 and MS-101T00 Virtual Lab Environments

The Enterprise Administrator Learning Path consists of two courses – MS-100T00 (Microsoft 365 Identity and Services) and MS-101T00 (Microsoft 365 Mobility and Security). The labs in each course require you to perform the lab steps in a virtual lab environment. 

The labs for each course are independent of one another; in other words, the labs for MS-101 do NOT continue from where the MS-100 labs left off. Each course offers its own unique lab scenario using completely different VM environments:

- **MS-100T00 - Microsoft 365 Identity and Services:** The labs in this course have been configured for a hybrid deployment at Adatum Corporation. Adatum is running both an on-premises deployment and using Microsoft 365 in the cloud. Therefore, the virtual machines for this course consist of a Domain Controller, a Client PC, and an on-premises Exchange Server VM, all networked together in the Adatum domain. 

- **MS-101T00 - Microsoft 365 Mobility and Security:** In the lab scenario for is course, Adatum Corporation does not have an on-premises deployment and is instead managing their Microsoft 365 deployment strictly through Microsoft Azure. Since this is a cloud-only deployment, the VM environment for this course simply consists of two Client PCs. 

The lab environments have been specifically designed in this manner to give you experience managing a Microsoft 365 deployment in both a hybrid environment and in a pure cloud environment. You may see some of the same user names across the labs (for example, Holly Dickson, Adatum’s Global Administrator), but that will be the only similarity that you’ll see between the labs for each course.

### MS-100 Lab Environment

The labs in this course will use three virtual machines:

- Domain Controller VM (LON-DC1), Adatum’s on-premises domain controller

- Exchange Server VM (LON-EX1), Adatum’s on-premises Exchange Server

- Client 1 VM (LON-CL1), a client PC attached to the Adatum network

The three machines are networked together in the **adatum.com** domain. 

**Important:** A system administrator account has been created by default in the on-premises adatum.com domain. The login for this account is **adatum\admin** and the password is **Pa55w.rd** (**Note**: the password for ALL user accounts in the MS-100 labs is **Pa55w.rd**. The only exception is the password that will be provided by your lab hosting provider for your Tenant Email account. Your instructor will show you how to retrieve your tenant email account and password.

‎Your Office 365 tenant came with a default global administrator account already created in Microsoft 365. The name of this user account is **MOD Administrator**. The username for this MOD Administrator account is **admin@M365xZZZZZZ.onmicrosoft.com**, which is the username assigned to your tenant (where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider). When you sign into Office 365 with this **admin@M365xZZZZZZ.onmicrosoft.com** username, your user initials of **MA** (for **M**OD **A**dministrator) will display in a circle as the user icon in the upper right corner of the Office 365 screens. 

When you initially log into Office 365, you will log in with this **MOD Administrator** account of **admin@M365xZZZZZZ.onmicrosoft.com** (with the password of **Pa55w.rd**). In Exercise 1 in this lab, you will then create a Microsoft 365 user account for Holly Dickson, who is Adatum’s Enterprise Administrator. You will assign Holly the Microsoft 365 Global Admin role, and you will use the Holly Dickson persona to perform the majority of administrative tasks throughout the labs in this course.   

**IMPORTANT:** If your lab environment provides some form of an “End Lab” option, you should never select it; **doing so will end your lab instance for the current trial tenant that you were assigned, and you will lose all the data that you’ve entered up to that point.** The only time you would need to select this button is if your trial tenant somehow became corrupted and you needed to start your labs for this course over from scratch.
 
### WARNING – Be prepared for UI changes 

Given the dynamic nature of Microsoft cloud tools, you may experience user interface (UI) changes that were made following the development of this training content. This will manifest itself in UI changes that do not match up with the detailed instructions presented in this lab manual. 

The Microsoft World-Wide Learning team will update this training course as soon as any such changes are brought to our attention. However, given the dynamic nature of cloud updates, you may run into UI changes before this training content is updated. **If this occurs, you will have to adapt to the changes and work through them in the lab exercises as needed.**   

### Introduction

This lab references three domains:

- **adatum.com** – This is the default on-premises domain that was provided by the lab hosting environment.   

- **M365xZZZZZZ.onmicrosoft.com** – This is the domain associated with the Office 365 tenant that was provided by the lab hosting environment. The first part of this domain name (M365xZZZZZZ) is the unique tenant ID provided by the lab hosting provider. The ZZZZZZ portion of the tenant ID, which is the tenant suffix ID, will be unique for each student. <br/>

    **IMPORTANT:** This is critical because throughout this lab, you will be asked to enter the **M365xZZZZZZ.onmicrosoft.com** domain name when signing into apps with a given username (for example, holly@M365xZZZZZZ.onmicrosoft.com). When doing so, you must enter the unique tenant suffix ID that is assigned to your tenant ID in place of the ZZZZZZ.

    For example, if your Tenant Email is **admin@M365x609668.onmicrosoft.com**, the unique tenant suffix ID (ZZZZZZ) is **609668**. When logging in as Holly when entering this domain, you would replace ZZZZZZ with 609668 (for example, holly@M365a609668.onmicrosoft.com). When you come to an instruction that requires your domain suffix for the **onmicrosoft.com** domain, remember to replace the ZZZZZZ in the instruction with the tenant suffix ID provided by your lab hosting provider.   

- **XXYYZZa.xtremelabs.us** – This is a custom accepted domain that you will create in the lab. Companies typically do not use the **onmicrosoft.com** domain to run their work services; rather, they prefer to have their name header display their company name in their production environment. Also, when setting up a hybrid environment, as you will in this course, both the on-premises environment and the cloud tenant must share responsibility over at least one domain. For this lab, you will be creating this custom **xtremelabs.us** domain that will be shared between the on-premises and cloud environments.<br/>

    The first part of the domain name, XXYYZZa, is the portion of the Office 365 blob that will also be unique for each student. When performing the lab steps that require you to enter this **xtremelabs.us** domain, you must replace **XXYYZZa** with the Office 365 blob that was assigned to your tenant by your lab hosting provider.<br/>
        
**RECOMMENDATION:** It is highly recommended that you write down the values of the ZZZZZZ tenant ID, the XXYYZZ UPN Name, and the IP address, all of which are provided by your lab hosting provider. This will save you from having to constantly retrieve this information from your VM lab environment. 

**IMPORTANT:** In this lab, you will be in the role of Holly Dickson, the Enterprise Administrator for Adatum Corporation. In the fictitious organizational structure that has been created for this lab, Contoso Ltd. is the parent company of two subsidiaries, Adatum and xtremelab.us. As such, the Office 365 tenant has been set up to reflect the Contoso name, which appears wherever the company name from the tenant is displayed in the Office 365 environment. The tenant letterhead can easily be changed by editing the Organizational Profile, which you will do in the first lab exercise by changing the tenant name from Contoso to Adatum.

### Use the new Microsoft 365 admin center

Throughout the lab exercises for this course, if you navigate to the Microsoft 365 admin center and are prompted with a windows asking if you want to try the new Microsoft 365 admin center, always select the **Try it now** button.

**IMPORTANT:** The instructions that are provided in the lab exercises for this course are based on the new Microsoft 365 admin center UI and not the classic UI.


# Proceed to Exercise 2

