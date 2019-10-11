# Module 12 - Lab 5 - Exercise 2 - Implement Identity Synchronization 

Azure AD Connect will continue to synchronize any delta changes every 30 minutes. In this exercise you are going to make some user and group updates and then manually force an immediate synchronization rather than waiting for Azure AD Connect to automatically synchronize the updates. You will then verify whether the updates were synchronized.  

‎**Important:** When you start this exercise, you should perform the first three tasks without any delay between them so that Azure AD Connect doesn’t automatically synchronize the changes that you make to the identity objects.

### Task 1: Create an Identity Mismatch Scenario for Synchronization  

To test the manual, forced synchronization process, you will set up a user scenario that accomplishes two goals:

- You will create a new user account in your on-premises AD that will be synchronized with Azure AD. 

- However, when creating this new user account, you will purposely create an identity mismatch scenario (also known as identity forking), which is a common error faced by organizations that lack discipline when maintaining user accounts. For a given user, you will create cloud and on-premises mailboxes that have a domain mismatch. The email address of the cloud account will point to the **onmicrosoft.com** domain, and the email address of the on-premises account will point to the primary SMTP domain of **xtremelabs.us**. This will end up creating an identity mismatch during the synchronization process.  <br/>

	‎Because of this domain mismatch, the synchronization process will create two accounts for this user in the Microsoft 365 Active User list. Each account will have its own mailbox because the mailboxes will have different domain and routing addresses.   <br/>
	
	‎In a normal situation in which the user’s on-premises and cloud accounts have the same UPN and domain, the synchronization process will create one user account in the Microsoft 365 Active User list that has multiple SMTP addresses in the email address property chain. 

You will create this identity mismatch situation by first creating a user account for Scotty Heyward in Microsoft 365 that references the onmicrosoft.com domain. You will then create an on-premises user account and mailbox for Scotty in Adatum’s local Exchange Server that references the xtremelabs.us domain. 

By purposely creating this mismatch scenario, you will then learn how to use Soft Matching to troubleshoot the problem in the next exercise.
  
‎This task resumes from the prior task, where you logged into the Domain Controller VM as **Holly@XXYYZZa.xtremelabs.us.**

1. On the Domain Controller VM (LON-DC1), you will first create a user account for **Scotty Heyward** in Microsoft 365. In **Internet Explorer**, select the **Microsoft 365 admin center** tab, and in the left-hand navigation pane, select **Users** and then **Active users**. 

2. You will begin by creating a user account for Scotty Heyward in Microsoft 365 that references the **onmicrosoft.com** domain. <br/>

	‎In the **Active users** window, in the menu bar, select **Add a user**.

3. In the **Set up the basics** window, enter the following information:

	- First name: **Scotty**

	- Last name: **Heyward** 

	- Display name: When you tab into this field, **Scotty Heyward** will appear.

	- Username: When you tab into this field, **Scotty** will appear; leave this as the username   <br/>

		‎**IMPORTANT:** To the right of the **Username** field is the domain field. It’s already prefilled with the custom **XXYYZZa.xtremelabs.us** on-premises domain; however, to create the identity mismatch, select the drop-down arrow and select the **M365xZZZZZZ.onmicrosoft.com** cloud domain instead (where ZZZZZZ is your tenant ID provided by your lab hosting provider). So Scotty’s username should appear as: ‎**Scotty@M365xZZZZZZ.onmicrosoft.com**  

	- Password settings: select the **Let me create the password** option

	- Password: **Pa55w.rd** 

	- Uncheck the **Make this user change their password when they first sign in** checkbox 

4. Select **Next**.

5. In the **Assign product licenses** window, enter the following information:

	- Select location: **United States**

	- Licenses: Under **Assign user a product license**, select **Office 365 E5** 

6. Select **Next.**

7. In the **Optional settings** window, select **Next**.

8. On the **You’re almost done – review and finish adding** window, review your selections. If anything needs to be changed, select the appropriate **Edit** link and make the necessary changes. Otherwise, if everything looks good, select **Finish adding**. 

9. On the **Scotty Heyward has been added** page, select **Close.** 

10. You will now create an on-premises mailbox and user account for Scotty on Adatum’s local Exchange Server that references the primary SMTP domain of **xtremelabs.us**.  <br/>

	‎In the **Virtual machine** box at the top of the VM, switch to the **Exchange Server VM** (LON-EX1).

11. In the **Exchange Server VM**, log in as **adatum\administrator** and **Pa55w.rd**. <br/>

	‎**Note:** If you receive a notification that you need some updates, simply ignore it for lab purposes.

12. Select the **Start** icon on the lower-left corner of the taskbar. In the **Start** menu, in the list of programs, select **Microsoft Exchange Server 2019** to expand the program group, and then select **Exchange Administrative Center**.

13. This opens **Internet Explorer**. In the **Set up Internet Explorer 11** dialog box that appears (the first time you run Internet Explorer), the **Use recommended security, privacy, and compatibility settings** option is selected by default. Accept this setting by selecting **OK**. 

14. In the **This site is not secure** window that appears, select **More information** and then select **Go on to the webpage (not recommended).**

15. In the **Exchange Admin Center** sign-in screen, **adatum\administrator** should be prefilled in the **Domain\user name** field; if it isn’t, you need to enter it. Enter **Pa55w.rd** in the **Password** field, and then select **sign in.**

16. In the **Exchange admin center**, the **mailboxes** tab in the **recipients** window is displayed by default. Select the **plus (+)** sign on the menu bar to create a new on-premises user account and user mailbox. In the drop-down menu that appears, select **User mailbox**.

17. In the **new user mailbox** window, enter the following information:

	- Alias: **Scotty**

	- Select **New user** option

	- First name: **Scotty** 

	- Last name: **Heyward**

	- Organizational unit: select **Browse**, and then under **Adatum.com** select **Users.** The **organizational unit** will fill in with **Adatum.com/Users**

	- User logon name: **Scotty** 

	- Domain: To the right of the **User logon name**, select the drop-down arrow in the domain field and select **XXYYZZa.xtremelabs.us** (where XXYYZZ is your unique UPN Name provided by your lab hosting provider)

	- Password and Confirm password: **Pa55w.rd**

	- Leave the **Require password change on next logon** check box blank

18. Select **Save**. Scotty Heyward should now appear in the list of mailboxes.

19. Leave the **Exchange admin center** open in Internet Explorer and do not close the Exchange Server VM. 


### Task 2: Create Group Accounts to Test Synchronization  

To test the manual, forced synchronization process, you will also set up several group scenarios to verify whether the forced synchronization function is working in Azure AD Connect. You will create two groups in Adatum’s on-premises environment – a security group and a distribution group (also known as a distribution list). 

Each group will be assigned several members. After the forced synchronization, you will validate that you can see the members for the security group but not the members of the distribution group. On-premises distribution groups are synced to Microsoft 365, but their members are not assigned as members in the group. Their individual user accounts are migrated, but not as members of distribution groups to which they are assigned.

1. Switch to the Domain Controller VM (LON-DC1). If necessary, log in as **adatum\administrator** and **Pa55w.rd**. 

2. If **Server Manager** is closed, then re-open it now. 

3. In **Server Manager**, select **Tools** at the top of the screen, and then in the drop-down menu select **Active Directory Users and Computers.**

4. You need to create a new group, which in this case will be a **Distribution group** (also known as a distribution list). In the console tree under **Adatum.com**, right-click **Research,** select **New,** and then select **Group**.  

5. In the **New Object - Group** window, enter the following information:

	- Group name: **Purchasing**

	- Group scope: **Universal**

	- Group type: **Distribution**

6. Select **OK**.  

7. In the **Research** OU, double-click the **Purchasing** group.  

8. In the **Purchasing Properties** window, in the **E-mail** box, type **Purchasing@adatum.com**.  

9. Select the **Members** tab, and then select the **Add** button.

10. In the **Select Users, Contacts, Computers, Service Accounts, or Groups** dialog box, in the **Enter the object names to select**, type the following names (type all three at once with a semi-colon separating them), and then select **Check Names**:  

	- **Ashlee Pickett** 

	- **Juanita Cook** 

	- **Morgan Brooks**  

11. Select **OK** to return to the **Purchasing Properties window.**

12. In the **Purchasing Properties** window, select **OK** to return to the **Active Directory Users and Computers** window.

13. Now create a second group, although this one will be a **Security group**. Repeat steps 4-12 to create a group with the following properties:

	- Group name: **Manufacturing**

	- Group scope: **Universal**

	- Group type: **Security**

	- Email: **Manufacturing@adatum.com**

	- Group members:

		- **Bernardo Rutter**

		- **Charlie Miller**

		- **Dawn Williamson**  

‎14. Leave the **Active Directory Users and Computers** window open for the next task.  

 
### Task 3: Change Group Membership to Test Synchronization  

This task sets up another scenario for testing whether the sync process is working in Azure AD Connect. In this task you will change the members of a group to see if they are reflected in the cloud once the group is synced. 

1. This task continues from where the previous task left off in the Domain Controller VM (LON-DC1). In the **Active Directory Users and Computers** window, in the console tree under **Adatum.com**, double-click the **Research** group.  

2. In the **Research Properties** window, select the **Members** tab to view the members of this group.  

3. For each of the following users, select the user in the **Members** window, select the **Remove** button to remove it from the group, and confirm the removal by selecting **Yes**. Once finished, select **OK.**

	- **Cai Chu**  

	- **Shannon Booth**  

	- **Tia Zecirevic**  

4. Leave the Domain Controller VM open as you will continue using it in the next task. <br/>

	‎**Important:** You should perform the next task immediately after completing this one so that Azure AD Connect doesn’t automatically synchronize the changes that you just made to the identity objects in the previous tasks.


### Task 4: Force synchronization   

In this task, you will force a sync between Adatum’s on-premises AD and Azure AD instead of waiting 30 minutes for Azure AD Connect to synchronize the identity objects. You must use PowerShell to perform a forced synchronization.

1. On the Domain Controller VM (LON-DC1), if the **Windows PowerShell** application is still open from the prior exercise, you MUST close it now.  <br/>

	‎**Important:** The reason for this step is that if Windows PowerShell was opened BEFORE the Azure AD Connect setup, the cmdlet **Start-ADSyncSyncCycle** that is used in step 3 will not be available and you will receive an error indicating that the cmdlet is not recognized when you attempt to run it. Therefore, it’s recommended that at this step, you close Windows PowerShell if it’s open and then restart it.  

2. At this point, Windows PowerShell should NOT be open. To open it, select the **magnifying glass (Search)** icon in the taskbar, type **PowerShell** in the Search box, and then in the menu, right-click on **Windows PowerShell** and select **Run as administrator**.  

3. Run the following command to manually run a sync cycle between Adatum’s on-premises AD and Azure AD. The **Delta** switch is used here so that only the updates are synchronized.   <br/>

	‎**Start-ADSyncSyncCycle -PolicyType Delta** <br/>
	
	‎**Note:** If for any reason the Domain Controller VM was restarted after the original full synchronization run, the Microsoft Azure AD Sync service may not have restarted. If this occurred, you’ll receive an error when you try to perform the forced sync above. If this occurs, you’ll need to start the Microsoft Azure AD Sync service first and then perform the forced synchronization. 

4. Once the synchronization process has successfully completed, minimize your PowerShell window (do not close it) and proceed to the next task. You will use PowerShell in the next task to validate some of the results of the directory synchronization.
  

### Task 5: Validate the Results of Directory Synchronization   

In this task, you will validate whether the changes you made earlier were synchronized from Adatum’s on-premises AD to Azure AD. You will validate the changes using the Microsoft 365 admin center, and then you’ll perform the same validations using Windows PowerShell. This gives you experience in validating synchronization using both the Microsoft 365 admin center GUI and PowerShell.

1. You should still be on your Domain Controller VM (LON-DC1) after finishing the prior task. If you need to log back in, log in as **adatum\administrator** with a password of **Pa55w.rd.**

2. If **Internet Explorer** is still open and a tab exists for the **Microsoft 365 admin center**, then select that tab now and proceed to the next step. Otherwise, enter **https://portal.office.com/** in the address bar to open the **Microsoft Office Home** page, log in as **Holly@M365xZZZZZZ.onmicrosoft.com** and password **Pa55w.rd**, and then on the **Microsoft Office Home** page, select **Admin**. 

3. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Users** and then **Active Users**. 

4. To validate the results of the synchronization, you need to see the **Sync Status** of each user. By default, this field is not displayed in the **Active users** list; therefore, you need to customize the **Active users** view to display this field.   <br/>

	‎Scroll to the far-right side of the window, and in the heading bar, select **Choose columns**. 

5. In the **Choose column** window, select the **Sync status** field and then select **Save.** 

6. In the **Active users** list, scroll to the right and verify the **Sync status** column appears. Hover your mouse over any of the **Sync status** icons to display the corresponding value.

7. Let’s begin by validating the synchronization results for the addition of the Scotty Heyward user accounts.   <br/>

	‎If you’ll recall, you created an identity mismatch situation in Task 1 where the email addresses in Scotty’s on-premises account and his cloud account each pointed to a different domain. Let’s see how this manifested itself in Microsoft 365 following the synchronization.   <br/>
	
	‎Locate **Scotty Heyward** in the **Active users** list (to quickly find Scotty, in the **Search** box that appears above list of users, enter **Scotty** and press Enter).  <br/>
	
	‎**Note:** You may need to wait up to 10 minutes before Scotty’s user accounts appears in the list. Continue to refresh the window until you see both his accounts (refreshing the page displays all the users, so you’ll have to enter Scotty again in the Search box). You cannot proceed until Scotty’s accounts appear. 

8. Because you created an identity mismatch situation, the forced synchronization process ended up creating two user accounts for Scotty in Microsoft 365 – one for his **onmicrosoft.com** account and one for his on-premises **xtremelabs.us** account. Each of Scotty’s accounts will have its own mailbox because the mailboxes will have different domains and routing addresses. In a normal situation in which the two accounts have the same UPN, you will end up with one user account that has multiple SMTP address in the email address property chain.  <br/>

	‎Once Scotty’s two accounts appear, scroll to the right in the **Active users** list to display the **Sync status** of each. You’ll notice that Scotty’s **onmicrosoft.com** account has a sync status of **In cloud**, while his on-premises **xtremelabs.us** account has a sync status of **Synced with Active Directory**. <br/>
	
	‎This is the result of the forked identity mismatch that we purposely created. To fix this situation, you will use soft matching to troubleshoot this problem in the next task.

9. Now let’s examine the synchronization results for the groups that you updated in Tasks 2 and 3.  <br/>

	‎In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Groups**, and then select **Groups** again.  

10. In the **Groups** list, verify that the **Purchasing** and **Manufacturing** groups appear. <br/>

	**Note:** You may need to wait up to 10 minutes before the two new groups appear. Continue to refresh the list until you see the groups.  

11. In the **Groups** list, locate the **Manufacturing** group. Scroll to the right and verify the value in the **Sync status** column. For this security group, hovering your mouse over the **Sync status** icon indicates that it was **Synced from on-premises**.

12. Select the **Manufacturing** group to open the **Manufacturing** group window. 

13. In the **Manufacturing** group window, note that it’s a mail-enabled security group that contains the three members that you assigned. Also note the message indicating that you can only manage this group in your on-premises environment using Active Directory users and groups (i.e. users and computers) or the Exchange admin center. 

14. In the **Manufacturing** group window, select the **Members** tab. Note that the group has no owner (the system did not automatically assign Holly Dickson as the group owner); this will be different from the Purchasing distribution group that you’ll validate next. Also note the three members that you assigned to it. Close the **Manufacturing** group window.

15. In the **Groups** list, select the **Purchasing** group. 

16. In the **Purchasing** group window, note that it’s a public group that contains only one member. Select the **Members** tab. Recall for the Manufacturing security group, no owner was assigned. For this distribution group, note that Holly Dickson was automatically assigned as the group owner, as well as being assigned as a group member. The reason for this is that while distribution groups are synchronized to Microsoft 365, their members are not. Therefore, the synchronization process automatically assigns the group owner as the only member of the distribution group that appears in the cloud.  

17. Now let’s examine these groups using Windows PowerShell. If **Windows PowerShell** is already open, then proceed to the next step; otherwise, type **Powershell** in the **Search** field on the taskbar and then right-click on the **Windows PowerShell** application and select **Run as administrator**. 

18. You should begin by running the following command that connects your PowerShell session to the Microsoft Online Service:  <br/>

	‎**Connect-MsolService**

19. In the **Sign in** dialog box, log in as **Holly@XXYYZZa.xtremelabs.us** (where XXYYZZ is your unique UPN Name provided by your lab hosting provider) and password of **Pa55w.rd**.   

20. Run the following command that retrieves all the Office 365 groups:   <br/>

	‎**Get-MsolGroup** 

21. In the list of groups that’s displayed, you should verify that you can see the **Research, Manufacturing,** and **Purchasing** groups. 

22. To verify that the group membership changes that you made in your on-premises Active Directory were synced to the **Research** group in Microsoft 365, select the **ObjectID** for the **Research** group in the prior list, right-click on it and select **Copy**.   <br/>

	‎Then run the following command to retrieve this group (where **&lt;&lt;ObjectID for Research group&gt;&gt;** is the ObjectID of the group; when you get to this point when entering the command, right-click and select **Paste** to paste in the ObjectID that you previously copied): <br/>
	
	‎**Get-MsolGroupMember -GroupObjectId &lt;&lt;ObjectID for Research group&gt;&gt;**

23. Verify the membership of the Research group does NOT contain the users who you earlier removed from the group in AD DS. The users who were removed from the group were:  

	- Cai Chu 

	- Shannon Booth  

	- Tai Zecirevic  

24. Run the following command to display the number of license units that have been consumed:  <br/>

	‎**Get-MsolAccountSku**  

25. Repeat steps 22-24 for the **Purchasing** distribution group. Note that it only lists Holly Dickson as the lone member of the group. This is because distribution group members are not synchronized in the cloud as part of the group; only the group owner is listed as a member of the group.

26. Repeat steps 22-24 for the **Manufacturing** security group. In the **Manufacturing** group, you added the following members, each of which you should see in the list of group members:  

	- Bernardo Rutter

	- Charlie Miller

	- Dawn Williamson

27. Once you have completed the validation steps, minimize your PowerShell window (do not close it) and proceed to the next task. You will use PowerShell in the next two tasks when troubleshooting the identity mismatch between Scotty Heyward’s two user accounts in Microsoft 365.
 

### Task 6: Use Soft Matching to Troubleshoot Identity Mismatch

When an identity mismatch (also known as identity forking) occurs between an on-premises account and its corresponding account in Azure AD, there are two different types of troubleshooting processes that you can perform to correct the situation. One is known as soft matching, and the other is referred to as hard matching. You will use soft matching in this task to fix an identity mismatch, and you will use hard matching in the next task to do the same.   

In this task you will soft match Scotty’s forked accounts. Soft matching uses the SMTP address to reunify the forked accounts. Soft matching usually works, unless the immutable ID has been altered, in which case you must perform a hard match to fix the issue. Hard matching is explained in the next task.

1. You should still be on your Domain Controller VM after finishing the prior task. If you need to log back in, log in as **adatum\administrator** with a password of **Pa55w.rd.**

2. The first thing to do is to stop the Azure AD synchronization service. Select the magnifying glass (Search) icon on the taskbar and enter **services.** In the menu, select the **Services** desktop app.

3. In the **Services** window, scroll down to **Microsoft Azure AD Sync**, select it, and then select **Stop** in the left-hand pane.

4. Once the service has stopped, minimize the **Services** window. You will return to this window later in this task to start the sync service.

5. You then need to disable Azure AD synchronization while you make the necessary corrections to Scotty’s on-premises and Microsoft 365 accounts. This is done using PowerShell commands.   

	- If Windows PowerShell is still open from the previous task, then proceed to step 6.   

	- However, if you closed PowerShell during the previous task, then open it now and run the following command: <br/> 
	
		‎**Connect-MsolService**  <br/>
		
		‎When you enter this command, you will be prompted to log in. Log in as **Holly@XXYYZZa.xtremelabs.us** (where XXYYZZ is your unique UPN Name provided by your lab hosting provider) and password of **Pa55w.rd**.

6. In PowerShell, run the following command to disable directory synchronization: <br/>

	‎**Set-MsolDirSyncEnabled -EnableDirSync $false**  <br/>
	
	‎When prompted to continue, select **Yes**.  <br/>
	
	‎**Note:** The command that you run in this step turns off Directory Synchronization, which if left turned Off, would trigger all synchronized identities to be changed to cloud-only identities. Obviously, this is not something you would do in a real-world environment if you want to maintain synchronized accounts. Directory Synchronization is turned off here to that you can make the necessary corrections to Scotty’s accounts, at which time you will enable synchronization so that you can run a forced sync to apply your changes. It’s very important that you understand the implications of turning off Directory Synchronization as well as the rare cases such as this when you would need to do so.  
	
7. There’s an email address associated with Adatum’s accepted domain that you must add as an email alias for Scotty’s on-premises and Microsoft 365 accounts. To get this address, in **Internet Explorer**, navigate to the **Microsoft 365 admin center** tab (if you’re not already on it), and then proceed to the next step. If you previously closed the Microsoft 365 admin center, then enter **https://portal.office.com/** in the address bar to open the **Microsoft Office Home** page, log in as **Holly@XXYYZZa.xtremelabs.us** and password **Pa55w.rd**, and then on the **Microsoft Office Home** page, select **Admin**. 

8. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Show all**. Scroll down to the **Admin centers** section and select **Exchange** to open the Exchange admin center for Exchange Online.

9. In the **Exchange admin center**, in the left-hand navigation pane, select **mail flow**. 

10. On the **mail flow** page, select the **accepted domains** tab. Locate the **M365xZZZZZZ.mail.onmicrosoft.com** accepted domain. You will need to add an email address for Scotty using this domain in both his on-premises and Microsoft 365 accounts. 

11. In the **Exchange admin center**, in the left-hand navigation pane, select **recipients**. 

12. Before we look at the forked situation with Scotty Heyward’s email accounts, let’s begin by looking at a normal situation in which a user with two accounts (cloud and on-premises) that have the same UPN end up with one cloud user account that has multiple SMTP addresses in the email address property chain. <br/>

	‎In the **recipients** page, in the list of mailboxes, select **Holly Dickson** and then select the **pencil (edit)** icon on the menu bar.

13. In the **Holly Dickson** account window, select **email address** in the left-hand navigation pane.

14. In the **email address** list for Holly, locate the two SMTP addresses:

	- The primary email address is the mailbox where **SMTP** is capitalized and bolded. This email address points to her on-premises mailbox at **Holly@XXYYZZa.xtremelabs.us**. 

	- Then notice her additional email address, where smtp is in lower-case and is not bolded. This email alias points to her Microsoft 365 cloud mailbox of **Holly@M365xZZZZZZ.onmicrosoft.com**.

15. Select **Cancel** to return to the list of recipient mailboxes.

16. So now that you know what a normal, synchronized account looks like, let’s take a look at Scotty’s situation. As you’ll recall from Task 5, the identity mismatch scenario that you created resulted in two accounts for Scotty in the Microsoft 365 **Active users** list, and each of Scotty’s accounts will have its own mailbox because the mailboxes will have different domain and routing addresses.   <br/>

	‎In the **Exchange admin center**, in the **recipients** page and on the **mailboxes** tab, once the account for **Scotty Heyward** appears, select it and then select the **pencil (edit)** icon on the menu bar.  <br/>
	
	‎**Note:** You may need to wait several minutes before Scotty’s account appears in the mailbox list. Continue to refresh the window until you see his account. **You cannot perform this step until Scotty’s account appears**. If Scotty mailbox has not yet appeared, this may be a good time to take a short break.  

17. In the **Scotty Heyward** account window, select **email address** in the left-hand navigation pane. Scotty’s account differs from Holly’s normal account in two ways:

	- Scotty has a primary SMTP address (bold and upper-case **SMTP**) but not an additional smtp email alias. 

	- Scotty’s primary SMTP address is his **onmicrosoft.com** cloud address. This is different from the normal account for Holly Dickson in which her primary SMTP address was her on-premises **xtremelabs.us** address. Holly also has an email alias that references her **onmicrosoft.com** address.

18. To correct this identity mismatch situation, you need to:

	- Update Scotty’s on-premises email addresses to include the email addresses from his Microsoft 365 account, change his primary SMTP address to the xtremelabs.us domain, and add an additional alias for the mail.onmicrosoft.com domain.

	- Delete the second Microsoft 365 user account that was created for Scotty by the sync process. This account points to the xtremelabs.us domain, and if you attempt to change Scotty’s primary SMTP address to the xtremelabs.us domain while this second user account exists, it will result in an error when you attempt to save the address change.

	- Update Scotty’s Microsoft 365 email addresses to include the email addresses from his on-premises account, change the primary SMTP address to this xtremelabs.us address, and add an additional alias for the mail.onmicrosoft.com account.<br/>
	
	By making these changes, the email addresses for Scotty’s on-premises and Microsoft 365 accounts should be identical. Then when you do a force sync it will synchronize the on-premises and Microsoft 365 addresses together in Scotty’s one Microsoft 365 account.   <br/>
	
	‎You are currently in the Domain Controller VM (LON-DC1) looking at the **Exchange admin center** for Exchange Online. You are in the **email address** tab for Scotty’s Microsoft 365 account. This displays the following two email addresses:

	- **SIP** type – **Scotty@M365xZZZZZZ.onmicrosoft.com**

	- **SMTP** type - **Scotty@M365xZZZZZZ.onmicrosoft.com** 
	
	In the next steps, you will add these two addresses to Scotty’s on-premises account.

19. Switch to the **Exchange Server VM** (LON-EX1).

20. In the **Exchange Server VM**, in **Internet Explorer**, it should still be displaying the on-premises **Exchange admin center.** If the Exchange admin center was closed, then select the **Start** button, and in the **Start** menu, select **Microsoft Exchange Server 2019**, and then select **Exchange Administrative Center.**

21. In the **Exchange admin center**, if necessary, select **recipients** in the left-hand navigation pane. The **mailboxes** tab will display by default.

22. In the **mailboxes** tab, select **Scotty Heyward** and then select the **pencil (edit)** icon.

23. In the **Edit User Mailbox** window for **Scotty Heyward**, select **email address** in the left-hand navigation pane.

24. The **email address** tab displays just one mailbox for Scotty, which is his primary SMTP address of **Scotty@adatum.com**. You need to change this to Adatum’s accepted domain of **xtremelabs.us**, as well as add in his email addresses from his Microsoft 365 account and the mail.onmicrosoft.com accepted domain; however, before you can do so, you must clear the check box next to the **Automatically update email addresses based on the email address policy applied to this recipient** option. If you leave this option selected, you will be unable to change the primary SMTP email address in the next step.

25. In the **email address** tab, select the **pencil (edit)** icon to edit the selected SMTP email address. 

26. In the **email address** dialog box enter **Scotty@XXYYZZa.xtremelabs.us** (where XXYYZZ is your unique UPN Name provided by your lab hosting provider) in the **Email address** field and then select **OK**.  <br/>

	‎This email address that points to the primary accepted domain for Adatum (xtremelabs.us) now appears as the primary SMTP address for Scotty’s on-premises account. Later in this task, you will also change Scotty’s primary SMTP address on his Microsoft 365 to this xtremelabs.us address.

27. This returns you to the **email address** tab for Scotty’s on-premises account. You must then add in the two email addresses from Scotty’s Microsoft 365 account (the SIP and SMTP types), as well as the address for the mail.onmicrosoft.com domain. Select the **plus (+)** sign to add a new email address.

28. Let’s begin by adding the **SIP** email address. In the **new email address** window, under **Email address type**, select the option next the field for entering a custom address type. Then in the field, enter **SIP**. 

29. In the **Email address** field, you must enter the email address associated with the **SIP** type from Scotty’s Microsoft 365 email address list.   <br/>

	‎Enter **Scotty@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) and then select **OK**.

30. You now need to create another on-premises email address for Scotty that matches his second email address from his Microsoft 365 account. This is currently his primary SMTP address in Microsoft 365. However, since both accounts must have the same primary SMTP address, and since the xtremelabs.us domain is Adatum’s primary domain, you will add this address as an email alias for his on-premises account.  <br/>

	‎On the email address tab, select the **plus (+)** sign to add a new email address.

31. In the **new email address** window, under **Email address type**, leave the default SMTP address type selected. 

32. In the **Email address** field, you must enter the email address associated with the **SMTP** type from Scotty’s Microsoft 365 email address list.  <br/>

	‎Enter **Scotty@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) and then select **OK**.

33. You now need to create an email alias that matches the address of the xtremelabs.us accepted domain. On the email address tab, select the **plus (+)** sign to add a new email address.

34. In the **new email address** window, under **Email address type**, leave the default SMTP address type selected. 

35. In the **Email address** field, you must enter the mail.onmicrosoft.com email address that you earlier found by querying the accepted domains in the Exchange admin center for Exchange Online. <br/>

	‎Enter **Scotty@M365xZZZZZZ.mail.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) and then select **OK**.

36. On the **email address** tab for Scotty, you should now see the following four email addresses (the SIP address is for Teams, the SMTP address is Scotty’s primary email address, and the two smtp address are email aliases):

	- **SIP** - **Scotty@M365xZZZZZZ.onmicrosoft.com**

	- **SMTP – Scotty@XXYYZZa.xtremelabs.us**

	- smtp - Scotty@M365xZZZZZZ.mail.onmicrosoft.com

	- smtp - Scotty@M365xZZZZZZ.onmicrosoft.com <br/>
	
	Select **Save**.

37. Switch to the **Domain Controller VM** (LON-DC1).

38. In **Internet Explorer**, select your **Microsoft 365 admin center** tab.

39. If you’re on the **Active users** page, then refresh it; otherwise, navigate to **Active users**.

40. In the **Search** box, enter **Scotty.** This should display both of Scotty’s Microsoft 365 accounts. In the next few steps, you want to delete the second user account that was created by the sync process, which is the **xtremelabs.us** account. You need to do this so that you can add an email address to Scotty’s account that uses the xtremelabs.us domain; however, the system will prohibit you from adding this email address when this second account exists that already points to the xtremelabs.us domain.

41. In the **Active users** list, select the **Scotty Heyward** account whose username is **Scotty@XXYYZZa.xtremelabs.us**, select the **More options** icon to the left of the username (the three dots stacked on top of each other), and then select **Delete user.** 

42. On the **Delete this user?** page, select **Delete user**. Once the user is deleted, select **Close.**  <br/>

	‎**Note:** If the deletion fails, then you will need to refresh the **Active users** list as the user’s sync status must be “**In cloud**”.

43. You now need to update Scotty’s Microsoft 365 account to contain the email address that was assigned to his on-premises account. If you’ll recall, Scotty’s on-premises account originally had only one email address, which was his primary **SMTP** address of **Scotty@Adatum.com**. Previously in this task you changed th primary SMTP address of his on-premises account to **Scotty@XXYYZZa.xtremelabs.us.** You will need to do the same here for his Microsoft 365 account.   

44. In **Internet Explorer**, select the **Exchange admin center** tab if you’re not already there. 

45. Select **Scotty Heyward** and then select the **pencil (edit)** icon in the menu bar.

46. In Scotty’s user account window, select the **email address** tab in the left-hand navigation pane.

47. In the **email address** tab, select the **plus (+)** sign to add a new address. 

48. In the **new email address** window, under **Email address type**, leave the default SMTP address type selected. 

49. In the **Email address** field, enter **Scotty@XXYYZZa.xtremelabs.us** (where XXYYZZ is your unique UPN Name provided by your lab hosting provider).

50. Select the **Make this the reply address** check box and then select **OK**.   <br/>

	‎**Note:** Setting this check box will make this smtp address the primary SMTP address, and it will change the current primary SMTP address to an email alias. 

51. You now need to create another email alias that matches the address of the xtremelabs.us accepted domain. On the email address tab, select the **plus (+)** sign to add a new email address.

52. In the **new email address** window, under **Email address type**, leave the default SMTP address type selected. 

53. In the **Email address** field, you must enter the mail.onmicrosoft.com email address that you earlier found by querying the accepted domains in the Exchange admin center for Exchange Online.   <br/>

	‎Enter **Scotty@M365xZZZZZZ.mail.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) and then select **OK**.

54. On the **email address** tab for Scotty, you should now see the following email addresses(the SIP address is for Teams, the SMTP address is Scotty’s primary email address, and the two smtp address are email aliases):

	- **SIP** - **Scotty@M365xZZZZZZ.onmicrosoft.com**

	- **SMTP – Scotty@XXYYZZa.xtremelabs.us**

	- smtp - Scotty@M365xZZZZZZ.mail.onmicrosoft.com

	- smtp - Scotty@M365xZZZZZZ.onmicrosoft.com <br/>
	
	Select **Save**.<br/>
	
	**Note:** You have now made the necessary corrections to fix the identity mismatch between the email addresses in Scotty’s on-premises and Microsoft 365 accounts. Proceed to the final steps to force synchronize the accounts. 

55. At the start of this task, you disabled Azure AD synchronization while you made the corrections to Scotty’s accounts. You must now enable synchronization so that you can run a force sync.   <br/>

	‎Maximize your PowerShell window and run the following command to enable directory synchronization:  <br/>
	
	‎**Set-MsolDirSyncEnabled -EnableDirSync $true**  <br/>
	
	‎When prompted to continue, select **Yes**.  

56. Select the **Services** icon on your taskbar to return to the **Services** window. 

57. In the **Services** window, scroll down to **Microsoft Azure AD Sync**, select it, and then select **Start** in the left-hand pane. Once the service has started, close the **Services** window.

58. You must then synchronize the on-premises email addresses for Scotty with his Microsoft 365 account by running a force sync. Since all of the email addresses match up between the on-premises account and the Microsoft 365 account, the synchronization process will map the two accounts together for synchronization purposes.  <br/>

	‎In your **Domain Controller VM**, in **Windows PowerShell** (which should still be open), run the following command that executes a force sync on the server that is running Azure AD Connect (for our lab, this is your Domain Controller):   <br/>
	
	‎**Start-ADSyncSyncCycle -PolicyType Delta**  <br/>
	
	‎**Note:** You may need to wait up to 10 minutes for the synchronization process to complete.  

59. You now want to see if the identity mismatch was corrected in Scotty’s Microsoft 365 account. Navigate to the **Microsoft 365 admin center**, select **Active users**, and in the **Search** field, enter **Scotty** to display Scotty Heyward’s user account.   <br/>

	‎You should only see one user account, and if you select it, you’ll see the xtremelabs.us address listed as Scotty’s primary email address, and you’ll see his onmicrosoft.com and mail.onmicrosoft.com addresses listed as email aliases. This user account should also have a sync status of “Synced from on-premises”.

60. Leave your Domain Controller VM open, as well as Windows PowerShell, which will be used in the next task.
 

### Task 7: Use Hard Matching to Troubleshoot Identity Mismatch  

If you’ll recall, you earlier created identity mismatch situations where the email addresses in Holly Dickson and Scotty Heyward’s on-premises accounts and their cloud accounts each pointed to a different domain (Exercise 1, Task 4 for Holly, and Exercise 2, Task 1 for Scotty). In the prior task where you reviewed the results of the forced synchronization, you verified that the forced synchronization process ended up creating two user accounts for Scotty in Microsoft 365 – one for his **onmicrosoft.com** account and one for his on-premises **xtremelabs.us** account. Each of Scotty’s accounts had its own mailbox because the mailboxes had different domains and routing addresses. In a normal situation in which the two accounts have the same UPN, you will end up with one user account that has multiple SMTP address in the email address property chain.  

‎When verifying the results of the forced synchronization in the earlier task, you noticed that Scotty’s **onmicrosoft.com** account had a sync status of **In cloud**, while his on-premises **xtremelabs.us** account had a sync status of **Synced with Active Directory**. This was the result of the forked identity mismatch that we purposely created. You fixed this situation for Scotty in the prior task using soft matching.   

‎Since the forced synchronization process created that same two user account situation for Holly Dickson as it did for Scotty Heyward, in this task you will use hard matching to fix the forked identity mismatch that occurred for Holly.

‎Hard matching is required to resolve a user or group that has not only been forked, but its Immutable ID has been altered, since soft matching can’t fix this condition. With hard matching, you must replace the existing cloud **Immutable ID** with the on-premises **objectGuid** and then force a sync.

**Important:** The reason behind setting the Immutable ID in the cloud is because it’s a reference point for syncing accounts. If there is no immutable ID for a cloud account, it will not distinguish the similarities between the on-premises and cloud objects. The Immutable ID is an anchor point for synchronization.

1. On your **Domain Controller**, navigate to your **Windows PowerShell** session.

2. You must first retrieve the **objectGuid** for Holly Dickson’s on-premises user account. The ObjectGuid is the source address for the user account and without it, you won’t be able to fix the mismatch between the ImmutableID of her cloud account and the objectGUID of her on-premises account.  <br/>

	‎In Windows PowerShell, run the following command to retrieve the **ObjectGuid** for Holly Dickson’s on-premises user account:  <br/>
	
	‎**Get-ADUser -Identity “holly”|Get-ADObject -properties “objectGuid”**  

3. Open **Notepad**, then copy the **objectGUID** and paste it in **Notepad.**

4. Run the following command to get the object ID of Holly’s cloud user account (don’t forget to replace ZZZZZZ with the tenant ID provided by your lab hosting provider):  <br/>

	**Get-Msoluser -UserPrincipalName “holly@M365xZZZZZZ.onmicrosoft.com” |Select-Object -Property “ObjectID”**  <br/>
	
	‎**Note:** If you compare the object ID from this cloud account with the objectGuid that you earlier retrieved from Holly’s on-premises account, you’ll set that they don’t match. In the next steps you will perform a hard match to get them in sync.

5. Run the following command to change the Immutable ID on Holly’s cloud account to the same value as her on-premises objectGuid so that synchronization can occur account (don’t forget to replace ZZZZZZ with your unique tenant ID provided by your lab hosting provider):  <br/>

	‎**Set-Msoluser -UserPrincipalName “holly@M365xZZZZZZ.onmicrosoft.com” -ImmutableID “&lt;paste in the objectGuid that you copied earlier to Notepad&gt;**  

6. Run the following command to force AD Connect to synchronize only the changes that were made:  <br/>

	‎**Start-ADSyncSyncCycle -PolicyType Delta**  

7. After 10 minutes, navigate to the Microsoft 365 admin center and confirm that Holly has only one account.

8. Leave your Domain Controller VM open for use in the next exercise.


# Proceed to Exercise 3
 
