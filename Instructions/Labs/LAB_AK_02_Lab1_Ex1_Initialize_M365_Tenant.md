# Module 2 - Lab 1 - Exercise 1 - Initialize your Microsoft 365 Tenant 

Adatum Corporation runs their legacy applications (such as Microsoft Exchange) in an on-premises deployment. However, they recently subscribed to Microsoft 365, thereby creating a hybrid deployment in which they must synchronize their on-premises and cloud deployments. 

As Adatum's enterprise administrator, you have been tasked with deploying Microsoft 365 in Adatum’s hybrid deployment using a virtualized lab environment. In this exercise, you will set up Adatum's Microsoft 365 trial tenant, and your instructor will guide you on how to obtain your Office 365 credentials in your lab-hosted environment. You will use these credentials throughout the remaining labs in this course. 

In your lab environment, the trial tenant has already been selected and a default tenant admin account has already been created. You will log into the Domain Controller VM using the ADATUM\Administrator account, and when you access Microsoft 365 for the first time, you will initially log in using the tenant email account that has been assigned to your Microsoft 365 tenant. You will then update Adatum's Microsoft 365 organizational profile, and you will prepare your tenant for Microsoft Azure Active Directory and for a future lab using Microsoft Teams.


### Task 1 - Obtain Your Office 365 Credentials

Once you launch the lab, a free trial tenant will be automatically created for you to access Azure in the Microsoft Virtual Lab environment. This tenant will be automatically assigned a unique username and password. You must retrieve this username and password so that you can sign into Azure within the Microsoft Virtual Lab environment. You will also be assigned a unique network IP address and UPN name for your O365 blob. You will also use this UPN name in various tasks throughout the labs for this course.

1. Because this course can be offered by learning partners using any one of several authorized lab hosting providers, the actual steps involved to retrieve the UPN name, network IP address, and tenant ID associated with your tenant may vary by lab hosting provider. Therefore, your instructor will provide you with the necessary instructions on how to retrieve this information for your course. <br/>

	You should write down the following information (provided by your instructor) for later use:

	- **Tenant suffix ID.** This ID is for the onmicrosoft.com accounts that you will use to sign into Microsoft 365 throughout the labs. This is in the format of **{username}@M365xZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider. Record this ZZZZZZ value for later use. When any of the lab steps direct you to sign into the Office 365 or Microsoft 365 portals, you must enter the ZZZZZZ value that you obtained here.
	- **Tenant password.** This is the password for the admin account provided by your lab hosting provider.
	- **Domain name components.** The new accepted domain that you will create in Task 3 will be in the format XXYYZZa.xxxCustomDomainxxx.xxx. You must replace XXYYZZa with the UPN name provided by your lab hosting provider, and you must replace xxxCustomDomainxxx.xxx with the lab hosting provider's domain name. For example, let's assume your lab hosting provider is Fabrikam Inc. If the UPN number it assigns to your tenant is AMPVU3a and its custom domain name is fabrikam.us, then the domain name for your new accepted domain would be AMPVU3a.fabrikam.us. Your instructor will provide you with your lab hosting provider's custom domain name.  
	- **Network IP address.** Write down the **IP Address** value (this is the IP Address of your parent domain; for example, 64.64.206.13).

### Task 2- Set up the Organization Profile

In your role as Holly Spencer, Adatum’s Enterprise Administrator, you have been tasked with setting up the company’s profile for its Microsoft 365 trial tenant. In this task, you will configure the required options for Adatum’s tenant. Since Holly has yet to create a personal Microsoft 365 user account (you will do this in Task 3), Holly will initially sign into Microsoft 365 as the default Microsoft 365 MOD Administrator account using the Tenant email address and password that was assigned by your lab hosting provider.

1. When you open your lab hosting provider's Virtual Machine environment, you need to begin with the Domain Controller VM (LON-DC1). If your VM environment opens with one of the other machines (LON-CL1 or LON-EX1), then switch to the LON-DC1 VM now.

2. In your lab hosting provider's VM environment, you need to select **Ctrl+Alt+Delete** to log in (your instructor will guide you on how to find this option in your VM environment). Log into LON-DC1 as the **Administrator** with the password **Pa55w.rd**. 

3. If you receive a **Networks** warning message asking if you want this PC to be discoverable by other PCs and devices on this network, select **Yes.**

4. **Server Manager** will automatically start. Leave it open (it’s used in the next task) but minimize the window for now.

5. On the taskbar at the bottom of the page, select the **Internet Explorer** icon. Maximize your browser window when it opens.

6. In your browser go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/** 

7. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider (admin@M365xZZZZZZ.onmicrosoft.com, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider) and then select **Next**.

8. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

9. On the **Stay signed in?** dialog box, select the **Don’t show this again** check box and then select **Yes.** 

	**Note:** In the top right corner of the screen, notice the initials **MA** that appear in a circle. This is the initials for the MOD Administrator account. If a user has a picture associated with his or her account, that picture will be displayed when the user logs in. Since the MOD Administrator has no picture assigned, the user name initials are displayed instead. <br/>

10. If a **Get your work done with Office 365** window appears, then close it now. In the list of Office 365 apps will be on the **App Tray** to the left side of the screen on the home page, select the **App laucher** in the top right corner select **Admin**; this opens the **Microsoft 365 admin center.** 

11. In the left-hand navigation pane, select **Settings** and then under it, select **Settings**. 
12. In the **Settings** page, select the **Org settings** tab.
13. In the **Org settings** tab on the **Organization Profile** page, select **Organization information** from the list organization Profile.
14. In the **Organization information** pane that appears, enter the following information:

    - Name: **Adatum Corporation** (Note: Contoso is originally displayed as the organization name; this was explained in the Introduction section at the start of this lab. In this step you will change it to Adatum Corporation.)

    - Address: **555 Main Street**

    - City: **Redmond**

    - State: **Washington**

    - Postal Code: **98052**

    - Phone:   **425-555-1234**

    - Technical contact: do not change

    - Preferred language: **English**

15. Select **Save changes**.
16. Scroll to the top of the **Organization information** pane. Note the message indicating the changes have been saved. Select the **X** in the upper right hand corner to close the pane.
17. In the list of organization Profie, select **Release preferences**.
18. In the **Release preferences** pane that appears, select the **Targeted release for selected users** option and then select **Save changes**.<br/>

    **Note:** One of the benefits of Microsoft 365 is the ability to have the latest features and updates applied to your environment automatically, which can reduce maintenance costs and overhead for an organization and allow early-adopter users to test new features. By setting up your Release preferences, you can control how and when your Office 365 tenant receives these updates. <br/>

    **Note:** This **Targeted release for selected users** option enables you to create a control group of users who will preview updates so that you can prepare the updates for your entire organization. The **Targeted release for everyone** option is more commonly used in development environments, where you can get updates early for your entire organization. In non-development environments, such as Adatum, targeted release to select people is the more typical preference as it enables an organization to control when it wants to make updates available to everyone once they've been reviewed by the control group.

19. In the **Release preferences** pane, scroll down and select **Select users**.
20. In the **Choose users for targeted release** pane that appears, select inside the **Who should receive targeted releases?** field. This displays the list of active users. In this list, select each of the following users (after selecting the user, you will have to select inside the field again to re-display the list): 

	- **Alex Wilber**
	- **Joni Sherman**
	- **Lynne Robbins**
	- **MOD Administrator** <br/>

    **Note:** Alex, Joni, and Lynne are administrators who are part of Holly's pilot team. Their accounts will be used throughout the labs for this course.
21. Select **Save changes**.
22. Close the **Release preferences** pane. 
23. Tn the list of organization profile, select **Custom themes**.
24. In the **Custom themes** pane, scroll to the bottom of the pane and select the **Show the user's display name** check box. <br/>

	As you scroll through the pane, review the various theme and branding options that are available for you to update. For the purpose of this lab, you can change any of the options or leave the default values as is. For example, you can add the logo of your company and set the background image as the default for all your users. Along with these options you can change the colors for your navigation pane, text color, icon color, and accent color. Go ahead and explore the different options for your tenant and make any changes that you wish. <br/>

	**Note:** Some color patterns aesthetically distract users. If you do change any of the colors, it is recommended that you avoid using high contrasting colors together, such as neon colors and high-resolution colors like bright pink and white.

25. Select **Save changes** when you are done and then close the **Custom themes** pane.
26. Remain logged into the Client 1 VM with Microsoft Edge open to the **Microsoft 365 admin center** for the next task.


### Task 3 – Prepare for Microsoft Azure Active Directory 

Azure Active Directory is needed to perform several configuration steps when installing Microsoft 365. To access Azure Active Directory, you must first prepare for it by performing the following tasks: installing the Microsoft Online Services Sign-In Assistant and installing the Windows Azure Active Directory PowerShell Module.

- The Microsoft Online Services Sign-In Assistant (MOS SIA) provides end-user sign-in capabilities to Microsoft Online Services, such as Office 365. The MOS SIA installs client components that allow applications, such as Microsoft Outlook and the Windows Azure Active Directory PowerShell Module, to authenticate to Microsoft Online Services. The MOS SIA can also provide an improved sign-in experience, where end-users can access Microsoft Online Services without having to re-enter their credentials. 

- To prepare for Azure Active Directory, you must first download and install the Microsoft Online Services Sign-In Assistant, and then you must install the Windows Azure Active Directory PowerShell Module.  

1. On the LON-DC1 VM, you must navigate to the **Microsoft Download Center** to download the **Microsoft Online Services Sign-In Assistant for IT Professionals RTW** wizard. <br/>

	To do so, open a new tab in Internet Explorer and then enter the following URL in the address bar: **https://aka.ms/AA6zxrs** 

2. On this **Download Center** page, scroll down to the **Microsoft Online Services Sign-In Assistant for IT Professionals RTW** section, leave **English** as the selected language and then select the **Download** button. 
   
3. In the **Choose the download you want** window, select the **msoidcli_64bit.msi** check box and then select **Next**. 

4. If a notification bar appears at the bottom of the page indicating that Internet Explorer blocked a pop-up from www.microsoft.com, select **Allow once**.

5. In the notification bar that appears at the bottom of the page asking whether you want to run or save msoidcli_64bit.msi from the Download Center, select **Run**. 

6. In the **Microsoft Online Services Sign-in Assistant Setup** wizard, select **I accept the terms in the License Agreement and Privacy Statement** and then select **Install**. 

7. Once the installation is complete, on the **Completed the Microsoft Online Services Sign-in Assistant Setup Wizard** page, select **Finish**. 

8. Close this **Download Center** tab in Internet Explorer. 

9. You must now open **Windows PowerShell**. Select the magnifying glass (Search) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. In the list of search results, right-click on **Windows PowerShell** (do not select Windows PowerShell ISE) and select **Run as administrator** in the drop-down menu. 

10. Maximize your PowerShell window. In **Windows PowerShell**, at the command prompt type the following command and then press Enter:<br/>

	‎	**Install-Module MSOnline** 
	
11. If you are prompted to install the **NuGet provider**, enter **Y** to select **[Y] Yes**. 

12. If you are prompted to confirm whether you want to install the module from an untrusted repository (PSGallery),** enter **A** to select **[A] Yes to All.** 

13. Once the installation is complete, the screen will return to the Windows PowerShell command prompt. You must then run the following command to install the Azure AD PowerShell module that you just retrieved in the earlier step:<br/>

	**Install-Module AzureADPreview**   
	
14. If you are prompted to confirm whether you want to install the module from an untrusted repository (PSGallery),** enter **A** to select **[A] Yes to All.** 

15. Once the installation is complete, the screen will return to the Windows PowerShell command prompt. You have now installed the Windows Azure Active Directory PowerShell Module.

16. Remain logged into the domain controller VM and keep the Windows PowerShell window open for the next exercise.


### Task 4 – Prepare for External Access using Microsoft Teams 

When you get to Module 4, you will perform a lab in which you will create a new service request ticketing system. One of the tasks within that lab requires you to collaborate with one of your fellow student's Microsoft 365 tenant through Teams. To enable this communication between your tenant and your fellow student's tenant, you must turn on the **External Access** functionality within Teams. When you turn on this External Access feature, it can take over 30 minutes for your system to propagate the changes through your tenant. Therefore, you will turn on this External Access feature in this task so that the internal changes made by the system have time to propagate through your tenant by the time you eventually get to the Module 4 lab.

**Instructor/Student Note:** To facilitate this lab, your instructor should collect each student's tenant suffix ID (ZZZZZZ) from each of their domains (this would be each student's M365xZZZZZZ.onmicrosoft.com domain, where ZZZZZZ is each student's unique tenant suffix ID provided by your lab hosting provider). The instructor will then assign to each student the tenant suffix ID (ZZZZZZ) from another student (you can NOT be assigned your own tenant suffix ID). When you enable External Access in this task, you will enter the domain associated with the assigned tenant suffix ID from your fellow student (in other words, you will enter the **M365xZZZZZZ.onmicrosoft.com** domain, where ZZZZZZ is your fellow student's tenant suffix ID).

By the time you get to the Mod 4 labs, External Access should be ready so that you can collaborate with the student whose domain you set up in this task. Conversely, you should also be able to collaborate with the student who entered your domain in his or her External Access setup.

1. On your domain controller VM (LON-DC1), minimize your Windows PowerShell window and return to Internet Explorer. You should still be logged into the Microsoft 365 admin center as the MOD Administrator from the earlier task in which you updated Adatum's organizational profile. <br/>

	If you closed the Microsoft 365 admin center, then perform the same steps as before to open it and sign in as **admin@M365xZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider.
2. If necessary, in the **Microsoft 365 admin center**, in the left-hand navigation pane, select **...Show All** to display all the navigation menu options.
3. In the left-hand navigation pane, in the **Admin Centers** group, select **Teams**.
4. In the **Teams admin center**, in the left-hand navigation pane, scroll down and select **Org-wide settings**.
5. In the **Org-wide settings** group, select **External access**.
6. On the **External access** page, confirm that both toggle switches are in the **On** position. If either are not set to **On** then set them to **On** now.
7. Select **+ Add a domain**.
8. In the **Add a domain** window, enter **M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your fellow student's tenant suffix ID that was assigned to you by your instructor) in the **Domain** field. Do NOT enter your own tenant suffix ID. 
9. In the **Action to take on this domain** field, select **Allowed**.
10. Select **Done** and then select **Save**.
11. In your Internet Explorer browser, close the **External access** tab. This should return you to the **Microsoft 365 admin center** tab, which you should leave open as you proceed to the next exercise.


# Proceed to Lab 1 - Exercise 2
