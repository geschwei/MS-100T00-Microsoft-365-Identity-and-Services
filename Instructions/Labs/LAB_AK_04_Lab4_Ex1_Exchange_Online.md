# Module 4 - Lab 4 - Exercise 1 - Review Key Features of Exchange Online

Holly Spencer is Adatum’s Enterprise Administrator. She has recently deployed Microsoft 365 in a virtualized lab environment. Now that she has a tenant account set up, she has been asked to review the key administrative functions within Exchange Online, SharePoint Online, and Teams so that she becomes familiar with their functionality and can offer guidance to her IT team on how they can be used throughout Adatum.

When Holly created her Microsoft 365 user account back in Lab 1, she assigned herself the Microsoft 365 Global Administrator role. Adatum’s CTO has requested that Holly review some of the basic administrative functions in Exchange Online related to mail flow and recipient management. Since the Global Administrator role includes the Exchange Online Administrator role, Holly can perform all the tasks in Exchange.

### Task 1 – Manage Recipients

Now that Adatum’s tenant account is set up, you are ready to review how to create and manage mail flow recipients.

1. If necessary, you should log into your Domain Controller VM (LON-DC1) as **ADATUM\Administrator** and password **Pa55w.rd.**

2. At the end of the previous lab, you were instructed to close Internet Explorer. If you did, then open it now and maximize the browser window; otherwise, close all but one of the open tabs, which you’ll use in the next step to navigate to the Microsoft Office Home page.

3. In your browser go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/** 

4. In the **Pick an account** window, select **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider).

5. In the **Enter password** dialog box, enter **Pa55w.rd** and then select **Sign in**.

6. In the **Microsoft Office Home** page, select **Admin**, which opens the Microsoft 365 admin center.

7. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Show all**, then scroll down and under **Admin centers,** select **Exchange**. This will open the **Exchange admin center.**

8. In the **Exchange admin center,** select **recipients** in the left-hand navigation pane.

9. In the list of user mailboxes, you should see all the user accounts that were pre-created in the lab environment for Adatum Corporation. Select **Joni Sherman** by double clicking on her **DISPLAY NAME.** This will open the **Edit User Mailbox** window with Joni’s data prefilled. By default, the window displays the **general** tab (the tabs appear in the left-hand pane).

10.  At the bottom of the **general** tab, select **More options**.

11. Under **Custom attributes**, select the **pencil (edit)** icon. 

12. This opens the **Custom attributes** window for Joni. You can enter up to 15 attributes. You will not be entering any attributes in this lab exercise, but it’s important that you know this feature is available. Select **Cancel**.   <br/>

	‎**Note:** Custom attributes are properties your company can use for specific mailbox identification, such as a cost center number for the mailbox or other information such as an HR personnel number.

13. In addition to the **genera**l tab, the left-hand pane of the **Edit User Mailbox** window includes several other tabs that enable you to enter additional information pertaining to this specific mailbox. While you will not enter any of this optional information for the purposes of this lab, you should still select the following tabs to see what information can be captured: 

	- **contact information.** This tab enables you to add personal information such as Street, City or Mobile number for the user.

	- **organization.** This tab enables you to add company-specific information such as Title or Department for the user.

	- **mailbox features.** This tab enables the admin to assign specific policies to the user. These policies range from the sharing policy to the address book policy. This option also covers device usage and connectivity.

	- **MailTip.** This tab enables you to create a MailTip that’s displayed when people send email to this user. 

14. On the left-hand pane select **mailbox delegation.** This option allows the admin to assign a user to this mailbox’s Send As, Send on Behalf, or Full Access permissions. This option is commonly used if you want another user to be able to send messages from this mailbox.

15. Scroll down on this **mailbox delegation** window and select the plus (+) sign next in the **Full Access** section. 

16. In the **Select Full Access** window select the **MOD Administrator** account, select **add-&gt;**, and then select **OK.**  <br/>

	‎**Note:** After about an hour the MOD Administrator account will be able to access Joni’s mailbox without needing a password.

17. On the **Edit User Mailbox** window select **Save** to authorize the changes and close the window.

 
### Task 2 – Manage Groups 

In this task you will create two types of groups within Exchange Online. The first is a distribution list of email recipients, which is used to create a one-stop email list for contacting users simultaneously rather than having to email each recipient individually. The second type of group is an Office 365 group.

1. In the **Exchange admin center (EAC)**, you should still be displaying **recipients** from the left-hand navigation pane. In the prior task, you worked with user accounts using the **mailboxes** tab. In this task, you will be creating groups, so select the **groups** tab at the top of the **recipients**’ page.  <br/>

	**Note:** You should already see the Inside Sales group that you created in Lab 1. This is an Office 365 group whose email address is associated with the custom, on-premises domain (@XXYYZZa.CustomDomain.us). In the following steps, you will create a Distribution list group and an Office 365 group whose email addresses will be in Microsoft 365 (@M365xZZZZZZ.onmicrosoft.com). 

2.	Select the drop-down arrow next to the **New Office 365 group** button. In the drop-down menu, select **Distribution list**.

3. In the **new distribution list** window that appears, enter the following information:

	- Display Name: **Sales Department**

	- Alias: **SalesDept**

	- Email Address: tab into the field and the **SalesDept** alias will appear. In the domain field to the right of it, select the drop-down arrow and select **M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Owners: Since you are logged into the EAC using Holly Spencer, her account is displayed as the default Owner. However, Holly wants the MOD Administrator to be the owner of the group, so select the **plus (+)** sign, and in the **Select Owner** window, select **MOD Administrator**, select the **add-&gt;** button, and then select **OK**.

	- Members: select the plus (+) sign, and in the **Select Members** window, hold down the **Ctrl** key and select **Alan Yoo, Libby Hayward,** and **Adam Hobbs.** This will select all three users at once; then select the **add-&gt;** button and select **OK.** 

4. Select **Save.**

5. Select the **New Office 365 group** button. 

6. In the **create a group** window that appears, enter the following information:

	- Group name: **Dynamics CRM Project Team**

	- Group email address: **DynCRM**

	- Group email address domain: In the domain field to the right of the **DynCRM** alias, select the drop-down arrow and select **M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Privacy: **Public – Anyone can see content**

	- Owners: Leave this as is.

	- Language: select the language for the group

	- Description: **This is a group of all company employees working on the Microsoft Dynamics CRM implementation project.**

	- Language: select the language for the group

7. Select **Save**. This will open the Dynamics CRM Project Team window.

8. In the **Dynamics CRM Project Team** window, the **ownership** tab in the left-hand pane is displayed by default. Under **Owners**, select the **plus (+)** sign, and in the **Select Members** window, select **MOD Administrator**, select the **add-&gt;** button, and then select **OK**.

9. In the left-hand pane, select **membership**.

10. Under **Members**, select the **plus (+)** sign, and in the **Select Members** window, hold down the **Ctrl** key and select **Ada Russell**, **Adam Hobbs**, **Laura Atkins**, and **Libby Hayward**. Since this process will select all four users, select the **add-&gt;** button and then select **OK.** 

11. Select **Save**.


### Task 3 - Upgrade Distribution Lists

Organizations have typically relied on distribution groups in Exchange to communicate and collaborate with groups of people both inside and outside the company. However, Office 365 Groups offer a more powerful solution for collaboration, and Adatum’s CTO wants to take advantage of this feature. He has asked you to upgrade the company’s Sales Department distribution list to an Office 365 group so that the company’s sales staff can choose the people they want to collaborate with and easily set up a collection of resources for those people to share.

1. In the **Exchange admin center**, you should still be displaying **recipients** from the left-hand navigation pane, and you should still be displaying the **groups** tab. If not, then navigate to **recipients &gt; groups**. 

2. On the top right of the **groups** tab is a section that says **UPGRADE Distribution Lists.** In this section, select **Get Started.** This opens a **Bulk upgrade DLs to groups in Outlook** window.

3. The **Bulk upgrade DLs to groups in Outlook** window displays, by default, the distribution list groups that are available for upgrade to Office 365 groups (the **Showing** field displays **Available for upgrade** by default). Adatum currently has only one distribution list, the Sales Department group. Select the check box to the left of the **Sales Department** distribution list and at the bottom of the window select **Start Upgrade.**<br/>

	**Note:** This may take a minute or two to complete.

4. In the **Upgrade in Progress** window, select **OK**.

5. Once the upgrade is complete, the Showing field will change to **Upgraded DLs** and the **Sales Department** group will be displayed in the group list. 

6. Select the **Cancel** button to close the window (this closes the window but does not cancel the transaction).

7. This returns you to the **groups** tab. The **Sales Department** group still displays as a **Distribution list**. In the menu bar above the list, select the **Refresh** icon. The Sales Department group will now display as an **Office 365** group. 
 

### Task 4 - Configure a Group Naming Policy

A group naming policy lets you standardize and manage the names of distribution groups created by users in your organization. You can require a specific prefix and suffix be added to the name for a distribution group when it's created, and you can block specific words from being used. This helps you minimize the use of inappropriate words in group names. Adatum’s CTO wants to implement a standard naming policy throughout the organization based on the following format: {Department}{Group Name}{City}. You have been tasked with creating this company-wide policy.

1. In the **Exchange admin center**, you should still be displaying the list of groups. In the menu bar that appears over the list of groups, select the **ellipsis** icon, and in the menu that appears, select **Configure group naming policy.**

2. In the **group naming policy** window that appears, in the **general** tab in the left-hand pane, under **Group Naming Policy** you can select a prefix and a suffix. 

	- In the **For the prefix** field, select the drop-down arrow and select **Attribute.**

	- This opens a **select an attribute** window. Select the drop-down arrow, select **Department**, and then select **OK**.

	- In the **For the suffix** field, select the drop-down arrow and select **Text**.

	- This opens an **Enter text** window. Enter **Group** and then select **OK**.

	- Review the **Preview of policy** example and then select **Save.**


### Task 5 – Manage Resources

A room mailbox is a resource mailbox that's assigned to a physical location, such as a conference room, an auditorium, or a training room. With room mailboxes, users can easily reserve these rooms by including room mailboxes in their meeting requests. Adatum’s CTO wants to test out this option using the company’s most popular conference room, and he has asked you to configure this resource.

1. In the **Exchange admin center**, you should still be displaying **recipients** from the left-hand navigation pane. In this list of recipient tabs across the top of the screen, select **resources.**

2. In the menu bar that appears over the list of resources, select the **plus (+)** sign and then in the drop-down menu, select **Room mailbox.**  <br/>
	
	‎**Note:** This selection is designed for administrators to set up a meeting location to be used for booking purposes. When scheduling meetings, you will be able to select the room from the GAL.

3. In the **new room mailbox** window that appears, enter the following information:

	- Room name: **Conference Room 1**

	- Email address: **Con1**

	- Email address domain: In the domain field to the right of the **Con1** alias, select the drop-down arrow and select **M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Location: The room is in Building 5, Room 2011, so enter **5/2011**

	- Phone: **425-555-1111**

	- Capacity: **15**

4. Select **Save**.

5. Conference Room 1 now appears in the list of resources. Select **Conference Room 1**, and then select the **Edit** (pencil) icon on the menu bar.

6. In the **Conference Room 1** window that appears, select **booking options** in the left-hand pane.

7. Select the **Allow Scheduling only during working Hours** check box. 

8. In the **Maximum booking lead time (days)** field, change the value from **180** days to **60** days.  <br/>

	‎**Note:** The standard duration of 180 days can be too long for scheduling out most meetings. As a best practice, organizations should establish a company standard so events do not over-book locations.

9. In the **Maximum duration (hours)** field, change the value from **24** hours to **120** hours (this is five days, or one work week).   

10. In the left-hand navigation pane, select **booking delegates**.

11. Select the **Select delegates who can accept or decline booking requests** option.  <br/>

	**Note:** This option allows a user to filter booking requests.

12. Under **Delegates**, select the **plus (+)** sign. In the **Select Delegates** window hold down the **Ctrl** key and select Holly Spencer and the MOD Administrator. This will select both users at once; then select the **add-&gt;** button and select **OK.** 

13. Select **Save**.


### Task 6 – Manage Contacts

One of the key features of Exchange Online is the ability to maintain different types of contacts in the Exchange Admin Center. In this task, you will be introduced to mail contacts and mail users.

1. In the **Exchange admin center**, you should still be displaying **recipients** from the left-hand navigation pane. In this list of recipient tabs across the top of the screen, select **contacts.**

2. In the menu bar that appears over the list of contacts, select the **plus (+)** sign, and in the menu that appears, select **Mail contact.**  <br/>

	‎**Note:** This option enables external people from outside your organization to be added to your Exchange Online distribution lists.

3. In the **new mail contact** window that appears, enter the following information.

	- First name: **Hai**

	- Initials: leave blank

	- Last Name: **Chu**

	- Display Name: tab into the field and **Hai Chu** is automatically displayed

	- Alias: **Hai**

	- External Email Address: **Hai@fabrikam.com**

4. Select **Save**. Hai should now appear in the list of contacts as a Mail Contact.

5. On the menu bar above the contacts list, select the **plus** **(+)** sign to add another contact. In the drop-down menu, select **Mail user.**  <br/>

	**Note:** This option is for individuals who need to use the company domain even though they are not a full-time employee (for example: contractors, advisors, and selective temporary staff). This option will forward email to the individual’s external email when mail is sent to the contact’s internal company account.  <br/>
	
	‎**WARNING**: A Mail User does not need a license to access SharePoint Online; the user simply needs to be given access to it.   
	
6. In the **new mail user** window that appears, enter the following information:

	- First name: **Bill**

	- Initials: leave blank

	- Last Name: **Norman**

	- Display Name: tab into the field and **Bill Norman** is automatically displayed

	- Alias: **Bill**

	- External email address: **Bill@fabrikam.com**

	- User ID: **Bill** (this is the user’s alias for his internal Adatum account)

	- User ID domain: in the domain field to the right of the User ID, select the drop-down arrow and select **M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- New password: **Pa55w.rd**

	- Confirm Password: **Pa55w.rd**

7. Select **Save**. Bill should now appear in the list of contacts as a Mail User.

 
### Task 7 – Configure Messaging Protection

Adatum has experienced a rash of malware infections. Your CTO has asked you to investigate the various options that are available in Exchange Online to fortify Adatum’s messaging environment.

1. In the **Exchange admin center**, in the left-hand navigation pane, select **protection.**

2. In the list of protection tabs across the top of the page, **malware filter** is already selected by default since it’s the first tab.

3. In the list of malware filters, the **Default** filter is already selected by default. Select the **pencil (edit)** icon in the menu bar that appears above the filter list to edit this filter.

4. In the **Default** window, in the left-hand pane, select **settings.**  <br/>

	**Note:** In this section you will be presented a variety of options on how your environment will respond, what it will respond to, and how it identifies key recipients.

5. In the **Malware Detection Response** section, select **Yes and use the default notification text.**

6. In the **Common Attachment Types** **Filter**, select **On – Emails with attachments of filtered file types will trigger the Malware Detection Response (recommended).**

7. Scroll down to the **Administrator Notifications** section and select both check boxes – **Notify administrator about undelivered messages from internal senders**, and **Notify administrator about undelivered messages from external senders.**

8. Below each of the two check boxes that you selected in the prior step, enter **Holly@Mc365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider).

9. Select **Save**, which may take a few minutes to update Adatum’s organization settings.  <br/>

	‎**Note:** In your virtual lab environment, the window displaying the progress bar may not finish, even after waiting over 5 minutes. If this occurs, select the X in the upper right corner of the window to close it, and then select the option in which you confirm that you want to leave the page. You will lose your updates from this task, but that’s OK because this task does not impact any other tasks in this lab. 


### Task 8 – Manage Connection Filters

You were just contacted by Adatum’s CTO. He is upset that he keeps finding email from friends and business associates in his junk email folder, and he’s even had email blocked entirely by a spam filter. He has asked you to address this problem by making sure that email sent from people that are trusted isn't blocked. You have investigated the situation and have found that in Exchange Online, you can create a connection filter policy that defines a list of IP addresses that you trust. This is known as an Allow list, or Safe Sender list. You can also create a blocked senders list, which is a list of IP addresses, typically from known spammers, that you don't ever want to receive email messages from. 

1. In the **Exchange admin center**, you should still be displaying **protection** from the left-hand navigation pane. In this list of protection tabs across the top of the screen, select **connection filter.**

2. In the list of connection filters, the **Default** filter is already selected by default. Select the **pencil (edit)** icon in the menu bar that appears above the filter list to edit this filter.

3. In the **Default** window, in the left-hand pane, select **connection filtering**.  <br/>

	**Note:** In this section you will be presented a variety of options on what IP Addresses will be allowed to send messages to your environment and what IP addresses will be blocked.

4. At this time, you will NOT be adding IP addresses to the allow or block lists. You can do this if you have a known IP address you would like to test against. It typically takes up to 1 hour to replicate the change. For this lab, simply review the fact that you can create allowed and blocked lists of IP addresses.

5. As a best practice, select **Enable safe list** to enable the most common third-party sources of trusted senders for your tenant.

6. Select **Save** to save this filter.


### Task 9 – Manage Spam Filters

For Office 365 customers whose mailboxes are hosted in Microsoft Exchange Online, their email messages are automatically protected against spam and malware. Office 365 has built-in malware and spam filtering capabilities that help protect inbound and outbound messages from malicious software and help protect you from spam. 

As Adatum’s Global Admin, you don't need to set up or maintain the filtering technologies, which are enabled by default. However, you can make company-specific filtering customizations in the Exchange admin center. You have decided to test this out by configuring a spam policy to grant or deny an email by focusing on language of the email and location of email origin.

1. In the **Exchange admin center**, you should still be displaying **protection** from the left-hand navigation pane. In this list of protection tabs across the top of the screen, select **spam** **filter.**

2. In the list of spam filters, the **Default** filter is already selected by default. Select the **pencil (edit)** icon in the menu bar that appears above the filter list to edit this filter.

3. In the **Default** window, in the left-hand pane, select **spam and bulk actions**.  <br/>

	‎**Note:** In this section you will be presented a variety of options on how you would like spam to be handled and what rating will be triggered depending on the severity of the spam.

4. In the **spam** section, make the following selections:

	- Spam: **Move message to junk Email folder**

	- High Confident Spam: **Prepend subject line with text**

5. In the **Bulk email** section, make the following selections:

	- Mark bulk email as spam: Leave this option selected

	- Select the threshold: select the drop-down arrow and change the threshold to **6**

6. In the **Quarantine** section, make the following selections:

	- Retain spam for (days): **20**

	- Prepend subject line with this text: enter **QUARANTINED: This message contains potential spam**

7. In the left-hand navigation pane, select **international spam**.  <br/>

	‎**Note:** This section allows you to automatically tag messages as spam whose origin comes from countries that are blacked listed, as well as messages written in a specific language.

8. Select the check box at the top of the page that says **Filter email messages written in the following languages**.

9. Select the **plus** (+) sign below this check box to add the languages being filtered. 

10. In the **Select Language** window, hold down the **Ctrl** key and select the languages that you want to flag as spam. Then select **add-&gt;**, and then select **OK** to confirm your selection.

11. Select the check box at the top of the page that says **Filter email messages sent from the following countries or regions**.

12. Select the **plus** (+) sign below this check box to add the countries or regions.

13. In the **Select Region** window, hold down the **Ctrl** key and select the countries or regions that you want to flag as spam. Then select **add-&gt;**, and then select **OK** to confirm your selection.

14. In the left-hand navigation pane, select **advanced options**.  <br/>

	‎**Note:** This section allows you to automatically tag messages as spam that have embedded URL’s with specific attributes or that have embedded HTML in the message.

15. Under the **Increase Spam Score** section, turn **On** the following options:

	- **URL redirect to other port**

	- **URL to .biz or .info websites**

16. Under the **Mark as Spam** section, turn **On** the following options:

	- **Empty messages**

	- **Conditional Sender ID filtering: hard fail**

17. Select **Save**.

18. In the list of spam filters, the **Default** filter that you just edited is selected and a summary of the filter is displayed in the right-hand pane. Scroll down in the right-hand pane and note how **End-user spam notifications** are disabled. Below this option, select **Configure end-user spam notifications**.

19. In the **edit end-user spam notifications** window, select the **Enable end-user spam notifications** check box, and change the **Send end-user spam notifications every (days)** value to **5**.

20. Select **Save**.


### Task 10 – Manage Mail Flow Rules 

After analyzing your messaging environment at Adatum Corporation, you realize that you could provide a more efficient and secure environment if you created a set of mail flow rules that identify and take action on messages that are in transit through your Exchange Online organization, as opposed to simply waiting until the messages are delivered to mailboxes before being acted upon by Inbox rules in Outlook and Outlook on the web. 

You have discovered that mail flow rules contain a richer set of conditions, exceptions, and actions, all of which will provide you with the flexibility to implement many types of messaging policies for Adatum. You are eager to put this to the test regarding a big issue currently affecting Adatum’s messaging environment, which is users who send extremely large email messages. You have decided that your first task will be to create a mail flow rule that restricts email size.

1. In the **Exchange Admin Center**, in the left-hand navigation pane, select **mail flow.**

2. In the list of mail flow tabs across the top of the page, **rules** is already selected by default since it’s the first tab. Note that two mail flow rules already exist based on tasks that you performed in an earlier lab.  <br/>

	**Note:** In this section you will be presented with a variety of options to protect against emails being sent from Adatum that have sensitive information, as well as creating custom rules to prevent or track messaging-related issues from recipients in your environment.

3. In the menu bar that appears over the list of mail flow rules, select the **plus (+)** sign, and in the menu that appears, select **Filter messages by size.**

4. In the **new rule** window that appears, enter the following information:

	- Name: **Size restriction**

	- Apply this rule if: select **the message size is greater than or equal to** 

		- To the right of the **Apply this rule if** option, select **Enter text**.

		- In the **specify size** window, enter **1024** and then select **OK**. 

	- Do the following: select **block the message**, and then in the drop-down menu that appears, select **Reject the message and** **include an explanation.** 

		- In the **specify rejection reason** window, enter the following text: **Your message exceeds the size limit. Please adjust the message size or compress the email and send it as a zipped file.**

		- Select **OK.**

	- Under **Choose a mode for this rule**, select **Enforce.**

5. Select **Save**.


### Task 11 – Validate Accepted Domains

A domain that’s added to Office 365 is called an accepted, or custom domain. You can create mailboxes with accepted domains to receive or send mails. In Lab 1, you created a domain for Adatum Corporation based on your unique UPN name of XXYYZZa.CustomDomain.us (where XXYYZZ is your unique UPN Name provided by your lab hosting provider). In this task, you will use the Exchange Admin Center to view your accepted domain and configure the domain type. Each domain can be changed to either authoritative (which accepts all inbound or outbound mail) or internal relay (which only accepts internal email). By default, all domains should be set to authoritative. You want to ensure that your accepted domain’s type is set to authoritative.

1. In the **Exchange admin center**, you should still be displaying **mail flow** from the left-hand navigation pane. In this list of mail flow tabs across the top of the screen, select **accepted domains.**

2. In the list of accepted domains, you should see Adatum’s two domains – its custom on-premises domain (XXYYZZa.CustomDomain.us) and its Microsoft 365 cloud domain (M365xZZZZZZ.onmicrosoft.com).

3. You can see from this display that the domain type for each domain is already set to **Authoritative,** so you don’t need to make any changes here. 

4. However, let’s assume that you set the domain type to **Internal Relay** when you initially created the custom **XXYYZZa.CustomDomain.us** domain. If you wanted to change it now to **Authoritative,** you would perform the following steps (you can perform the first step to see the window and the corresponding options, but the domain is already set to Authoritative, so you can’t actually make this change):

	- Select this domain in the list, and then select the **pencil (edit)** icon on the menu bar. 

	- In the window for this domain, you would select the **Authoritative** option and then select **Save**.

5. This concludes the exercise on reviewing Exchange Online features. You can close the **Exchange admin center** tab in Internet Explorer. This will return you to the Microsoft 365 admin center tab.


# Proceed to Exercise 2

