# Module 3 - Lab 1 - Exercise 2 - Set Up Your Microsoft 365 Tenant 

In the following lab exercises you will take on the role of Holly Dickson, Adatum Corporation’s Enterprise Administrator. Adatum runs their legacy applications (such as Microsoft Exchange) in an on-premises deployment. However, they recently subscribed to Microsoft 365, thereby creating a hybrid deployment in which they must synchronize their on-premises and cloud deployments. 

You have been tasked with deploying Microsoft 365 in Adatum’s hybrid deployment using a virtualized lab environment. In this lab, you will set up a Microsoft 365 trial tenant, add a custom on-premises accepted domain, install Azure Active Directory, and add several users and groups that will be used throughout the remainder to the labs in this course. 

In this lab, the trial tenant has already been selected and a default tenant admin account has already been created. In your role as Holly Dickson, Adatum’s Enterprise Administrator, you will be responsible for the remainder of the initial setup. You will log into the Domain Controller VM using the ADATUM\Administrator account, and when you access Microsoft 365 for the first time, you will initially log in using the tenant email account that has been assigned to your Microsoft 365 tenant. Once you create your Microsoft 365 account for Holly, you will log into Microsoft 365 as Holly from that point forward.


### Task 1 - Obtain Your Office 365 Credentials

Once you launch the lab, a free trial tenant will be automatically created for you to access Azure in the Microsoft Virtual Lab environment. This tenant will be automatically assigned a unique username and password. You must retrieve this username and password so that you can sign into Azure within the Microsoft Virtual Lab environment. You will also be assigned a unique network IP address and UPN name for your O365 blob. You will also use this UPN name in various tasks throughout the labs for this course.

1. Because this course can be offered by learning partners using any one of several authorized lab hosting providers, the actual steps involved to retrieve the UPN name, network IP address, and tenant ID associated with your tenant may vary by lab hosting provider. Therefore, your instructor will provide you with the necessary instructions on how to retrieve this information for your course. The information that you should write down for later use includes:

	- **Tenant suffix ID.** This ID is for the onmicrosoft.com accounts that you will use to sign into Microsoft 365 throughout the labs. This is in the format of **{username}@M365xZZZZZZ.onmicrosoft.com**, where ZZZZZZ is your unique tenant suffix ID provided by your lab hosting provider. Record this ZZZZZZ value for later use. When any of the lab steps direct you to sign into the Office 365 or Microsoft 365 portals, you must enter the ZZZZZZ value that you obtained here.
	- **Tenant password.** This is the password for the admin account provided by your lab hosting provider.
	- **UPN name (in the format XXYYZZa) and the network IP address.** Write down the **IP Address** value (this is the IP Address of your parent domain; for example, 64.64.206.13), as well as your **UPN name** (for example, AVEAH2a).

### Task 2- Set up the Organization Profile

In your role as Holly Dickson, Adatum’s Enterprise Administrator, you have been tasked with setting up the company’s profile for its Microsoft 365 trial tenant. In this task, you will configure the required options for Adatum’s tenant. Since Holly has yet to create a personal Microsoft 365 user account (you will do this in Task 3), Holly will initially sign into Microsoft 365 as the default Microsoft 365 MOD Administrator account using the Tenant email address and password that was assigned by your lab hosting provider.

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

12. In the Office 365 portal, select the **Install Office** button, and then select **Office 365 apps.**

13. In the notification bar that appears at the bottom of the page, select the option to **Run** the setup program. Installation of the Office 365 apps will take around five minutes to complete, at which point, select **Close** in the dialog box once Office is installed.   <br/>

    **Note:** If you don’t want to wait for the Office 365 apps to complete, open a new tab in your browser and continue with the next steps while the installation continues.

14. In your browser go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/** 

15. If a notification bar appears at the bottom of the screen for enabling the **Skype for Business Browser Helper add-on**, select **Don’t enable**. 

16. If a **Good morning/afternoon/evening MOD Administrator** window appears, select **Get started**.

17. In the **Microsoft Office Home** page, select the **Admin** app. This opens the **Microsoft 365 admin center.**

18. In the left-hand navigation pane, select the **Show All** ellipsis … icon to display all the navigation menu options.

19. In the left-hand navigation pane, select **Settings** and then select **Organization profile**.

20. In the **Organization Profile** window, it displays Contoso as the organization name. To the right of this, select the **pencil** (**Edit**) icon to change this information.   <br/>

    ‎**Note:** The Contoso organization name was explained in the Introduction section at the start of this lab. In the following steps, you will change it to Adatum Corporation. 

21. In the **Organization information** window, enter the following information:

	- Name: **Adatum Corporation**

	- Address: **555 Main Street**

	- City: **Redmond**

	- State: **Washington**

	- Postal Code: **98052**

	- Phone: **425-555-1234**

	- Technical contact: **admin@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Preferred language: **select your preferred language**

22. Select **Save**.

23. On the **Organization information** window, select **Close.**

24. To the right of **Release preferences**, select the **pencil** (**Edit**) icon.

25. In the **Release preferences** window, select **Targeted release for selected users** and then select **Next.**  <br/>

    ‎**Note:** One of the benefits of Office 365 is the ability to have the latest features and updates applied to your environment automatically, which can reduce maintenance costs and overhead for an organization. By setting up your Release preferences, you can control how and when your Office 365 tenant receives these updates.

26. In the **Are you sure you want to change to Targeted release for select people** window, select **Yes.**  <br/>

    **Note:** This option enables you to create a control group of users who will preview updates so that you can prepare the updates for your entire organization. The **Targeted release for everyone** option is more commonly used in development environments, where you can get updates early for your entire organization. In non-development environments, such as Adatum, targeted release to select people is the more typical preference as it enables an organization to control when it wants to make updates available to everyone once they’ve been reviewed by the control group.

27. In the **Release preferences** window, select **Add people.**

28. In the **Manage people for First** **release** window, in the list of users, select the checkbox for **MOD Administrator** and then select **Save**.

29. Select **Close**, and then select **Close** again. This returns you to the **Organization Profile** window.

30. To the right of **Manage custom themes for your organization**, select the **pencil** (**Edit**) icon.

31. In the **Customize Office 365 for your organization** window, you can add the logo of your company and set the background image as the default for all your users. Along with these options you can change the colors for your navigation pane, text color, icon color, and accent color. Go ahead and explore some different options for your tenant. Make any changes that you wish. <br/>

    **Note:** Some colors patterns aesthetically distract users. Avoid using high contrasting colors together, such as neon colors and high-resolution colors like white and bright pink.

32. Once you’re done exploring and making any further changes, select **Save** and then **Close**.

33. Remain logged into the domain controller VM and in Internet Explorer, leave your Microsoft 365 admin center tab and all tabs open for the remaining tasks. 
 

### Task 3 - Add a Custom Domain

Not every company has just one domain; in fact, many companies have more than one domain. In this task, you will gain experience adding a domain; in this case, you will add a second domain for Adatum Corporation. When you add a domain to Office 365, it's called an accepted, or custom domain. Custom domains allow companies to have their own branding on emails and accounts so that customers can verify who is emailing them (for example, @contoso.com). For the purposes of our hosted lab environment, instead of creating a custom domain titled @adatum.com, you will use the hosted lab domain name of XXYYZZa.CustomDomain.us, where XXYYZZ is the UPN name associated with your on-premises lab network.

1. If you’re not logged into the LON-DC1 VM as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. You must now open **Windows PowerShell**. Select the magnifying glass (Search Windows) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. 

3. In the menu that appears, right-click on **Windows PowerShell** and select **Run as administrator** in the drop-down menu. 

4. At the command prompt, you should run the following command to create a new Zone in DNS (remember to change XXYYZZa to the unique UPN name provided by your lab hosting provider):   <br/>

    ‎**dnscmd /zoneadd XXYYZZa.CustomDomain.us /DsPrimary** 

5. Select the **Internet Explorer** icon on the taskbar at the bottom of the page and select the **Microsoft 365 admin center** tab that displays the **Organization Profile** page from the prior task. 

6. In the left-hand navigation pane, under **Settings**, select **Domains**. 

7. Select +**Add domain** to start the domain setup wizard. 

8. In the **Add a domain** page, in the **Enter a domain you own** field, enter your domain name in the form of **XXYYZZa.CustomDomain.us** (where XXYYZZa is the unique UPN name provided by your lab hosting provider), and then select **Next**. 

9. In the **Verify domain** page, you must select a verification method to prove you own the domain. While the recommended option is **Verification email**, for the purposes of your lab environment you want to instead use a **TXT** record. Therefore, scroll down and select the **Add a TXT record instead** option and select **Next**. 

10. In the next **Verify domain** page, write down the what’s displayed to the right of the **TXT value**. This entry will be similar to **MS=msXXXXXXXX**. Record this value so that you have it available when you create an additional TXT record later in this task.   <br/>

    ‎**Important:** If you select **Verify** at this point, you will receive an error indicating the system could not find the record you added for this domain (you can do this if you want to see the error; there is no harm in it). Therefore, you must complete the next series of steps to add the TXT record to this domain in **DNS Manager**. Once you finish that, you will be instructed to return back to this page and select the **Verify** button so that you can complete the process of adding this domain in the Microsoft 365 admin center. 

11. Select the **Server Manager** icon that appears in your taskbar at the bottom of the page. Maximize the Server Manager window.

12. In **Server Manager Dashboard,** select **Tools** in the top right corner of the window. In the drop-down menu, select **DNS**. This will open **DNS Manager**.

13. In **DNS Manager**, in the **File Explorer** section in the left-hand column, expand **Forward Lookup Zones,** and then right-click on the DNS zone called **XXYYZZa.CustomDomain.us** (where XXYYZZa is the unique UPN name provided by your lab hosting provider). 

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

26. In **DNS Manager**, under **Forward Lookup Zones**, the **XXYYZZa.CustomDomain.us** domain should be selected from when you earlier left off. If not, select this zone now. You should now see the **TXT** record that you just created. You must now create a Host record (A) and a Mail Exchanger (MX) record for this domain in the following steps.

27. Under **Forward Lookup Zones**, right-click the **XXYYZZa.CustomDomain.us** domain and select **Other New Records**.

28. In the **Resource Record Type** window, under **Select a resource record type**, scroll down and select **Host (A or AAAA),** and then select the **Create Record** button at the bottom of the window.

29. In the **New Resource Record** box, you need to enter the Host’s IP address. At the start of this lab you opened the **Lab Network Info** window for the VM and wrote down the **IP Address** associated with the domain for this VM. Enter that **IP Address** value here (for example, 64.64.206.13) and then select **OK**.

30. In the **Resource Record Type** window, under **Select a resource record type**, scroll down and select **Mail Exchanger (MX),** and then select the **Create Record** button at the bottom of the window.

31. In the **New Resource Record** box, you need to enter the domain for this VM. Leave the **Host or child domain** field blank, but select **Browse** next to the **Fully qualified domain name (FQDN) of mail server** field.

32. In the **Browse** window, your domain controller VM name should appear (**LON-DC1**). Select this record and then select **OK**. 

33. In the **Browse** window, select the **Forward Lookup zones** folder and then select **OK**.

34. In the **Browse** window, select your domain of **XXYYZZa.CustomDomain.us** (where XXYYZZa is the unique UPN name provided by your lab hosting provider) and then select **OK.**

35. In the **Browse** window, select the IP address of this domain and then select **OK.** 

36. In the **New Resource Record** window, the value of the FQDN is filled in. Select **OK** to create the record. 

37. In the **Resource Record Type** dialog box, select **Done**. 

38. In **DNS Manager**, you should now see the Host and MX records that you just created for this domain.

39. Close DNS Manager. 

40. Remain logged into the LON-DC1 VM with the Microsoft 365 admin center tab left open for the next task.

**Note:** Instead of using DNS Manger to create the Host and MX records above, you could have created them in PowerShell instead. If you use PowerShell to create these records, you would need to run the following commands (remember to change XXYYZZa to your unique UPN name and n.n.n.n to your unique IP address):

‎**dnscmd /recordadd XXYYZZa.CustomDomain.us '@' A n.n.n.n**   
	
**dnscmd /recordadd XXYYZZa.CustomDomain.us '@' MX 10 XXYYZZa.CustomDomain.us**  


### Task 4 - Create Office 365 User Accounts 

Holly Dickson is Adatum’s Enterprise Administrator. Since she doesn’t have a personal Microsoft 365 user account set up for herself, Holly initially signed into Microsoft 365 as the default Microsoft 365 MOD Administrator account. In this task, she will create a Microsoft 365 user account for herself, and she will assign her user account the Microsoft 365 Global Administrator role, which gives her the ability to perform all administrative functions within Microsoft 365.

‎You will then create several additional user accounts in the Microsoft 365 admin center, each of which you will later add to new security groups that you’ll also create. While Enterprise Admins typically do not add user accounts, this is a one-time task that you need to perform to prepare Adatum’s test environment for future lab exercises in this course.

**Important:** As a best practice in your real-world deployments, you should always write down the first global admin account’s credentials (in this lab, the MOD Administrator) and store it away for security reasons. This account is a non-personalized identity that owns the highest privileges possible in a tenant. It is **not** MFA activated (because it is not personalized) and the password for this account is typically shared among several users. Therefore, this first global admin is a perfect target for attacks, so it’s always recommended to create personalized service admins and keep as few global admins as possible. For those global admins that you do create, they should each be mapped to a single identity, and they should each have MFA enforced.

1. On the LON-DC1 VM, the **Microsoft 365 admin center** should still be open in Internet Explorer from the prior task. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Users** and then select **Active users**. 

2. In the **Active users** list, you will see that the only user is the default **MOD Administrator** account. Since you’re taking on the role of Holly Dickson in this lab scenario, you will create a user account for yourself, and you will assign yourself the Microsoft 365 role of Global Administrator. You will also create several other user accounts that will be used throughout the remaining labs in this course.

3. In the **Active Users** window, select **Add a user**. 

4. In the **Set up the basics** window, enter the following information:

	- First name: **Holly**

	- Last name: **Dickson** 

	- Display name: When you tab into this field, **Holly Dickson** will appear.

	- Username: When you tab into this field, **Holly** will appear; leave this as the username<br/>
	
		‎**IMPORTANT:** To the right of the **Username** field is the domain field. It’s already prefilled with the custom **XXYYZZa.CustomDomain.us** on-premises domain; however, you must select the drop-down arrow and select the **M365xZZZZZZ.onmicrosoft.com** cloud domain instead (where ZZZZZZ is your tenant ID provided by your lab hosting provider).<br/>
	
		After configuring this field, Holly’s username should appear as:<br/>

		**Holly@M365xZZZZZZ.onmicrosoft.com**  
	
	- Password settings: select the **Let me create the password** option

	- Password: **Pa55w.rd** 

	- Uncheck the **Make this user change their password when they first sign in** checkbox 

5. Select **Next**.

6. In the **Assign product licenses** window, enter the following information:

	- Select location: **United States**

	- Licenses: Under **Assign user a product license**, select **Office 365 E5** 

7. Select **Next.**

8. In the **Optional settings** window, select the drop-down arrow to the right of **Roles.** 

9. In the **Roles information** that appears, uncheck **User (no administrator access).** By doing so, all the Microsoft 365 administrator roles are now enabled and available to be assigned.

10. Select **Global Administrator** and then select **Next**.

11. On the **You’re almost done – review and finish adding** window, review your selections. If anything needs to be changed, select the appropriate **Edit** link and make the necessary changes. Otherwise, if everything looks good, select **Finish adding**. 

12. On the **Holly Dickson has been added** page, select **Close.** 

13. Repeat steps 2-12 to add the following users with all the same data that was assigned to Holly, with the following exceptions: **Do NOT assign a role to any of the following users, and of this group, you should only assign a license to Alan Yoo. Alan and Holly should be the only users assigned a license.** <br/>

	**Licenses.** For Alan, you should assign an **Office 365 E5** license on the **Assign product licenses** page; he must be licensed for a later lab. For the remaining users, select the **Create user without product license (not recommended)** option on the **Assign product licenses** page. <br/>

	**Roles.** By default, a user is assigned **User role (no administration access)**; this will be sufficient for these users for now. In Lab 2 (Module 5), you will assign roles to the users. So when you reach the **Optional settings** window, select **Next** to bypass assigning a role. 

	- **Alan Yoo** with username **Alan**  

	- **Ada Russell** with username **Ada**

	- **Adam Hobbs** with username **Adam**

	- **Libby Hayward** with username **Libby**

    - **Laura Atkins** with username **Laura** 
    
    **IMPORTANT:** When you enter the **Username** for each of these users, make sure that in the domain field, you select the **M365xZZZZZZ.onmicrosoft.com** domain, just as you did when you created Holly’s user account record. The domain field will be prefilled with the custom **XXYYZZa.CustomDomain.us** on-premises domain; however, since the purpose of this task is to create Microsoft 365 user accounts, you must select the **M365xZZZZZZ.onmicrosoft.com** cloud domain instead (where ZZZZZZ is your tenant ID provided by your lab hosting provider).
‎
14. Remain logged into the domain controller VM with the Microsoft 365 admin center open in your browser for the next task.


### Task 5 – Create and Manage Groups  

In the prior task, you added several new Microsoft 365 user accounts. In this task, you will create two new groups and then manage the groups by assigning users to them. You will also analyze the effect on group members when you delete a group.

1. On the LON-DC1 VM, in the **Microsoft 365 admin center**, select **Groups** in the navigation pane on the left, and then under it, select **Groups**. 

2. In the **Groups** window, select **Add a group** and then enter the following information for the new group: 

	- Type: **Office 365**

	- Name: **Inside Sales**

	- Group email address: When you tab into this field, **insidesales** will appear; leave this as the group email address <br/>
	
		**IMPORTANT:** To the right of the **Group email address** field is the domain field. It’s already prefilled with the custom **XXYYZZa.CustomDomain.us** on-premises domain, and if you select the drop-down arrow, no other domains appear (this is different from adding users). So the value in this field can be left as is.   <br/>
		
		After configuring this field, the Inside Sales group email address should appear as: **insidesales@XXYYZZa.CustomDomain.us**

	- Description: **Collaboration group for the Inside Sales team**

	- Privacy: leave the default setting of **Public**

	- Owner: **Alan Yoo**

3. Select **Add** and then **Close.**

4. In the **Groups** window, select **Add a group** and then enter the following information for the new group:

	- Type: **Security**

	- Name: **Sales**

	- Description: **Sales Department users**<br/>

	**Note:** there is no owner, email address, or privacy setting for Security groups

5. Select **Add** and then **Close.**

6. If the new groups do not appear in the **Groups** list, select the **Refresh** icon to the right of the URL in Internet Explorer. Both groups should now appear. 

7. You’re now ready to add members to the groups. In the list of **Groups**, select the **Inside Sales** group, which opens a window for the group. 

8. In the **Inside Sales** group window, select **Members**.

9. In the **Members** section, you can see that there are zero (0) members. Select **View all and manage members** to add members to the group. 

10. In the **Inside Sales** group window, select **Add members**. This displays the list of current users.

11. In the list of users, select **Ada Russell** and **Alan Yoo** and then select **Save**. 

12. Select **Close**. This displays the list of users for this group. Select **Close** again. 

13. On the **Inside Sales** window, select the **X** in the upper right-hand corner to close the window. 

14. In the **Groups** window, select **Add a group** and then enter the following information for the new group:

	- Type: **Security**

	- Name: **Accounts Receivable**

	- Description: **Accounts Receivable department users** 

15. Select **Add** and then **Close.**

16. If the Accounts Receivable group does not appear in the **Groups** list, select the **Refresh** icon to the right of the URL in Internet Explorer. The group should now appear.

17. In the **Groups** list, select the **Accounts Receivable** group, which opens a window for the group. 

18. In the **Accounts Receivable** group window, select **Members**.

19. In the **Members** section, you can see that there are zero (0) group owners and members. Select **View all and manage owners** to add an owner for the group.

20. In the **Accounts Receivable** group window, select **Add owners**. This displays the list of current users.

21. In the list of users, select **Libby Hayward** and then select **Save**. 

22. Select **Close**. This displays the list of owners for this group. Select **Close** again. 

23. In the **Accounts Receivable** group window, select **View all and manage members** to add members to the group. 

24. In the **Accounts Receivable** group window, select **Add members**. This displays the list of current users.

25. In the list of users, select **Adam Hobbs** and **Libby Hayward** and then select **Save**. 

26. Select **Close**. This displays the list of users for this group. Select **Close** again. 

27. On the **Accounts Receivable** window, select the X in the upper right-hand corner to close the window. This will return you to the list of **Groups** in the **Microsoft 365 admin center**. 

28. You now want to test the effect of deleting a group. In the list of **Groups,** select the vertical ellipsis icon (**More actions**) to the right of the **Inside Sales** group. In the menu box, select **Delete group**. 

29. In the **Delete group** window, select the **Delete** button.

30. Once the group is deleted, select **Close**. 

31. This will return you to the list of **Groups** in the **Microsoft 365 admin center**. The **Inside Sales** group should no longer appear. 

32. To verify whether deleting this group affected any of its members, select **Users** and then **Active Users** in the navigation pane on the left-hand side of the Groups window. 

33. In the list of **Active** **Users** verify that the two members of this group, Alan Yoo and Ada Russell, still exist in the list of users. This verifies that deleting a group does not delete the user accounts that were members of the group.

34. Remain logged into the domain controller VM with the Microsoft 365 admin center open in your browser for the next task.


### Task 6 – Prepare for Microsoft Azure Active Directory 

Azure Active Directory is needed to perform several configuration steps when installing Microsoft 365. These steps are performed using Windows PowerShell. However, before you can use PowerShell to access Azure AD, you must first install the Windows PowerShell modules that enable you to access Azure AD through PowerShell. In this task, you will prepare for using Azure AD by installing those PowerShell modules.

1. On the LON-DC1 VM, in Internet Explorer, enter the following URL in the address bar: **http://aka.ms/t01i**   <br/>

    ‎This will take you to the **Microsoft Download Center** for the **Microsoft Online Services Sign-In Assistant for IT Professionals RTW.**

2. Scroll down on the page and under **Microsoft Online Services Sign-In Assistant for IT Professionals RTW**, verify that English is selected as your **Language,** and then select **Download**. 

3. On the **Choose the download you want** page, select the **en\msoidcl_64.msi** check box, and then select **Next**. 

4. If a notification bar appears at the bottom of the page indicating that Internet Explorer blocked a pop-up from www.microsoft.com, select **Allow once**.

5. In the notification bar that appears at the bottom of the page asking whether you want to Run or Save the setup program from the Download Center, select **Run**. 

6. In the **Microsoft Online Services Sign-in Assistant Setup** wizard, select **I accept the terms in the License Agreement and Privacy Statement**, and then select **Install**. 

7. On the **Completed the Microsoft Online Services Sign-in Assistant Setup Wizard** page, select **Finish**. 

8. Close this tab in Internet Explorer. 

9. If Windows PowerShell is still open from the earlier task (see the Windows PowerShell icon on the taskbar), then proceed to the next step. Otherwise, you must open **Windows PowerShell** by performing the following steps:

	- Select the magnifying glass (Search Windows) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. 

	- In the menu that appears, right-click on **Windows PowerShell** and select **Run as administrator** in the drop-down menu. 

10. In **Windows PowerShell**, type the following command and then press Enter:<br/>

	‎**Install-Module MSOnline** 
	
11. If you are prompted to install the **NuGet provider**, enter **Y** to select **[Y] Yes**. 

12. If you are prompted to install the module from **PSGallery,** enter **A** to select **[A] Yes to All.** 

13. Once the installation is complete, the screen will return to the Windows PowerShell command prompt.

14. You must then run the following command to install the Azure AD PowerShell module that you just retrieved in the earlier step:<br/>

	**Install-Module AzureADPreview**   
	
15. If you are prompted to confirm that you want to execute this command, enter **A** to select **[A] Yes to All**.

16. You have now installed the Windows PowerShell modules required to access Azure AD.

17. Remain logged into the domain controller VM and keep the Windows PowerShell window open for the next task.


### Task 7 – Recover Groups using PowerShell 

Azure AD is required to perform several group management tasks in Microsoft 365, one of which is recovering deleted groups. In this task, you will recover the Inside Sales group that you deleted back in Task 4.

1. If you’re not logged into the LON-DC1 VM as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. If you closed Windows PowerShell after the prior task, you will need to open it again.

3. In **Windows PowerShell**, type the following commands (after each command, press Enter):

	- You must run the following command to connect with an authenticated account to use Active Directory cmdlet requests: <br/> 
	
		‎**Connect-AzureAD**   

	- A new window will appear requesting your credentials. Sign in using your tenant email account **Admin@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) and with the **tenant password** from your lab hosting provider).  

	- You should then run the following command to display the repository of deleted groups (this should display the **Inside Sales** group that you earlier deleted):<br/>  
	
		‎**Get-AzureADMSDeletedGroup**   

	- Before you can restore this deleted group, you must first copy the Object ID of the Inside Sales group that appears in the table of deleted groups. When you perform the next command to restore the group, you will use this ID to identify the group that you want restored. <br/>
	
		To copy the ID, select the entire ID and then right-click and select **Copy**.

	- You should then run the following command to retrieve and restore the deleted group whose Object ID matches the value you enter:<br/>  

		‎**Note:** Replace the {objectId} in the following command with the ID number for the Inside Sales group that you copied in the prior step. When you enter the following Restore command, right-click and select **Paste** when you get to the {objectId} parameter, then press Enter to run the command.  <br/>

		‎**Restore-AzureADMSDeletedDirectoryObject -Id {objectId}**  
		
4. Leave your Windows PowerShell window open for the next exercise; simply minimize the Windows PoweShell window for now.

5. Validate that the **Inside Sales** group has been recovered. To do this, go to the **Microsoft 365 Admin Center** in your Internet Explorer browser, select **Groups** from the left-hand navigation pane, and then under it select **Groups** to display the list of groups. 

6. Verify that the **Inside Sales** group has been restored and is present in the list of groups.

7. Leave your browser windows open so that they’re ready for the next task. 


# End of Lab 1
