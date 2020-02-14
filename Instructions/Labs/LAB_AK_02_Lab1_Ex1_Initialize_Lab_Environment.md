# Module 2 - Lab 1 - Exercise 1 - Initialize your Lab Environment 

In the following lab exercise you will take on the role of Holly Spencer, Adatum Corporation’s Enterprise Administrator. Adatum runs their legacy applications (such as Microsoft Exchange) in an on-premises deployment. However, they recently subscribed to Microsoft 365, thereby creating a hybrid deployment in which they must synchronize their on-premises and cloud deployments. 

You have been tasked with deploying Microsoft 365 in Adatum’s hybrid deployment using a virtualized lab environment. In this lab, you will set up a Microsoft 365 trial tenant and add a custom on-premises accepted domain. 

In this lab, the trial tenant has already been selected and a default tenant admin account has already been created. In your role as Holly Spencer, Adatum’s Enterprise Administrator, you will be responsible for the remainder of the initial setup. You will log into the Domain Controller VM using the ADATUM\Administrator account, and when you access Microsoft 365 for the first time, you will initially log in using the tenant email account that has been assigned to your Microsoft 365 tenant. Once you create your Microsoft 365 account for Holly, you will log into Microsoft 365 as Holly from that point forward.


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

1. When the Virtual Machine opens, it opens with the Client PC VM (LON-CL1). You need to switch to the Domain Controller VM; therefore, in the **Virtual Machine** field at the top of the page, select the drop-down arrow an select the Domain Controller VM (LON-DC1).

2. At the top of the page is an **Actions** field. Select the drop-down arrow and select **Ctrl+Alt+Delete** to log on. Log on as **ADATUM\Administrator** with the password **Pa55w.rd**. 

3. If you receive a **Networks** warning message asking if you want this PC to be discoverable by other PCs and devices on this network, select **No.**

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

14. In the **Settings** window, the **Services** tab is displayed by default. Since you want to update the organization profile, select the **Organization profile** tab, and then in the list of organization settings, select **Organization information**.

15. In the **Organization information** window, enter the following information:

	- Name: **Adatum Corporation** 
	
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

26. If you made any changes, select **Save changes** when you are done. When you are finished with the **Custom themes**, select the **X** in the upper right-hand corner to close the window.

27. Remain logged into the domain controller VM and leave all the tabs open in your browser for the remaining tasks. 
 

### Task 3 - Add a Custom Domain

Not every company has just one domain; in fact, many companies have more than one domain. For this lab, Adatum has purchased a new domain (XXYYZZa.xxxCustomDomainxxx.xxx, which is provided by your lab hosting provider). In this task, you will gain experience adding this domain for Adatum Corporation. When you add a domain to Microsoft 365, it's called an accepted, or custom domain. Custom domains allow companies to have their own branding on emails and accounts so that customers can verify who is emailing them (for example, @contoso.com). 

In your hosted lab environment, Adatum already has an existing on-premises domain titled **adatum.com**. In this lab, you will create a second domain for Adatum that will be titled **XXYYZZa.xxxCustomDomainxxx.xxx**; you will replace **XXYYZZa** with the UPN name assigned to your tenant by your lab hosting provider, and you will replace **xxxCustomDomainxxx.xxx** with your lab hosting provider's custom domain name. Your instructor will provide you with your lab hosting provider's custom domain name and UPN name.

1. If you’re not logged into the LON-DC1 VM as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. You must now open **Windows PowerShell**. Select the magnifying glass (Search) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. 

3. In the menu that appears, right-click on **Windows PowerShell** (do not select Windows PowerShell ISE) and select **Run as administrator** in the drop-down menu. 

4. At the command prompt, you should run the following command to create a new zone in DNS (remember to replace XXYYZZa with the unique UPN name assigned to your tenant by your lab hosting provider, and replace xxxCustomDomainxxx.xxx with your lab hosting provider's custom domain name): <br/>

    ‎**dnscmd /zoneadd XXYYZZa.xxxCustomDomainxxx.xxx /DsPrimary**
    
5. Minimize your Windows PowerShell window (do NOT close it as you will use it later).

6. In your Internet Explorer browser that was left open from the prior task, in the left-hand navigation pane in the **Microsoft 365 admin center**, under **Settings**, select **Domains**. 

7. Note that in the list of domains, only the M365xZZZZZZ.onmicrosoft.com domain appears. The existing on-premises **adatum.com** domain does not appear in the list of Microsoft 365 domains. To add Adatum's new Microsoft 365 domain, select **+Add domain** to start the domain setup wizard. 

8. In the **Add a domain** page, in the **Domain name** field, enter your domain name in the form of **XXYYZZa.xxxCustomDomainxxx.xxx** (where XXYYZZa is the unique UPN name provided by your lab hosting provider, and xxxCustomDomainxxx.xxx is your lab hosting provider's domain name), and then select **Use this domain**. 

9. In the **Verify your domain** page, you must select a verification method to prove you own the domain. You can choose to verify using either a TXT record or a MX record. For this lab, you will use the **TXT record**, which is the option displayed by default. 

	To configure the domain later on in DNS Manager, you need to copy the **TXT value**. To do so, select the **Copy record** icon that appears under the **TXT value** (to the left of **MS=msXXXXXXXX**). In the dialog box that appears, select **Allow access** to copy this value from the webpage to your clipboard.  <br/>

    ‎**Important:** If you select **Verify** at this point, you will receive an error indicating the system could not find the record you added for this domain (you can do this if you want to see the error; there is no harm in it). Therefore, you must complete the next series of steps to add the TXT record to this domain in **DNS Manager**. Once you finish that process, you will be instructed to return back to this page and select the **Verify** button so that you can complete the process of adding this domain in the Microsoft 365 admin center. 

10. You must now switch over to Server Manager. Select the **Server Manager** icon that appears in your taskbar at the bottom of the page. Maximize the Server Manager window if necessary.

11. In **Server Manager Dashboard,** select **Tools** in the top right corner of the window. In the drop-down menu, select **DNS**. This will open **DNS Manager**.

12. In the **DNS Manager** window, in the **File Explorer** section in the left-hand column, expand **Forward Lookup Zones,** and then select the **XXYYZZa.xxxCustomDomainxxx.xxx** zone that you previously added in Windows PowerShell (where XXYYZZa is the unique UPN name provided by your lab hosting provider and xxxCustomDomainxxx.xxx is your lab hosting provider's domain name). 

13. Right-click on this **XXYYZZa.xxxCustomDomainxxx.xxx** zone, and in the menu that appears, select **Other New Records...** 

14. In the **Resource Record Type** window that appears, under **Select a resource record type**, scroll down and select **Text (TXT),** and then select the **Create Record...** button at the bottom of the window.

15. In the **New Resource Record** box, leave the **Record name** field blank. However, right-click in the **Text** field and select **Paste** from the menu. This will paste in the TXT valued of **MS=msXXXXXXXX** that you copied to the clipboard when you were in the Microsoft 365 admin center.

16. Select **OK** to create the record. 

17. In the **Resource Record Type** window, select **Done**. Leave your DNS Manager window open as you will return to it in a later step in this task.

18. You are now ready to return to the Microsoft 365 admin center and resume adding the domain record. If you’ll recall, when you were earlier adding the domain in the Microsoft 365 admin center, you indicated that you wanted to verify the domain using a TXT record. At that point you had to switch to DNS Manger and add the TXT record. Now that you’ve added the TXT record, you can go back to the Microsoft 365 admin center and proceed with the domain verification process.<br/>

	‎Select the **Internet Explorer** icon on the taskbar, and then in your browser select the **Microsoft 365 admin center** tab that displays the **Verify Domain** page. The **TXT name** should display your UPN name (XXYYZZa) and the **TXT value** should display your MS=msXXXXXXXX value.

19. Scroll to the bottom of the window and select **Verify.**   <br/>

	**Note:** If you selected **Verify** in the prior step when you copied the TXT value just to see the error that you would receive, the **Verify** button changed to **Try again**. In this case, select **Try again** rather than **Verify**. 

    ‎**Important:** If you had a typo or any other configuration mistakes, the domain will not be verified. If this occurs, the **Choose your online services** window in the next step will not appear. In this case, you should repeat this task and take your time when configuring the domain to make sure you don’t run into similar issues at this step in the process.

20. If your domain was successfully verified, the **Activate records** window will appear. Select **Continue**.

21. In the **Add DNS records** window, **Exchange and Exchange Online Protection** is the only service selected (this is sufficient for Adatum). Under this service, the description indicates that 3 records are needed for it to work properly: a Mail Exchanger (MX) record, an Alias (CNAME) record, and an additonal Text (TXT) record. You must now switch back and forth between this **Add DNS records** page and DNS Manager to add these additional records. For each record that you add, you will copy information from this **Add DNS records** page and then paste it into each record that you create in DNS Manager.  <br/>

	On the **Add DNS records** page, select the arrow (**>**) in the **MX Records** section to expand it, and then select the arrow (**>**) in the **Expected** section to display both the value it expects you to add in DNS Manager and the actual value that you added. In this case, the **Actual** value is blank, since you have yet to add the MX record in DNS Manager. 
	
	Repeat this step for the **CNAME records** section and the **TXT records** section. All three record types should now be expanded.
	
22. You will begin by adding the **MX record** required by the Exchange and Exchange Online Protection service. 

	a. In the **MX record** section, under the **Points to address or value** column, select the copy icon that appears to the left of the expected value (for example, XXYYZZa-xxxCustomDomainxxx-xxx.mail.protection.outlook.com) to copy this value to the clipboard.
	
	b. You must now switch to DNS Manager. On the taskbar at the bottom of the page, select the **DNS Manager** icon.

	c. In **DNS Manager**, under **Forward Lookup Zones**, the **XXYYZZa.xxxCustomDomainxxx.xxx** domain should be selected from when you earlier left off. If not, select this zone now. You should see the **TXT** record that you earlier created. You must now create a **Mail Exchanger (MX)** record for this domain. Under **Forward Lookup Zones**, right-click the **XXYYZZa.xxxCustomDomainxxx.xxx** domain and select **New Mail Exchanger (MX)...**

	d. In the **New Resource Record** window, leave the **Host or child domain** field blank, but right-click in the **Fully qualified domain name (FQDN) of mail server** field and select **Paste** from the menu that appears. This will paste in the expected **Points to address or value** that you copied to the clipboard in step a above.
	
	e. Select **OK**.
	
	f. At this point, you can either select **Continue** at the bottom of the **Add DNS records** page to verify the MX record, or you can wait until you have added all three records and then select **Continue** to verify all three records at once. 
	
	If you select **Continue** now, it will display either a checkmark or an exclamation point next to **MX Record**. The checkmark in a green circle indicates that it successfully validated the MX record for this domain in DNS Manager, and the exclamation point in a red circle indicates that there was a problem with the MX record and it did not validate successfully. If the MX record did not validate successfully, then review the record to ensure you entered the proper information, make any necessary corrections, and then select **Continue** again. 

23. You will now add the **CNAME record** required by Exchange and Exchange Online Protection service. 

	a. Switch back to the **Add DNS records** page in the Microsoft 365 admin center. On the taskbar at the bottom of the page, select the **Internet Explorer** icon and select the **Microsoft 365 admin center** tab.

	b. This will return you to the **Add DNS records** page. In the **CNAME Records** section, under the **Points to address or value** column, select the copy icon that appears to the left of the expected value (for example, autodiscover.outlook.com). <br/>
		
	**Important:** You will NOT copy the expected **Host Name** value. The value listed here as the expected host name is **autodiscover.XXYYZZa** (where XXYYZZa is your UPN name). However, if you paste this value in the **Alias name** field in the CNAME record, the CNAME record validation on this page will fail. When you create the CNAME record in DNS Manager in the following steps, you will instead enter **autodiscover** as the Alias name and NOT **autodiscover.XXYYZZa**. 
	
	Therefore, the only value you need to copy for the CNAME record is the expected value for the **Points to address or value** column.

	c. On the taskbar at the bottom of the page, select the **DNS Manager** icon.

	d. In **DNS Manager**, under **Forward Lookup Zones**, right-click the **XXYYZZa.xxxCustomDomainxxx.xxx** domain and select **New Alias (CNAME)...**

	e. In the **New Resource Record** window, enter **autodiscover** in the **Alias name (uses parent domain if left blank)** field. 
	
	f. Right-click in the **Fully qualified domain name (FQDN) for target host** field and select **Paste** from the menu that appears. This will paste in the expected **Points to address or value** that you copied to the clipboard in step b above.
	
	g. Select **OK**.
	
	h. At this point, you can either select **Continue** at the bottom of the **Add DNS records** page to verify the CNAME record, or you can wait until you have added all three records and then select **Continue** to verify all three records at once. <br/>
	
	If you select **Continue** now, it will display either a checkmark or an exclamation point next to **CNAME Record**. The checkmark in a green circle indicates that it successfully validated the CNAME record for this domain in DNS Manager, and the exclamation point in a red circle indicates that there was a problem with the CNAME record and it did not validate successfully. If the CNAME record did not validate successfully, then review the record to ensure you entered the proper information, make any necessary corrections, and then select **Continue** again. 
	
24. You will finish by adding the **TXT record** required by Exchange and Exchange Online Protection service. 

	a. Switch back to the **Add DNS records** page in the Microsoft 365 admin center. On the taskbar at the bottom of the page, select the **Internet Explorer** icon and select the **Microsoft 365 admin center** tab.

	b. This will return you to the **Add DNS records** page. In the **TXT Records** section, under the **TXT value** column, select the copy icon that appears to the left of the expected value (for example, v=spf1 include:spf.protection.outlook.com -all) to copy this value to the clipboard.

	c. On the taskbar at the bottom of the page, select the **DNS Manager** icon.

	d. In **DNS Manager**, under **Forward Lookup Zones**, right-click the **XXYYZZa.xxxCustomDomainxxx.xxx** domain and select **Other New Records...**
	
	e. In the **Resource Record Type** window that appears, under **Select a resource record type**, scroll down and select **Text (TXT),** and then select the **Create Record...** button at the bottom of the window.

	f. In the **New Resource Record** window, right-click in the **Text** field and select **Paste** from the menu that appears. This will paste in the expected **TXT value** that you copied to the clipboard in step b above.
	
	g. Select **OK**.
	
	h. On the **Resource Record Type** window, select **Done**. 

25. In **DNS Manager**, you should now see the TXT record that you originally created to verify the domain, along with the MX, CNAME, and TXT records that you created for the Exchange service to work within this domain. Minimize the DNS Manager window. 

26. In the **Add DNS records** window, select **Continue** to complete the new domain setup. If you selected **Continue** after adding the MX and CNAME records, and if each validated successfully, then only the TXT record will be validated at this point. However, if you did not select **Continue** after adding the MX and CNAME records, then all three records will be validated at this point. <br/>
	
	If all three records have been successfully validated, then the **Domain setup is complete** page will appear. If this occurs, then select the **Done** button to complete the domain setup process.
	
	However, if any of the three records did not validate successfully, then the **Add DNS records** window will return, and it will display either a checkmark or an exclamation point next to each record type to indicate which ones validated successfully and which ones did not. An exclamation point in a red circle indicates that there was a problem with the record and it did not validate successfully (note that the Actual value for the record is left blank). If this occurs, you must correct the data on the corresponding record in DNS Manager and then select **Continue** again. You must repeat this process until all three records have successfully validated and the **Domain setup is complete** page appears.

27. Remain logged into the LON-DC1 VM with both **Internet Explorer** and **Windows PowerShell** left open for the next task. 


### Task 4 – Prepare for Microsoft Azure Active Directory 

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

7. On the **Completed the Microsoft Online Services Sign-in Assistant Setup Wizard** page, select **Finish**. 

8. Close this Download Center tab in Internet Explorer. 

9. If Windows PowerShell is still open from the previous task when you added the custom domain, select the **Windows PowerShell** icon on the taskbar; otherwise, you must open an elevated instance of **Windows PowerShell** just as you did in the prior task.

10. In **Windows PowerShell**, type the following command and then press Enter:<br/>

	‎**Install-Module MSOnline** 
	
11. If you are prompted to install the **NuGet provider**, enter **Y** to select **[Y] Yes**. 

12. If you are prompted to confirm whether you want to install the module from an untrusted repository (PSGallery),** enter **A** to select **[A] Yes to All.** 

13. Once the installation is complete, the screen will return to the Windows PowerShell command prompt. You must then run the following command to install the Azure AD PowerShell module that you just retrieved in the earlier step:<br/>

	**Install-Module AzureADPreview**   
	
14. If you are prompted to confirm whether you want to install the module from an untrusted repository (PSGallery),** enter **A** to select **[A] Yes to All.** 

15. Once the installation is complete, the screen will return to the Windows PowerShell command prompt. You have now installed the Windows Azure Active Directory PowerShell Module.

16. Remain logged into the domain controller VM and keep the Windows PowerShell window open for the next lab.



# End of Lab 1
