# Module 2 - Lab 2 - Exercise 1 - Manage Users and Groups 

In the following lab exercise you will take on the role of Holly Spencer, Adatum Corporation’s Enterprise Administrator. In this lab, you will add several users and groups that will be used throughout the remainder to the labs in this course. You will also install the Windows PowerShell module, which enables you to access Azure Active Directory through PowerShell. You will then use PowerShell to perform several group management tasks in Microsoft 365.


### Task 1 - Create Office 365 User Accounts 

Holly Spencer is Adatum’s Enterprise Administrator. Since she doesn’t have a personal Microsoft 365 user account set up for herself, Holly initially signed into Microsoft 365 as the default Microsoft 365 MOD Administrator account. In this task, she will create a Microsoft 365 user account for herself, and she will assign her user account the Microsoft 365 Global Administrator role, which gives her the ability to perform all administrative functions within Microsoft 365.

‎You will then create several additional user accounts in the Microsoft 365 admin center, each of which you will later add to new security groups that you’ll also create. While Enterprise Admins typically do not add user accounts, this is a one-time task that you need to perform to prepare Adatum’s test environment for future lab exercises in this course.

**Important:** As a best practice in your real-world deployments, you should always write down the first global admin account’s credentials (in this lab, the MOD Administrator) and store it away for security reasons. This account is a non-personalized identity that owns the highest privileges possible in a tenant. It is **not** MFA activated (because it is not personalized) and the password for this account is typically shared among several users. Therefore, this first global admin is a perfect target for attacks, so it’s always recommended to create personalized service admins and keep as few global admins as possible. For those global admins that you do create, they should each be mapped to a single identity, and they should each have MFA enforced.

1. On the LON-DC1 VM, the **Microsoft 365 admin center** should still be open in Internet Explorer from the prior lab. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Users** and then select **Active users**. 

2. In the **Active users** list, you will see that the only user is the default **MOD Administrator** account. Since you’re taking on the role of Holly Spencer in this lab scenario, you will create a user account for yourself, and you will assign yourself the Microsoft 365 role of Global Administrator. You will also create several other user accounts that will be used throughout the remaining labs in this course.

3. In the **Active Users** window, select **Add a user**. 

4. In the **Set up the basics** window, enter the following information:

	- First name: **Holly**

	- Last name: **Spencer** 

	- Display name: When you tab into this field, **Holly Spencer** will appear.

	- Username: When you tab into this field, **Holly** will appear; leave this as the username<br/>
	
		‎**IMPORTANT:** To the right of the **Username** field is the domain field. It will be prefilled with the custom **XXYYZZa.xxxCustomDomainxxx.xxx** on-premises domain; however, you MUST select the drop-down arrow and select the **M365xZZZZZZ.onmicrosoft.com** cloud domain instead (where ZZZZZZ is your tenant ID provided by your lab hosting provider).<br/>
	
		After configuring this field, Holly’s username should appear as:<br/>

		**Holly@M365xZZZZZZ.onmicrosoft.com**  
	
	- Password settings: select the **Let me create the password** option

	- Password: **Pa55w.rd** 

	- Uncheck the **Require this user to change their password when they first sign in** checkbox 

5. Select **Next**.

6. In the **Assign product licenses** window, enter the following information:

	- Select location: **United States**

	- Licenses: Under **Assign user a product license**, select **Office 365 E5** 

7. Select **Next.**

8. In the **Optional settings** window, select the drop-down arrow to the right of **Roles.** 

9. In the **Roles information** that appears, select **Admin center access**. By doing so, all the Microsoft 365 administrator roles are now enabled and available to be assigned.

10. Select **Global Admin** and then select **Next**.

11. On the **You’re almost done – review and finish adding** window, review your selections. If anything needs to be changed, select the appropriate **Edit** link and make the necessary changes. Otherwise, if everything looks good, select **Finish adding**. 

12. On the **Add user** page, select **Close.** 

13. Repeat steps 2-12 to add the following users with all the same data that was assigned to Holly, with the following exceptions: **Do NOT assign a role to any of the following users, and of this group, you should only assign a license to Alan Yoo. Alan and Holly should be the only users assigned a license (an Office 365 E5 license).** <br/>

	**Licenses.** For Alan, you should assign an **Office 365 E5** license on the **Assign product licenses** page; he must be licensed for a later lab. For the remaining users, select the **Create user without product license (not recommended)** option on the **Assign product licenses** page. <br/>

	**Roles.** By default, a user is assigned **User (no admin center access)**; this will be sufficient for these users for now. In the next lab, you will assign roles to the users. So when you reach the **Optional settings** window, select **Next** to bypass assigning a role. 
    
    **Domain:** When you enter the **Username** for each of these users, make sure that in the domain field, you select the **M365xZZZZZZ.onmicrosoft.com** domain, just as you did when you created Holly’s user account record. The domain field will be prefilled with the accepted **XXYYZZa.xxxCustomDomainxxx.xxx** on-premises domain that you previously created; however, since the purpose of this task is to create Microsoft 365 user accounts, you must instead select the **M365xZZZZZZ.onmicrosoft.com** cloud domain (where ZZZZZZ is your tenant ID provided by your lab hosting provider).

	- **Alan Yoo** with username **Alan**  

	- **Ada Russell** with username **Ada**

	- **Adam Hobbs** with username **Adam**

	- **Libby Hayward** with username **Libby**

    - **Laura Atkins** with username **Laura** 
 
14. Remain logged into the domain controller VM with the Microsoft 365 admin center open in your browser for the next task.


### Task 2 – Create and Manage Groups  

In the prior task, you added several new Microsoft 365 user accounts. In this task, you will create two new groups and then manage the groups by assigning users to them. You will also analyze the effect on group members when you delete a group.

1. On the LON-DC1 VM, in the **Microsoft 365 admin center**, select **Groups** in the navigation pane on the left, and then under it, select **Groups**. 

2. In the **Groups** page, select **Add a group**.  

3. In the **Choose a group type** window, select **Office 365 (recommended)** and select **Next**. 

4. In the **Set up the basics** window, enter **Inside Sales** in the **Name** field, and then enter **Collaboration group for the Inside Sales team** in the **Description** field. Select **Next**.

5. In the **Edit settings** window, enter **insidesales** in the **Group email address** field. Under the **Privacy** section, leave the default setting of **Public** and then select **Next**.

6. In the **Assign Owners** window, enter **Alan** in the **Owners** field. In the drop-down menu that appears, select **Alan Yoo**. Enter **Holly** in the **Owners** field, and then in the drop-down menu that appears, select **Holly Spencer**. Select **Next**.

7. In the **Review and finish adding group** window, review the content that you entered. If everything looks good, select **Create group**; otherwise, select **Back** and fix anything that needs correction (or select **Edit** under the specific area).

8. Select **Close**. This returns you to the **Groups** page. Note that your group may not immediatgely appear in the list. As indicated on the page, it can take up to an hour for new distribution groups and mail-enabled security groups to appear in this list. However, in your lab environment, our experience has shown that the group will appear by the time you finish adding the next group.

9. Repeat steps 2-8 to add a new group with the following information:

	- Group type: **Security**

	- Name: **Accounts Receivable**

	- Description: **A/R department users**<br/>

	**Note:** there is no owner, email address, or privacy setting for Security groups

10. If either of the two new groups do not appear in the **Groups** list, select the **Refresh** icon to the right of the URL in Internet Explorer. Both groups should now appear. Note that the Accounts Receivable group does not have a group email address because it's a Security group.

11. You’re now ready to add members to the groups. In the list of **Groups**, select the **Inside Sales** group, which opens a window for the group. 

12. In the **Inside Sales** group window, select **Members**.

13. In the **Members** section, you can see that there are zero (0) members. Select **View all and manage members** to add members to the group. 

14. In the **Inside Sales** group window, select **Add members**. This displays the list of current users.

15. In the list of users, select **Ada Russell** and **Alan Yoo** and then select **Save**. 

16. Select **Close**. This displays the list of users for this group. Select **Close** again. 

17. On the **Inside Sales** window, Alan and Ada now appear as members of the group. Select the **X** in the upper right-hand corner to close the window. 

18. Repeat steps 11-17 to add **Adam Hobbs** and **Libby Hayward** as members of the **Accounts Receivable** group.

19. You now want to test the effect of deleting a group. In the list of **Groups,** select the vertical ellipsis icon (**More actions**) that appears to the right of the **Inside Sales** group. In the menu box, select **Delete group**. 

20. In the **Delete group** window, select the **Delete** button.

21. Once the group is deleted, select **Close**. 

22. This will return you to the list of **Groups** in the **Microsoft 365 admin center**. The **Inside Sales** group should no longer appear. If the Inside Sales group still displays, select the **Refresh** icon to the right of the URL in Internet Explorer. The updated **Groups** list should no longer include the Inside Sales group.

23. To verify whether deleting this group affected any of its members, select **Users** and then **Active Users** in the navigation pane on the left-hand side of the Groups window. 

24. In the **Active users** list verify that the two members of the Inside Sales group, Ada Russell and Alan Yoo, still exist in the list of users. This verifies that deleting a group does not delete the user accounts that were members of the group.

25. Remain logged into the domain controller VM with the Microsoft 365 admin center open in your browser for the next task.


### Task 3 – Recover Groups using PowerShell 

In this task, you will use Windows PowerShell to recover the Inside Sales group that you deleted in the prior task. You will do so by accessing Azure Active Directory, which is required to perform several group management tasks in Microsoft 365. In the prior lab, you installed the Windows PowerShell module that enables you to access Azure AD. In this task, you will access Azure AD using Windows PowerShell to recover the deleted group. 

1. If you’re not logged into the LON-DC1 VM as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. If Windows PowerShell is still open from the previous lab, select the **Windows PowerShell** icon on the taskbar; otherwise, you must open an elevated instance of Windows PowerShell just as you did before.

3. In **Windows PowerShell**, type the following commands (press Enter after each command):

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


# End of Lab 2
