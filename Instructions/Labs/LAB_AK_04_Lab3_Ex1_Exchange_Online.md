# Module 4 - Lab 3 - Exercise 1 - Review Key Features of Exchange Online

Holly Dickson is Adatum’s Enterprise Administrator. She has recently deployed Microsoft 365 in a virtualized lab environment. Now that she has a tenant account set up and has been assigned to the Global Administrator role, she has been asked to review the key administrative functions within Exchange Online, SharePoint Online, and Teams so that she becomes familiar with their functionality and can offer guidance to her IT team on how they can be used throughout Adatum.

With regard to Microsoft Exchange, Adatum’s CTO has requested that Holly review some of the basic administrative functions in Exchange Online related to mail flow and recipient management. Since the Global Administrator role includes the Exchange Administrator role, Holly can perform all Exchange-related tasks.

### Task 1 – Manage Recipients

As you continue in your role as Holly Dickson, you are ready to review the steps involved in creating and managing mail flow recipients.

1. At the end of the previous lab, you were on LON-CL1, where you took on the role of Laura Atkins and installed Microsoft 365 Apps for enterprise. For this lab exercise, you must switch back to LON-DC1, where you will resume your pilot project in the role of Holly Dickson. <br/>

	Switch to **LON-DC1**, where you should still be logged in as the **Administrator** with a password of **Pa55w.rd**; if not, then do so now.

2. You should still have an Edge browser session and the Microsoft 365 admin center open from the prior lab. If so, proceed to the next step; otherwise, open Microsoft Edge, navigate to **https://portal.office.com/**, log in as **Holly@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider) and **Pa55w.rd**, and then in the **Microsoft Office Home** page, select **Admin** to open the Microsoft 365 admin center.

3. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Show all** (if necessary), then scroll down to **Admin centers** and select **Exchange**. This will open the **Exchange admin center.**

4. In the **Exchange admin center,** select **recipients** in the left-hand navigation pane.

5. In the **recipients** view, the **mailboxes** tab appears by default (see the tabs at the top of the page). The mailboxes that appear in this view include all the user accounts that were pre-created in your tenant by the lab hosting provider, along with Holly's mailbox that was added when you created her account in Lab 2. <br/>

	Select the mailbox for **Joni Sherman** by double-clicking on her **DISPLAY NAME.** This will open the **Edit Mailbox** window with Joni’s data prefilled. By default, the window displays the **general** tab (the tabs appear in the left-hand pane).

6.  At the bottom of the **general** tab, select **More options**.

7. Under **Custom attributes**, select the **pencil (edit)** icon. 

8. This opens the **Custom attributes** window for Joni. You can enter up to 15 attributes. You will not be entering any attributes in this lab exercise, but it’s important that you know this feature is available. Select **Cancel**.   <br/>

	‎**Note:** Custom attributes are properties your company can use for specific mailbox identification, such as a cost center number for the mailbox or other information such as an HR personnel number.

9. In addition to the **general** tab, the left-hand pane of the **Edit Mailbox** window includes several other tabs that enable you to enter additional information pertaining to this specific mailbox. While you will not enter any of this optional information for the purposes of this lab, take a few minutes now and select the following tabs to see what information can be captured: 

	- **contact information.** This tab enables you to add personal information such as Street, City or Mobile number for the user.

	- **organization.** This tab enables you to add company-specific information such as Title or Department for the user.

	- **mailbox features.** This tab enables the admin to assign specific policies to the user. These policies range from the sharing policy to the address book policy. This option also covers device usage and connectivity.

	- **member of.** This tab displays the Distribution groups that include this user.
	
10. On the left-hand pane select **mailbox delegation.** This option allows the admin to assign a user to this mailbox’s Send As, Send on Behalf, or Full Access permissions. This option is commonly used if you want another user to be able to send messages from this mailbox.

11. Scroll down on this **mailbox delegation** window and select the plus (+) sign under the **Full Access** section. 

12. In the **Select Full Access** window select **Holly Dickson**, select the **add-&gt;** button, and then select **OK.**  <br/>

	‎**Note:** After about an hour Holly Dickson will be able to access Joni’s mailbox without needing a password.

13. On Joni Sherman's **Edit Mailbox** window, select **Save**, and then select **OK** once the changes are saved.

14. Leave your browser and all the tabs open for the next task.

 
### Task 2 – Manage Groups 

In this task you will create two types of groups within Exchange Online. The first is a distribution list of email recipients, which is used to create a one-stop email list for contacting users simultaneously rather than having to email each recipient individually. The second type of group is a Microsoft 365 group.

1. Your browser should still be open to the **Exchange admin center** from the prior task, and it should still be displaying **recipients** from the left-hand navigation pane. In the prior task, you worked with user accounts using the **mailboxes** tab. In this task, you will be creating groups, so select the **groups** tab at the top of the **recipients**’ page.  <br/>

	**Note:** You should already see the **Inside Sales** group that you created in Lab 2. This is a Microsoft 365 group whose email address is associated with the custom, on-premises domain (@xxxUPNxxx.xxxCustomDomainxxx.xxx). In the following steps, you will create a Distribution list group and a Microsoft 365 group whose email addresses will be in Microsoft 365 (@xxxxxZZZZZZ.onmicrosoft.com). 

2. Select the drop-down arrow next to the **New Microsoft 365 group** button. In the drop-down menu, select **Distribution list**.

3. In the **new distribution list** window that appears, enter the following information:

	- Display Name: **Sales Department**

	- Alias: **SalesDept**

	- Email Address: tab into the field and the **SalesDept** alias will appear. In the domain field to the right of it, select the drop-down arrow and select **xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider).

	- Owners: Since you are logged into the EAC using Holly Dickson, her account is displayed as the default Owner. However, Holly wants Alex Wilber to co-own the group, so select the **plus (+)** sign under the **Owners** section, and in the **Select Owner** window, select **Alex Wilber**, select the **add-&gt;** button, and then select **OK**.

	- Members: select the plus (+) sign under the **Members** section, and in the **Select Members** window, select **Allan Deyoung**. Then hold down the **Ctrl** key and select **Diego Siciliani** and **Lynne Robbins**. This will select all three users at once, at which point you should select the **add-&gt;** button and then select **OK**. 

4. Select **Save** and then select **OK** once the changes are saved successfully.

5. Select the **+New Microsoft 365 group** button (not the drop-down arrow to the right of it, but the button itself). 

6. In the **Create a group** window that appears, enter the following information:

	- Group name: **Dynamics CRM Project Team**

	- Group email address: **DynCRM**

	- Group email address domain: In the domain field to the right of the **DynCRM** alias, select the drop-down arrow and select **xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider)

	- Privacy: **Public – Anyone can see content**

	- Owners: Leave as **Holly**

	- Language: Leave as **English**

	- Description: **Group of all company employees working on the Microsoft Dynamics CRM project.**

	- Subscribe new members: leave this check box selected so that members get conversations and calendar events sent to their Inboxes

7. Select **Save** and then select **OK** once the changes are saved successfully.

8. In the **Dynamics CRM Project Team** window, the **ownership** tab in the left-hand pane is displayed by default. Under **Owners**, select the **plus (+)** sign, and in the **Select Members** window, select **Nestor Wilke**, select the **add-&gt;** button, and then select **OK**.

9. In the left-hand pane, select **membership**.

10. Under **Members**, select the **plus (+)** sign, and in the **Select Members** window, select **Isaiah Langer**. Then hold down the **Ctrl** key and select **Joni Sherman**, and **Patti Fernandez**. This process will select all three users. Select the **add-&gt;** button and then select **OK.** 

11. Select **Save** and then select **OK** once the changes are saved successfully.


### Task 3 - Upgrade Distribution Lists

Organizations have typically relied on distribution groups in Exchange to communicate and collaborate with groups of people both inside and outside the company. However, Microsoft 365 Groups offer a more powerful solution for collaboration, and Adatum’s CTO wants to take advantage of this feature. He has asked you to upgrade the company’s Sales Department distribution list to a Microsoft 365 group so that the company’s sales staff can choose the people they want to collaborate with and easily set up a collection of resources for those people to share.

1. In the **Exchange admin center**, you should still be displaying **recipients** from the left-hand navigation pane, and you should still be displaying the **groups** tab. If not, then navigate to **recipients &gt; groups**. 

2. Below the tabs at the top of the screen are two large boxes that enable you to perform two functions: create a group in Outlook and upgrade distribution lists. In the **UPGRADE Distribution Lists** box, select the **Get Started** button. This opens a **Bulk upgrade DLs to groups in Outlook** window.

3. On the **Bulk upgrade DLs to groups in Outlook** window, the **Showing** field controls what information is being displayed. By default, it displays **Available for upgrade**, which displays any distribution lists that are available to be upgraded to a Microsoft 365 group. Adatum currently has only one distribution list that's available to be upgraded, the Sales Department group. <br/>

	Select the drop-down arrow in the **Showing** field and select the other option, **Upgraded DLs**. This option shows any distribution list groups that have been upgraded to a Microsoft 365 group. As you can see, there are no groups currently in this list. <br/>

	Now that you are familiar with the query options on this window, you want to return back to where you started so that you can upgrade the Sales Department group. Select the drop-down arrow for the **Showing** field and select the **Available for upgrade** option. 

4. Select the check box to the left of the **Sales Department** distribution list and at the bottom of the window select the **Start Upgrade** button.<br/>
	
5. It may take a minute or so before the **Upgrade in progress** window appears. Select **OK**. 

6. Once the upgrade is complete, the value in the **Showing** field will change to **Upgraded DLs** and the **Sales Department** group will be displayed in the group list.<br/>

	Select the drop-down arrow for the **Showing** field and select the **Available for upgrade** option. As you can see, this query is now empty, since the Sales Department has been upgraded. 

7. Select the **X** in the upper-right corner of the **Bulk Upgrade** window to close it.

8. This returns you to the **groups** tab in the **recipients** view. If the **Sales Department** group still displays as a **Distribution list**, then select the **Refresh** icon in the menu bar above the list; the Sales Department group will now display as a **Microsoft 365** group. 
 

### Task 4 - Configure a Group Naming Policy

A group naming policy enables organizations to standardize and manage the names of distribution groups created by its users. You can require that a specific prefix and suffix be added to the name for a distribution group at the time it's created, and you can also block specific words from being used. This helps organizations minimize the use of inappropriate words in group names. 

Adatum’s CTO wants Holly to implement a standard naming policy throughout the organization based on the following format: {Department}{Group Name}{City}

1. In the **Exchange admin center**, you should still be displaying the list of groups. In the menu bar that appears over the list of groups, select the **ellipsis** (...) icon, and in the menu that appears, select **Configure group naming policy.**

2. In the **group naming policy** window that appears, the **general** tab in the left-hand pane appears by default. Under the **Group Naming Policy** section, you can select a prefix and a suffix. In the **For the prefix, apply the following sequence:** field, select the drop-down arrow and select **Attribute.** This opens a **select an attribute** window. Select the drop-down arrow, select **Department**, and then select **OK** (do NOT select the **Add** button; this is for adding additional prefix values, which you will not do).

3. In the **For the suffix, apply the following sequence:** field, select the drop-down arrow and select **Text**. This opens an **Enter text** window. In the **Enter text** field, enter **Group** and then select **OK**.

4. Select the **Add** button below the **For the suffix, apply the following sequence:** field. 

5. In the **followed by...** field that appears, select the drop-down arrow and select **Attribute.** This opens a **select an attribute** window. Select the drop-down arrow, select **City**, and then select **OK**.

6. Review the **Preview of policy** example and then select the **Save** button at the bottom of the window.


### Task 5 – Manage Resources

A room mailbox is a resource mailbox that is assigned to a physical location, such as a conference room, an auditorium, or a training room. Users can easily reserve these rooms by including room mailboxes in their meeting requests. Adatum’s CTO wants to test this feature using the company’s most popular conference room, and he has asked Holly to configure this resource.

1. In the **Exchange admin center**, you should still be displaying **recipients** from the left-hand navigation pane. In this list of tabs across the top of the screen, select **resources.**

2. In the menu bar that appears over the list of resources, select the **plus (+)** sign and then in the drop-down menu, select **Room mailbox.**  <br/>
	
	‎**Note:** This selection is designed for administrators to set up a meeting location to be used for booking purposes. When scheduling meetings, you will be able to select the room from the Global Address List (GAL).

3. In the **new room mailbox** window that appears, enter the following information:

	- Room name: **Conference Room 1**

	- Email address: **Con1**

	- Email address domain: In the domain field to the right of the **Con1** alias, select the drop-down arrow and select **xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider)

	- Location: The room is in Building 5, Room 2011, so enter **5/2011**

	- Phone: **425-555-2011**

	- Capacity: **15**

4. Select **Save** and then select **OK** once the changes are successfully saved.

5. **Conference Room 1** now appears in the list of resources. You must now edit the booking properties for this resource. Since Conference Room 1 is the only resource in the list, it's already selected by default; therefore, select the **Edit** (pencil) icon on the menu bar.

6. In the **Conference Room 1** window that appears, select **booking options** in the left-hand pane.

7. Select the **Allow scheduling only during working hours** check box. 

8. In the **Maximum booking lead time (days)** field, change the value from **180** days to **60** days.  <br/>

	‎**Note:** The standard duration of 180 days can be too long for scheduling out most meetings. As a best practice, organizations should establish a company standard so that events do not over-book locations.

9. In the **Maximum duration (hours)** field, change the value from **24.0** hours to **120** hours (this is five days, or one work week). 

10. In the left-hand navigation pane, select **booking delegates**.

11. Select the **Select delegates who can accept or decline booking requests** option.  <br/>

	**Note:** This option allows a user to filter booking requests.

12. Under **Delegates**, select the **plus (+)** sign. In the **Select Delegates** window, select **Holly Dickson** and then hold down the **Ctrl** key and select and **Nestor Wilke**. This will select both users at once; then select the **add-&gt;** button and select **OK.** 

13. Select **Save** and then select **OK** once the changes are successfully saved.


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

4. Select **Save** and then select **OK** once the changes are successfully saved. Hai should now appear in the list of contacts as a **Mail contact**.

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

	- User ID domain: in the domain field to the right of the User ID, select the drop-down arrow and select **xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider)

	- New password: **Pa55w.rd**

	- Confirm Password: **Pa55w.rd**

7. Select **Save** and then select **OK** once the changes are successfully saved. Bill should now appear in the list of contacts as a **Mail user**.

 
### Task 7 – Configure Messaging Protection

Adatum has experienced a recent rash of malware infections. The company's CTO has asked Holly to investigate the various options that are available in Exchange Online to fortify Adatum’s messaging environment.

1. In the **Exchange admin center**, in the left-hand navigation pane, select **protection**.

2. In the list of protection tabs across the top of the page, **malware filter** is already selected by default since it’s the first tab.

3. In the list of malware filters, the **Default** filter is already selected by default. Select the **pencil (edit)** icon in the menu bar that appears above the filter list to edit this Default filter.

4. In the **Default** window, select **settings** in the left-hand pane.  <br/>

	**Note:** In this section you will be presented a variety of options on how your environment will respond, what it will respond to, and how it identifies key recipients.

5. In the **Malware Detection Response** section, select the **Yes and use the default notification text** option.

6. In the **Common Attachment Types Filter** section, select the **On – Emails with attachments of filtered file types will trigger the Malware Detection Response (recommended)** option.

7. Scroll down to the **Notifications** section and under **Administrator Notifications**, select the following two check boxes:  

	- **Notify administrator about undelivered messages from internal senders**
	- **Notify administrator about undelivered messages from external senders**

8. Below the first check box that you selected in the prior step, enter **Holly@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider) in the **Administrator email address** field. Then copy this value and paste it into the **Administrator email address** field below the second check box that you selected in the prior step.

9. Select **Save**, then select **OK** once the update is complete, and then select **OK** once the changes are saved successfully.


### Task 8 – Manage Connection Filters

Holly has been contacted by Adatum’s CTO. He is upset that he keeps finding email from friends and business associates in his junk email folder, and he’s even had email blocked entirely by a spam filter. He has asked Holly to address this problem by making sure that email sent from people who are trusted do not get blocked. 

Holly has investigated the situation and has found that in Exchange Online, you can create a connection filter policy that defines a list of IP addresses that you trust. This is known as an Allow list, or Safe Sender list. You can also create a Blocked senders list, which is a list of IP addresses (typically from known spammers) that you don't ever want to receive email messages from. 

1. In the **Exchange admin center**, you should still be displaying **protection** from the left-hand navigation pane. In the list of protection tabs across the top of the screen, select **connection filter.**

2. In the list of connection filters, the **Default** filter is already selected by default. Select the **pencil (edit)** icon in the menu bar that appears above the filter list to edit this Default filter.

3. In the **Default** window, in the left-hand pane, select the **connection filtering** tab.  <br/>

	**Note:** In this section you will be presented a variety of options on what IP Addresses will be allowed to send messages to your environment and what IP addresses will be blocked.

4. At this time, you will NOT be adding IP addresses to the allow or block lists. You can do this if you have a known IP address you would like to test against. It typically takes up to 1 hour to replicate the change within the system. For this lab, simply review the fact that you can create allowed and blocked lists of IP addresses.

5. Select the **Enable safe list** check box at the bottom of the page. This is a best practice that enables for your tenant the most common third-party sources of trusted senders that Microsoft subscribes to. Selecting this check box skips spam filtering on messages sent from these senders, ensuring that they are never mistakenly marked as spam.

6. Select **Save** to save this filter, and then select **OK** once the changes are successfully saved.


### Task 9 – Manage Spam Filters

For Microsoft 365 customers whose mailboxes are hosted in Microsoft Exchange Online, their email messages are automatically protected against spam and malware. Microsoft 365 has built-in malware and spam filtering capabilities that help protect inbound and outbound messages from malicious software and help protect you from spam. 

As Adatum’s Global Admin, Holly doesn't need to set up or maintain the filtering technologies, which are enabled by default. However, she can make company-specific filtering customizations in the Exchange admin center. She has decided to test this out by configuring a spam policy to grant or deny an email by focusing on the language of the email and the location of the email's origin.

1. In the **Exchange admin center**, you should still be displaying **protection** from the left-hand navigation pane. In the list of tabs across the top of the screen, select **spam filter**.

2. In the list of spam filters, the **Default** filter is already selected by default. Select the **pencil (edit)** icon in the menu bar that appears above the filter list to edit this Default filter.

3. In the **Default** window, in the left-hand pane, select **spam and bulk actions**.  <br/>

	‎**Note:** In this section you will be presented a variety of options on how you would like spam to be handled and what rating will be triggered depending on the severity of the spam.

4. In the **spam and bulk actions** section, make the following selections:

	- Spam: **Move message to junk Email folder**

	- High Confident Spam: **Prepend subject line with text**

5. In the **Bulk email** section, make the following selections:

	- Mark bulk email as spam: Leave this check box selected

	- Select the threshold: select the drop-down arrow and change the threshold to **5**

6. In the **Quarantine** section, make the following selections:

	- Retain spam for (days): **10**

	- Prepend subject line with this text: enter **QUARANTINED: This message contains potential spam**

7. In the left-hand navigation pane, select **international spam**.  <br/>

	‎**Note:** This section allows you to automatically tag messages as spam whose origins comes from countries that are blacked listed, as well as messages written in a specific language.

8. Select the check box at the top of the page that says **Filter email messages written in the following languages**.

9. Select the **plus** (+) sign below this check box to add the languages being filtered. 

10. In the **Select Language** window, hold down the **Ctrl** key and select the languages that you want to flag as spam. Then select the **add-&gt;** button, and then select **OK** to confirm your selection.

11. Below the listed of languages that you selected, select the check box that says **Filter email messages sent from the following countries or regions**.

12. Select the **plus** (+) sign below this check box to add the countries or regions.

13. In the **Select Region** window, hold down the **Ctrl** key and select the countries or regions that you want to flag as being origins of spam. Then select the **add-&gt;** button, and then select **OK** to confirm your selection.

14. In the left-hand navigation pane, select **advanced options**.  <br/>

	‎**Note:** This section allows you to automatically tag messages as spam that have embedded URL’s with specific attributes or that have embedded HTML in the message.

15. Under the **Increase Spam Score** section, turn **On** the following options:

	- **URL redirect to other port**

	- **URL to .biz or .info websites**

16. Under the **Mark as Spam** section, turn **On** the following options:

	- **Empty messages**

	- **Conditional Sender ID filtering: hard fail**

17. Select **Save** and then select **OK** once the changes are successfully saved.

18. In the list of spam filters, the **Default** filter that you just edited is selected and a summary of the filter is now displayed in the right-hand pane. Scroll down in the right-hand pane and note how **End-user spam notifications** are disabled. Below this option, select **Configure end-user spam notifications**.

19. In the **edit end-user spam notifications** window, select the **Enable end-user spam notifications** check box, and then change the **Send end-user spam notifications every (days)** value to **5**.

20. Select **Save** and then select **OK** once the changes are successfully saved.


### Task 10 – Manage Mail Flow Rules 

After Holly reviewed the messaging environment at Adatum Corporation, she realized that she could provide a more efficient and secure environment if she created a set of mail flow rules that identify and take action on messages that are in-transit through her Exchange Online organization, as opposed to simply waiting until the messages are delivered to mailboxes before being acted upon by Inbox rules in Outlook and Outlook on the web. 

Holly has discovered that mail flow rules contain a richer set of conditions, exceptions, and actions, all of which will provide her with the flexibility to implement many types of messaging policies for Adatum. She is eager to put this to the test regarding a significant issue currently affecting Adatum’s messaging environment - users who send extremely large email messages. She has decided that her first task will be to create a mail flow rule that restricts email size.

1. In the **Exchange Admin Center**, in the left-hand navigation pane, select **mail flow.**

2. In the list of mail flow tabs across the top of the page, **rules** is already selected by default since it’s the first tab. <br/>

	**Note:** In this section you will be presented with a variety of options to protect against emails being sent from Adatum that have sensitive information, as well as creating custom rules to prevent or track messaging-related issues from recipients in your environment. For the purposes of this lab, you will only update the email size restriction rule.

3. In the menu bar that appears over the list of mail flow rules, select the **plus (+)** sign, and in the menu that appears, select **Filter messages by size.**

4. In the **new rule** window that appears, enter the following information:

	- Name: **Email size restriction**

	- Apply this rule if: select **The message size is greater than or equal to...** 

		- To the right of this drop-down field, select **Enter text**.

		- In the **specify size (KB)** window, enter **1024** and then select **OK**. 

	- Do the following: select **Block the message...**, and then in the drop-down menu that appears, select **Reject the message and include an explanation**. 

		- In the **specify rejection reason** window, enter the following text: **Your message exceeds the size limit. Please adjust the message size or compress the email content and send it as a zipped file.**

		- Select **OK.**

	- Under **Choose a mode for this rule**, select **Enforce.**

5. Select **Save**.


### Task 11 – Validate Accepted Domains

A domain that’s added to an organization's on-premises environment is called an accepted, or custom domain. You can create mailboxes with accepted domains to receive and send email. In Lab 1, you created a domain for Adatum Corporation based on the unique UPN name assigned to your tenant and the custom domain name provided by your lab hosting provider (in this case, xxxUPNxxx.xxxCustomDomainxxx.xxx, where xxxUPNxxx is your unique UPN Name and xxxCustomDomainxxx.xxx is the domain created by your lab hosting provider). 

In this task, you will use the Exchange Admin Center to view your accepted domain and configure the domain type. Each domain can be changed to either authoritative (which accepts all inbound or outbound mail) or internal relay (which only accepts internal email). By default, all domains should be set to authoritative. You want to ensure that your custom domain’s type is set to authoritative.

1. In the **Exchange admin center**, you should still be displaying **mail flow** from the left-hand navigation pane. In this list of mail flow tabs across the top of the screen, select **accepted domains.**

2. In the list of accepted domains, you should see Adatum’s two domains – its custom on-premises domain (xxxUPNxxx.xxxCustomDomainxxx.xxx) that you added in Lab 1, and its Microsoft 365 cloud domain (xxxxxZZZZZZ.onmicrosoft.com).

3. You can see from this display that the domain type for each domain is already set to **Authoritative,** so you don’t need to make any changes here. 

4. However, let’s assume that you set the domain type to **Internal Relay** when you initially created the custom **xxxUPNxxx.xxxCustomDomainxxx.xxx** domain. If you wanted to change it now to **Authoritative,** you would perform the following steps (you can perform the first step to see the window and the corresponding options, but the domain is already set to Authoritative, so you can’t actually make this change):

	- Select this domain in the list, and then select the **pencil (edit)** icon on the menu bar. 

	- In the window for this domain, under **This accepted domain is:** you would select the **Authoritative** option and then select **Save**. However, since you did not make any changes, select **Cancel** to close this window.

5. This concludes the exercise on reviewing Exchange Online features. You can close the **Exchange admin center** tab in your Edge browser. This will return you to the **Microsoft 365 admin center** tab, which you will access in the next exercise.


# Proceed to Lab 3 - Exercise 2

