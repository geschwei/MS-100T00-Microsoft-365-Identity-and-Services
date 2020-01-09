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

12. On the **Holly Spencer has been added** page, select **Close.** 

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


### Task 2 – Create and Manage Groups  

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


### Task 3 – Prepare for Microsoft Azure Active Directory 

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


### Task 4 – Recover Groups using PowerShell 

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


# End of Lab 2
