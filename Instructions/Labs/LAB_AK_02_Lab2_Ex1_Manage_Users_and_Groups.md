# Module 2 - Lab 2 - Exercise 1 - Manage Users and Groups 

In the following lab exercise you will take on the role of Holly Spencer, Adatum Corporation’s Enterprise Administrator. In this lab, you will perform several user and group management functions within Microsoft 365. You will begin by creating a Microsoft 365 user account for Holly. You will create two Office 365 groups and assign existing Microsoft 365 users as members of those groups. You will then delete one of the groups and then use PowerShell to recover the deleted group.

**Note:** The VM environment provided by your lab hosting provider comes with ten existing Microsoft 365 user accounts, as well as a number of existing on-premises user accounts. Several of these existing user accounts will be used throughout the labs in this course. This will save you from having to perform the tedious task of creating user accounts, which is typically not a task performed by Enterprise Administrators. You will, however, create Holly Spencer's user account, since having more than one Global admin is a best practice, and it does provide you with the experience of creating a Microsoft 365 user account in case you are not familiar with the process.


### Task 1 - Create a User Account for Adatum's Enterprise Administrator

Holly Spencer is Adatum’s Enterprise Administrator. Since a Microsoft 365 user account has not been set up for her, you initially signed into Microsoft 365 as the MOD Administrator account (the default Global admin) in the previous lab. In this task, you will continue in your role as the MOD Administrator, during which you will create a Microsoft 365 user account for Holly, and you will assign her user account the Microsoft 365 Global Administrator role, which gives her the ability to perform all administrative functions within Microsoft 365. Following this task, you will perform all remaining labs using Holly's persona. 

**Important:** As a best practice in your real-world deployments, you should always write down the first global admin account’s credentials (in this lab, the MOD Administrator) and store it away for security reasons. This account is a non-personalized identity that owns the highest privileges possible in a tenant. It is **not** MFA activated (because it is not personalized) and the password for this account is typically shared among several users. As a result, this first global admin is a perfect target for attacks, so it’s always recommended to create personalized service admins and keep as few global admins as possible. For those global admins that you do create in your real-world deployments, they should each be mapped to a single identity, and they should each have Multi-Factor Authentication (MFA) enforced.

1. On the LON-DC1 VM, the **Microsoft 365 admin center** should still be open in Internet Explorer from the prior lab, and you should be signed into Microsoft 365 as the **MOD Administrator**. 

2. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Users** and then select **Active users**. 

3. In the **Active users** list, you will see the list of existing user accounts that were created for you by your lab hosting provider. In this task, you are taking on the role of the MOD Administrator, and as such, you must create a user account for Holly Spencer, who is Adatum's new Enterprise Administrator. In doing so, you will assign Holly the Microsoft 365 role of Global Administrator, which gives Holly global access to most management features and data across Microsoft online services. 

4. In the **Active Users** window, select **Add a user**. 

5. In the **Set up the basics** window, enter the following information:

	- First name: **Holly**

	- Last name: **Spencer** 

	- Display name: When you tab into this field, **Holly Spencer** will appear.

	- Username: When you tab into this field, **Holly** will appear; leave this as the username<br/>
	
		‎**IMPORTANT:** To the right of the **Username** field is the domain field. It will be prefilled with the custom **XXYYZZa.xxxCustomDomainxxx.xxx** on-premises domain; however, you MUST select the drop-down arrow and select the **M365xZZZZZZ.onmicrosoft.com** cloud domain instead (where ZZZZZZ is your tenant ID provided by your lab hosting provider).<br/>
	
		After configuring this field, Holly’s username should appear as:<br/>

		**Holly@M365xZZZZZZ.onmicrosoft.com**  
	
	- Password settings: select the **Let me create the password** option

	- Password: **Pa55w.rd** 

	- Uncheck the **Require this user to change their password when they first sign in** check box 

6. Select **Next**.

7. In the **Assign product licenses** window, enter the following information:

	- Select location: **United States**

	- Licenses: Under **Assign user a product license**, select **Office 365 E5** 

8. Select **Next.**

9. In the **Optional settings** window, select the drop-down arrow to the right of **Roles.** 

10. In the **Roles information** that appears, select **Admin center access**. By doing so, the most commonly used Microsoft 365 administrator roles are displayed below this option and are available to be assigned. 

	**Note:** All of the admin roles will be displayed if you select **Show all by category**. For Holly, you do not need to view all the admin roles by category, since Holly will be assigned the Global admin role that appears in the list of most commonly used roles.

11. Select **Global admin** and then select **Next**.

12. On the **You’re almost done – review and finish adding** window, review your selections. If anything needs to be changed, select the appropriate **Edit** link and make the necessary changes. Otherwise, if everything is correct, select **Finish adding**. 

13. On the **Holly Spencer has been added** page, select **Close.** If a window appears asking whether you want to respond to a survey on your experience, select **Cancel**.

14. Remain logged into the domain controller VM with the Microsoft 365 admin center open in your browser for the next task.


### Task 2 – Create and Manage Groups  

After completing the previous task, you should still be signed into the **Microsoft 365 admin center** as the **MOD Administrator** account. In this task, you will begin implementing Adatum’s Microsoft 365 pilot project as Holly Spencer, Adatum’s new Enterprise Administrator. Therefore, you will begin this task by logging out of Microsoft 365 as the MOD Administrator and you will log back in as Holly.<br/>

In this task, you will create two new groups and then manage the groups by assigning users to them. One group will be an Office 365 group and the other a Security group; this will enable you to see some of the differences in the two types of groups. After creating the groups, you will then delete one of them. This will set up the next task, which examines how to recover a deleted group using PowerShell.

1. On the Microsoft 365 admin center tab, select the user icon for the **MOD Administrator** (the **MA** circle) in the upper right corner of your browser, and in the **My account** pane, select **Sign out.** <br/>
	
	**Important:** When signing out of one user account and signing in as another, you should close all your browser tabs except for your current tab. This is a best practice that helps to avoid any confusion by closing the windows associated with the prior user. Take a moment now and close all other browser tabs. 
	
2. In Internet Explorer browser, navigate to **https://portal.office.com**. 

3. In the **Pick an account** window, only the admin account that you just logged out from appears. Select **Use another account**. 

4. In the **Sign in** window, enter **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider). Select **Next**.

5. In the **Enter password** window, enter **Pa55w.rd** and then select **Sign in**.

6. If a **Get your work done with Office 365** window appears, select the **X** to close it. 

7. In the **Office 365 home page**, select **Admin** to open the Microsoft 365 admin center.

8. If a **Good morning/afternoon/evening Holly Spencer** window appears, select **Get started**.

9. On the LON-DC1 VM, in the **Microsoft 365 admin center**, select **Groups** in the left-hand navigation pane, and then under it, select **Groups**. 

10. In the **Groups** page, select **Add a group**.  

11. In the **Choose a group type** window, select **Office 365 (recommended)** and then select **Next**. 

12. In the **Set up the basics** window, enter **Inside Sales** in the **Name** field, and then enter **Collaboration group for the Inside Sales team** in the **Description** field. Select **Next**.

13. In the **Edit settings** window, enter **insidesales** in the **Group email address** field. Under the **Privacy** section, leave the default setting of **Public** and then select **Next**.

14. In the **Assign Owners** window, you will assign Allan Deyoung and Patti Fernandez as owners of this group. 
	- Enter **Allan** in the **Owners** field. In the drop-down menu that appears, select **Allan Deyoung**. 
	- Enter **Patti** in the **Owners** field. In the drop-down menu that appears, select **Patti Fernandez**. 
	- Select **Next**.

15. In the **Review and finish adding group** window, review the content that you entered. If everything is correct, select **Create group**; otherwise, select **Back** and fix anything that needs correction (or select **Edit** under the specific area that needs adjustment).

16 Select **Close**. This returns you to the **Groups** page. Note that your group may not immediately appear in the list as it can take a few minutes for a new group to appear. In this lab environment, our experience has shown that the group should appear by the time you finish adding the next group.

17. Repeat steps 10-16 to add a new group with the following information:

	- Group type: **Security**

	- Name: **IT Admins**

	- Description: **IT administrative personnel**<br/>

	**Note:** there is no owner, email address, or privacy setting for Security groups

18. If either of the two new groups do not appear in the **Groups** list, wait a minute or so and then select the **Refresh** option on the menu bar (to the right of **Add a group**). Both groups should now appear.

	**Note:** The IT admins group does not have a group email address because it's a Security group. Two additional group types are Mail-enabled Security groups and Distribution groups. We did not use either of these group types in this lab because it can take up to an hour for these two types of groups to appear in the Groups list; whereas, Office 365 groups and Security groups usually take just a matter of minutes to appear. 

19. You’re now ready to add members to the groups. In the list of **Groups**, select the **Inside Sales** group, which opens a window for the group. 

20. In the **Inside Sales** group window, select the **Members** tab.

21. Under the **Members** section, you can see that there are zero (0) members. Select **View all and manage members** to add members to the group. 

22. In the **Inside Sales** group window, select **Add members**. This displays the list of current users.

23. In the list of users, select **Diego Siciliani** and **Lynne Robbins** and then select **Save**. 

24. Select **Close**. This displays the list of users for this group. Select **Close** again. 

25. On the **Inside Sales** window, Diego and Lynne should now appear as members of the group. Select the **X** in the upper right-hand corner to close the window. 

26. Repeat steps 19-25 to add **Isaiah Langer**, **Megan Bowen**, and **Nestor Wilke** as members of the **IT admins** group.

27. You now want to test the effect of deleting a group. In the list of **Groups,** select the vertical ellipsis icon (**More actions**) that appears to the right of the **Inside Sales** group. In the menu box, select **Delete group**. 

28. In the **Delete group** window, select the **Delete** button.

29. Once the group is deleted, select **Close**. 

30. This will return you to the list of **Groups** in the **Microsoft 365 admin center**. The **Inside Sales** group should no longer appear. If the Inside Sales group still displays, wait a couple of minutes and then select the **Refresh** option on the menu bar. The updated **Groups** list should no longer include the Inside Sales group.

31. To verify whether deleting this group affected any of its members, select **Users** and then **Active Users** in the left-hand navigation pane. 

32. In the **Active users** list verify that the two members of the Inside Sales group, **Diego Siciliani** and **Lynne Robbins**, still appear in the list of users. This verifies that deleting a group does not delete the user accounts that were members of the group.

33. Remain logged into the domain controller VM with the Microsoft 365 admin center open in your browser for the next task.


### Task 3 – Recover Groups using PowerShell 

In this task, you will use Windows PowerShell to recover the Inside Sales group that you previously deleted. To use Windows PowerShell to perform this Azure AD-related task, the Windows Azure Active Directory PowerShell Module must be installed. 

**NOTE:** You should have installed the Windows Azure Active Directory PowerShell Module in the prior lab.   

1. If you’re not logged into the LON-DC1 VM as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. If Windows PowerShell is still open from the previous lab, select the **Windows PowerShell** icon on the taskbar; otherwise, you must open an elevated instance of Windows PowerShell just as you did before. Maximize your PowerShell window.

3. In **Windows PowerShell**, type the following commands (press Enter after each command):

	- You must run the following command to connect with an authenticated account to use Active Directory cmdlet requests: <br/> 
	
		‎**Connect-AzureAD**   

	- A new window will appear requesting your credentials. Sign in using Holy's Microsoft 365 account of **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) and **Pa55w.rd** as the Password.  

	- You should then run the following command to display the repository of deleted groups (this should display the **Inside Sales** group that you earlier deleted):<br/>  
	
		‎**Get-AzureADMSDeletedGroup**   

	- Before you can restore this deleted group, you must first copy the Object ID of the Inside Sales group that appears in the table of deleted groups. When you perform the next command to restore the group, you will use this ID to identify the group that you want restored. <br/>
	
		To copy the ID, select the entire ID and then press Ctrl-C.

	- You should then run the following command to retrieve and restore the deleted group whose Object ID matches the value you enter:<br/>  

		‎**Note:** Replace the {objectId} in the following command with the ID number for the Inside Sales group that you copied in the prior step. When you enter the following Restore command and you get to the point of pasting in the {objectId} parameter, simply right-click to paste in the Id. Then press Enter to run the command. **NOTE:** If nothing happens when you hit Enter, then extraneous hidden characters may have been pasted in following the object ID. If this occurs, hit the Delete key a couple of times, and then press Enter again.  <br/>

		‎**Restore-AzureADMSDeletedDirectoryObject -Id {objectId}**  
		
4. Leave your Windows PowerShell window open for the next exercise; simply minimize the Windows PoweShell window for now.

5. Validate that the **Inside Sales** group has been recovered. To do this, go to the **Microsoft 365 Admin Center** in your Internet Explorer browser, select **Groups** from the left-hand navigation pane, and then under it select **Groups** to display the list of groups. 

6. Verify that the **Inside Sales** group has been restored and is present in the list of groups. If the Inside Sales group does not appear, wait a minute or two and then select the **Refresh** icon to the right of the URL in Internet Explorer.

7. You now want to verify that the recovery process correctly updated the group's membership. From the **Groups** windows, select the **Inside Sales** group.

8. In the **Inside Sales** window, select the **Members** tab. **Diego Siciliani** and **Lynne Robbins** should appear as members of the group.

9. Close the **Inside Sales** window.

10. Leave your browser windows open so that they’re ready for the next task. 


# End of Lab 2
