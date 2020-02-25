# Module 2 - Lab 1 - Exercise 1 - Configure your Microsoft 365 Tenant 

Adatum Corporation runs their legacy applications (such as Microsoft Exchange) in an on-premises deployment. However, they recently subscribed to Microsoft 365, thereby creating a hybrid deployment in which they must synchronize their on-premises and cloud deployments. 

As Adatum's enterprise administrator, you have been tasked with deploying Microsoft 365 in Adatum’s hybrid deployment using a virtualized lab environment. In this exercise, you will set up Adatum's Microsoft 365 trial tenant and your instructor will guide you on how to obtain your Office 365 credentials in your lab-hosted environment, which you will use throughout the remaining labs in this course. 

In your lab environment, the trial tenant has already been selected and a default tenant admin account has already been created. You will log into the Domain Controller VM using the ADATUM\Administrator account, and when you access Microsoft 365 for the first time, you will initially log in using the tenant email account that has been assigned to your Microsoft 365 tenant. You will then update Adatum's Microsoft 365 organizational profile, and you will prepare your tenant for Microsoft Azure Active Directory.


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

2. In your lab hosting provider's VM environment, you need to select **Ctrl+Alt+Delete** to log in (your instructor will guide you on how to find this option in your VM environment). Log into LON-DC1 as the **Administrator** (adatum\administrator) with the password **Pa55w.rd**. 

3. If you receive a **Networks** warning message asking if you want this PC to be discoverable by other PCs and devices on this network, select **Yes.**

4. **Server Manager** will automatically start. Leave it open (it’s used in the next task) but minimize the window for now.

5. On the taskbar at the bottom of the page, select the **Internet Explorer** icon. Maximize your browser window when it opens.

6. In your browser go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/** 

7. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider (admin@M365xZZZZZZ.onmicrosoft.com, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider) and then select **Next**.

8. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

9. On the **Stay signed in?** dialog box, select the **Don’t show this again** check box and then select **Yes.**

10. If a **Get your work done with Office 365** window appears, then close it now. 

11. In the **Microsoft Office Home** page, you are now signed in as the **MOD Administrator** account (note the **MA** initials in the circle that appears in the upper right-hand corner of the screen). The MOD Administrator is a pre-defined user created in Office 365 by your lab hosting provider. Since this user has been assigned an Office 365 administrator role (in this case, the Global Admin role), the Microsoft 365 admin center app is available on the home page along with all the other Office 365 apps. 

	Select the **Admin** app. This opens the **Microsoft 365 admin center**.

12. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **...Show All** to display all the navigation menu options.

13. In the left-hand navigation pane, select **Settings**, and then in the **Settings** group, select **Settings**. 

14. In the **Settings** window, the **Services** tab is displayed by default in the menu bar at the top of the screen. Since you want to update the organization profile, select the **Organization profile** tab, and then in the list of organization settings, select **Organization information**.

15. In the **Organization information** window, enter the following information:

	- Name: Replace Contoso with **Adatum Corporation** 
	
	**Note:** The Contoso organization name was explained in the Introduction section at the start of this lab. For the purposes of this lab, you will change it to Adatum Corporation.

	- Street address: **555 Main Street**

	- City: **Redmond**

	- State or province: **Washington**

	- ZIP or postal code: **98052**
	
	- Country or region: **United States**

	- Phone: **425-555-1234**

	- Technical contact: **admin@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Preferred language: **English**

16. Select **Save changes**.

17. On the **Organization information** window, select the **X** in the upper right-hand corner to close the window.

18. On the **Organization profile** tab of the **Settings** window, select **Release preferences**.

19. In the **Release preferences** window, select **Targeted release for select users** and then select **Save changes**.  <br/>

    ‎**Note:** One of the benefits of Office 365 is the ability to have the latest features and updates applied to your environment automatically, which can reduce maintenance costs and overhead for an organization. By setting up your Release preferences, you can control how and when your Office 365 tenant receives these updates.

    The **Targeted release for select users** option enables you to create a control group of users who will preview updates so that you can prepare the updates for your entire organization. The **Targeted release for everyone** option is more commonly used in development environments, where you can get updates early for your entire organization. In non-development environments, such as Adatum, targeted release to select people is the more typical preference as it enables an organization to control when it wants to make updates available to everyone once the updates have been reviewed by the control group.

20. Under the **Targeted release for select users** option, select **Select users**.  <br/>

21. In the **Choose users for targeted release** window, select the **Who should receive targeted releases?** field. This will display the list of existing Microsoft 365 user accounts that have been preloaded into your Microsoft 365 tenant by your lab hosting provider.

22. In the list of users, select the **MOD Administrator** account and then select **Save changes**.

23. On the **Release preferences** window, select the **X** in the upper right-hand corner to close the window.

24. On the **Organization profile** tab of the **Settings** window, select **Custom themes**.

25. In the **Custom themes** window, scroll though the page and review the various theme and branding options that are available for you to update. For the purpose of this lab, you can change any of the options or leave the default values as is. For example, you can add the logo of your company and set the background image as the default for all your users. Along with these options you can change the colors for your navigation pane, text color, icon color, and accent color. Go ahead and explore the different options for your tenant and make any changes that you wish. <br/>

    **Note:** Some color patterns aesthetically distract users. If you do change any of the colors, it is recommended that you avoid using high contrasting colors together, such as neon colors and high-resolution colors like bright pink and white.

26. If you made any changes in the **Custom themes** window, select **Save changes** when you are done. When you are finished with the **Custom themes**, select the **X** in the upper right-hand corner to close the window.

27. Remain logged into the domain controller VM and leave all the tabs open in your browser for the remaining tasks. 


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

8. Close this Download Center tab in Internet Explorer. 

9. If Windows PowerShell is still open from the previous task when you added the custom domain, select the **Windows PowerShell** icon on the taskbar; otherwise, you must open an elevated instance of **Windows PowerShell** just as you did in the prior task.

10. In **Windows PowerShell**, at the command prompt type the following command and then press Enter:<br/>

	‎**Install-Module MSOnline** 
	
11. If you are prompted to install the **NuGet provider**, enter **Y** to select **[Y] Yes**. 

12. If you are prompted to confirm whether you want to install the module from an untrusted repository (PSGallery),** enter **A** to select **[A] Yes to All.** 

13. Once the installation is complete, the screen will return to the Windows PowerShell command prompt. You must then run the following command to install the Azure AD PowerShell module that you just retrieved in the earlier step:<br/>

	**Install-Module AzureADPreview**   
	
14. If you are prompted to confirm whether you want to install the module from an untrusted repository (PSGallery),** enter **A** to select **[A] Yes to All.** 

15. Once the installation is complete, the screen will return to the Windows PowerShell command prompt. You have now installed the Windows Azure Active Directory PowerShell Module.

16. Remain logged into the domain controller VM and keep the Windows PowerShell window open for the next exercise.



# Proceed to Lab 1 - Exercise 2
