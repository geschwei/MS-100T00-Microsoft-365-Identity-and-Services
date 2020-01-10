# Module 1 - Lab 1 - Exercise 1 - Initialize your Lab Environment 

In the following lab exercise you will take on the role of Holly Spencer, Adatum Corporation’s Enterprise Administrator. Adatum runs their legacy applications (such as Microsoft Exchange) in an on-premises deployment. However, they recently subscribed to Microsoft 365, thereby creating a hybrid deployment in which they must synchronize their on-premises and cloud deployments. 

You have been tasked with deploying Microsoft 365 in Adatum’s hybrid deployment using a virtualized lab environment. In this lab, you will set up a Microsoft 365 trial tenant and add a custom on-premises accepted domain. 

In this lab, the trial tenant has already been selected and a default tenant admin account has already been created. In your role as Holly Spencer, Adatum’s Enterprise Administrator, you will be responsible for the remainder of the initial setup. You will log into the Domain Controller VM using the ADATUM\Administrator account, and when you access Microsoft 365 for the first time, you will initially log in using the tenant email account that has been assigned to your Microsoft 365 tenant. Once you create your Microsoft 365 account for Holly, you will log into Microsoft 365 as Holly from that point forward.


### Task 1 - Obtain Your Office 365 Credentials

Once you launch the lab, a free trial tenant will be automatically created for you to access Azure in the Microsoft Virtual Lab environment. This tenant will be automatically assigned a unique username and password. You must retrieve this username and password so that you can sign into Azure within the Microsoft Virtual Lab environment. You will also be assigned a unique network IP address and UPN name for your O365 blob. You will also use this UPN name in various tasks throughout the labs for this course.

1. Because this course can be offered by learning partners using any one of several authorized lab hosting providers, the actual steps involved to retrieve the UPN name, network IP address, and tenant ID associated with your tenant may vary by lab hosting provider. Therefore, your instructor will provide you with the necessary instructions on how to retrieve this information for your course. The information that you should write down for later use includes:

	- **Tenant suffix ID.** This ID is for the onmicrosoft.com accounts that you will use to sign into Microsoft 365 throughout the labs. This is in the format of **{username}@M365xZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider. Record this ZZZZZZ value for later use. When any of the lab steps direct you to sign into the Office 365 or Microsoft 365 portals, you must enter the ZZZZZZ value that you obtained here.
	- **Tenant password.** This is the password for the admin account provided by your lab hosting provider.
	- **Domain name components.** For the new accepted domain that you will create, you will need the UPN name provided by your lab hosting provider, and the lab hosting provider's domain name. The UPN name will be in the the format XXYYZZa, and the domain name will be in the format xxxCustomDomainxxx.xxx. 
	- **Network IP address.** Write down the **IP Address** value (this is the IP Address of your parent domain; for example, 64.64.206.13).

### Task 2- Set up the Organization Profile

In your role as Holly Spencer, Adatum’s Enterprise Administrator, you have been tasked with setting up the company’s profile for its Microsoft 365 trial tenant. In this task, you will configure the required options for Adatum’s tenant. Since Holly has yet to create a personal Microsoft 365 user account (you will do this in Task 3), Holly will initially sign into Microsoft 365 as the default Microsoft 365 MOD Administrator account using the Tenant email address and password that was assigned by your lab hosting provider.

1. When the Virtual Machine opens, it opens with the Client PC VM (LON-CL1). You need to switch to the Domain Controller VM; therefore, in the **Virtual Machine** field at the top of the page, select the drop-down arrow an select the Domain Controller VM (LON-DC1).

2. At the top of the page is an **Actions** field. Select the drop-down arrow and select **Ctrl+Alt+Delete** to log on. Log on as **ADATUM\Administrator** with the password **Pa55w.rd**. 

3. If you receive a **Networks** warning message asking if you want this PC to be discoverable by other PCs and devices on this network, select **No.**

4. **Server Manager** will automatically start. Leave it open (it’s used in the next task) but minimize the window for now.

5. On the taskbar at the bottom of the page, select the **Internet Explorer** icon. Maximize your browser window when it opens.

6. In your browser go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/** 

7. In the **Sign in** dialog box, copy and paste in the **Tenant Email** account provided by your lab hosting provider and then select **Next**.

8. In the **Enter password** dialog box, copy and paste in the **Tenant Password** provided by your lab hosting provider and then select **Sign in**.

9. On the **Stay signed in?** dialog box, select the **Don’t show this again** checkbox and then select **Yes.**

10. If a **Get your work done with Office 365** window appears, then close it now. 

11. If a **Set your time zone** window appears, select **set the time zone for your calendar**. In the **Outlook** window that opens, under **Time zone,** select your time zone and select **Save**, then close your browser window and re-open the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com**.

12. If a notification bar appears at the bottom of the screen for enabling the **Skype for Business Browser Helper add-on**, select **Don’t enable**. 

13. If a **Good morning/afternoon/evening MOD Administrator** window appears, select **Get started**.

14. In the **Microsoft Office Home** page, select the **Admin** app. This opens the **Microsoft 365 admin center.**

15. In the left-hand navigation pane, select the **Show All** ellipsis … icon to display all the navigation menu options.

16. In the left-hand navigation pane, select **Settings** and then select **Organization profile**.

17. In the **Organization Profile** window, it displays Contoso as the organization name. To the right of this, select the **pencil** (**Edit**) icon to change this information.   <br/>

    ‎**Note:** The Contoso organization name was explained in the Introduction section at the start of this lab. In the following steps, you will change it to Adatum Corporation. 

18. In the **Organization information** window, enter the following information:

	- Name: **Adatum Corporation**

	- Address: **555 Main Street**

	- City: **Redmond**

	- State: **Washington**

	- Postal Code: **98052**

	- Phone: **425-555-1234**

	- Technical contact: **admin@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Preferred language: **select your preferred language**

19. Select **Save**.

20. On the **Organization information** window, select **Close.**

21. To the right of **Release preferences**, select the **pencil** (**Edit**) icon.

22. In the **Release preferences** window, select **Targeted release for selected users** and then select **Next.**  <br/>

    ‎**Note:** One of the benefits of Office 365 is the ability to have the latest features and updates applied to your environment automatically, which can reduce maintenance costs and overhead for an organization. By setting up your Release preferences, you can control how and when your Office 365 tenant receives these updates.

23. In the **Are you sure you want to change to Targeted release for select people** window, select **Yes.**  <br/>

    **Note:** This option enables you to create a control group of users who will preview updates so that you can prepare the updates for your entire organization. The **Targeted release for everyone** option is more commonly used in development environments, where you can get updates early for your entire organization. In non-development environments, such as Adatum, targeted release to select people is the more typical preference as it enables an organization to control when it wants to make updates available to everyone once they’ve been reviewed by the control group.

24. In the **Release preferences** window, select **Add people.**

25. In the **Manage people for First** **release** window, in the list of users, select the checkbox for **MOD Administrator** and then select **Save**.

26. Select **Close**, and then select **Close** again. This returns you to the **Organization Profile** window.

27. To the right of **Manage custom themes for your organization**, select the **pencil** (**Edit**) icon.

28. In the **Customize Office 365 for your organization** window, you can add the logo of your company and set the background image as the default for all your users. Along with these options you can change the colors for your navigation pane, text color, icon color, and accent color. Go ahead and explore some different options for your tenant. Make any changes that you wish. <br/>

    **Note:** Some colors patterns aesthetically distract users. Avoid using high contrasting colors together, such as neon colors and high-resolution colors like white and bright pink.

29. Once you’re done exploring and making any further changes, select **Save** and then **Close**.

30. Remain logged into the domain controller VM and in Internet Explorer, leave your Microsoft 365 admin center tab and all tabs open for the remaining tasks. 
 

### Task 3 - Add a Custom Domain

Not every company has just one domain; in fact, many companies have more than one domain. In this task, you will gain experience adding a domain; in this case, you will add a second domain for Adatum Corporation. When you add a domain to Office 365, it's called an accepted, or custom domain. Custom domains allow companies to have their own branding on emails and accounts so that customers can verify who is emailing them (for example, @contoso.com). For the purposes of our hosted lab environment, instead of creating a custom domain titled @adatum.com, you will use the hosted lab domain name of XXYYZZa.xxxCustomDomainxxx.xxx, where XXYYZZ is the UPN name provided by your lab hosting provider and xxxCustomDomainxxx.xxx is your lab hosting provider's custom domain (see the instructions for replacing these domain name values in the Lab Introduction section of your student manual)

1. If you’re not logged into the LON-DC1 VM as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. You must now open **Windows PowerShell**. Select the magnifying glass (Search Windows) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. 

3. In the menu that appears, right-click on **Windows PowerShell** and select **Run as administrator** in the drop-down menu. 

4. At the command prompt, you should run the following command to create a new Zone in DNS (remember to change XXYYZZa to the unique UPN name provided by your lab hosting provider, and replace xxxCustomDomainxxx.xxx with your lab hosting provider's domain name): <br/>

    ‎**dnscmd /zoneadd XXYYZZa.xxxCustomDomainxxx.xxx /DsPrimary** 

5. Select the **Internet Explorer** icon on the taskbar at the bottom of the page and select the **Microsoft 365 admin center** tab that displays the **Organization Profile** page from the prior task. 

6. In the left-hand navigation pane, under **Settings**, select **Domains**. 

7. Select +**Add domain** to start the domain setup wizard. 

8. In the **Add a domain** page, in the **Enter a domain you own** field, enter your domain name in the form of **XXYYZZa.xxxCustomDomainxxx.xxx** (where XXYYZZa is the unique UPN name provided by your lab hosting provider, and xxxCustomDomainxxx.xxx is your lab hosting provider's domain name), and then select **Next**. 

9. In the **Verify domain** page, you must select a verification method to prove you own the domain. While the recommended option is **Verification email**, for the purposes of your lab environment you want to instead use a **TXT** record. Therefore, scroll down and select the **Add a TXT record instead** option and select **Next**. 

10. In the next **Verify domain** page, write down the what’s displayed to the right of the **TXT value**. This entry will be similar to **MS=msXXXXXXXX**. Record this value so that you have it available when you create an additional TXT record later in this task.   <br/>

    ‎**Important:** If you select **Verify** at this point, you will receive an error indicating the system could not find the record you added for this domain (you can do this if you want to see the error; there is no harm in it). Therefore, you must complete the next series of steps to add the TXT record to this domain in **DNS Manager**. Once you finish that, you will be instructed to return back to this page and select the **Verify** button so that you can complete the process of adding this domain in the Microsoft 365 admin center. 

11. Select the **Server Manager** icon that appears in your taskbar at the bottom of the page. Maximize the Server Manager window.

12. In **Server Manager Dashboard,** select **Tools** in the top right corner of the window. In the drop-down menu, select **DNS**. This will open **DNS Manager**.

13. In **DNS Manager**, in the **File Explorer** section in the left-hand column, expand **Forward Lookup Zones,** and then right-click on the DNS zone called **XXYYZZa.xxxCustomDomainxxx.xxx** (where XXYYZZa is the unique UPN name provided by your lab hosting provider and xxxCustomDomainxxx.xxx is your lab hosting provider's domain name). 

14. In the menu that appears, select **Other New Records**. 

15. In the **Resource Record Type** window, under **Select a resource record type**, scroll down and select **Text (TXT),** and then select the **Create Record** button at the bottom of the window.

16. In the **New Resource Record** box, leave the **Record name** field blank. 

17. In the **Text** field, type **MS=msXXXXXXXX**, replacing XXXXXXXX with the value that you recorded in Step 12. 

18. Select **OK** to create the record. 

19. In the **Resource Record Type** dialog box, select **Done**. 

20. You are now ready to return to the Microsoft 365 admin center and resume adding the domain record. If you’ll recall, when you were adding the domain in the Microsoft 365 admin center, you indicated that you wanted to verify the domain using a TXT record. At that point you had to switch to DNS Manger and add the TXT record. Now that you’ve added the TXT record, you can go back to the Microsoft 365 admin center and proceed with the domain verification process.<br/>

	‎Select the **Internet Explorer** icon on the taskbar, and then in your browser select the **Microsoft 365 admin center** tab that displays the **Verify Domain** page. The **TXT name** should display your UPN name (XXYYZZa) and the **TXT value** should display your MS=msXXXXXXXX value.

21. Scroll to the bottom of the window and select **Verify.**   <br/>

    ‎**Important:** If you had a typo or any other configuration mistakes, the domain will not be verified. If this occurs, the **Choose your online services** window in the next step will not appear. In this case, you should repeat this task and take your time when configuring the domain to make sure you don’t run into similar issues at this step in the process.

22. If your domain was successfully verified, the **Choose your online services** window will appear. In this window, **Exchange** is the only service selected. This is sufficient for Adatum, so scroll to the bottom of the window and select **Next**. 

23. In the **Update DNS settings** window, scroll down through the window to see the MX, CNAME, and TXT records for this domain. At the bottom of the window is a check box titled **Skip this step.** Select this checkbox, which changes the **Verify** button to a **Skip** button. You have already created the TXT record, and in the following steps you will create additional MX and A records in DNS Manager. Therefore, select the **Skip** button.

24. In the **Update DNS settings** window, select **Finish** to complete the new domain setup. 

25. On the taskbar at the bottom of the page, select the **DNS Manager** icon.

26. In **DNS Manager**, under **Forward Lookup Zones**, the **XXYYZZa.xxxCustomDomainxxx.xxx** domain should be selected from when you earlier left off. If not, select this zone now. You should now see the **TXT** record that you just created. You must now create a Host record (A) and a Mail Exchanger (MX) record for this domain in the following steps.

27. Under **Forward Lookup Zones**, right-click the **XXYYZZa.xxxCustomDomainxxx.xxx** domain and select **Other New Records**.

28. In the **Resource Record Type** window, under **Select a resource record type**, scroll down and select **Host (A or AAAA),** and then select the **Create Record** button at the bottom of the window.

29. In the **New Resource Record** box, you need to enter the Host’s IP address. At the start of this lab you opened the **Lab Network Info** window for the VM and wrote down the **IP Address** associated with the domain for this VM. Enter that **IP Address** value here (for example, 64.64.206.13) and then select **OK**.

30. In the **Resource Record Type** window, under **Select a resource record type**, scroll down and select **Mail Exchanger (MX),** and then select the **Create Record** button at the bottom of the window.

31. In the **New Resource Record** box, you need to enter the domain for this VM. Leave the **Host or child domain** field blank, but select **Browse** next to the **Fully qualified domain name (FQDN) of mail server** field.

32. In the **Browse** window, your domain controller VM name should appear (**LON-DC1**). Select this record and then select **OK**. 

33. In the **Browse** window, select the **Forward Lookup zones** folder and then select **OK**.

34. In the **Browse** window, select your domain of **XXYYZZa.xxxCustomDomainxxx.xxx** and then select **OK.**

35. In the **Browse** window, select the IP address of this domain and then select **OK.** 

36. In the **New Resource Record** window, the value of the FQDN is filled in. Select **OK** to create the record. 

37. In the **Resource Record Type** dialog box, select **Done**. 

38. In **DNS Manager**, you should now see the Host and MX records that you just created for this domain.

39. Close DNS Manager. 

40. Remain logged into the LON-DC1 VM with the Microsoft 365 admin center tab left open for the next task.

**Note:** Instead of using DNS Manger to create the Host and MX records above, you could have created them in PowerShell instead. If you use PowerShell to create these records, you would need to run the following commands (remember to change XXYYZZa to your unique UPN name, xxxCustomDomainxxx.xxx to your lab hosting provider's domain name, and n.n.n.n to your unique IP address):

‎**dnscmd /recordadd XXYYZZa.xxxCustomDomainxxx.xxx '@' A n.n.n.n**   
	
**dnscmd /recordadd XXYYZZa.xxxCustomDomainxxx.xxx '@' MX 10 XXYYZZa.xxxCustomDomainxxx.xxx**  


# End of Lab 1
