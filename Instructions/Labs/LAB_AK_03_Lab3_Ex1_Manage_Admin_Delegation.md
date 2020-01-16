# Module 3 - Lab 3 - Exercise 1 - Manage Administration Delegation

You are the Enterprise Administrator for Adatum Corporation, and you have Microsoft 365 deployed in a virtualized lab environment. In this lab, you will manage administration delegation by assigning administrator roles to several of your users, configure Azure Rights Management and Compliance, and monitor and troubleshoot Microsoft 365. 

In this lab, you will take on the persona of Holly Spencer, Adatum’s Enterprise Administrator. If you’ll recall, in the prior lab you created Holly’s Microsoft 365 user account and assigned her the Microsoft 365 Global Administrator role. As Holly, you will now begin managing Adatum’s Microsoft 365 tenant.

### ‎Task 1 - Assign Delegated Administrators in the Microsoft 365 Admin Center

As Holly Spencer, Adatum’s Enterprise Administrator (and Microsoft 365 Global Admin), you will use the Microsoft 365 Admin Center to assign administrator rights to several users. 

1. If you’re not logged into the Domain Controller VM (LON-DC1) as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. After completing the previous lab, you should still be signed into the **Microsoft 365 admin center** as the **MOD Administrator** account. In this lab, you will begin implementing Adatum’s Microsoft 365 pilot project as Holly Spencer, Adatum’s Enterprise Admin (whom you previously assigned a Microsoft 365 Global Admin role). Therefore, you must log out of Microsoft 365 as the MOD Administrator and log back in as Holly.<br/>

	On the Microsoft 365 admin center tab, select the user icon for the **MOD Administrator** (the **MA** circle) in the upper right corner of your browser, and in the **My account** pane, select **Sign out.** <br/>
	
	**Important:** When signing out of one account and signing in as another, you should close all your browser tabs except for your current tab. This is a best practice that helps to avoid any confusion by closing the windows associated with the prior user. Please close all other browser tabs now. 
	
3. In Internet Explorer browser, navigate to **https://portal.office.com**. 

4. In the **Pick an account** window, only the admin account that you just logged out from appears. Select **Use another account**. 

5. In the **Sign in** window, enter **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider). Select **Next**.

6. In the **Enter password** window, enter **Pa55w.rd** and then select **Sign in**.

7. If a **Get your work done with Office 365** window appears, select the **X** to close it. 

8. In the **Office 365 home page**, select **Admin** to open the Microsoft 365 admin center.

9. If a **Good morning/afternoon/evening Holly Spencer** window appears, select **Get started**.

10. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Users** and then **Active Users**. 

11. In the **Active users** list, select **Adam Hobbs**. 

12. Adam Hobbs’s properties window displays, and the **Account** tab is displayed by default. Under the **Roles** section, select **Manage roles**. 

13. In the **Manage admin roles** window, the **User (no admin center access)** option is currently selected because you did not assign Adam a role when you created his user account in the prior lab. Now that you want to assign Adam a role, select the **Admin center access** option. This enables the roles. 

14. Scroll down and select **Show all by category**. 

15. In the list of roles that appear by category, scroll down to the **Other** category and select **Billing admin**, and then select **Save changes**. 

16. On the **Admin roles updated** page, select the **X** in the upper-right corner of the screen to close the **Admin roles updated** window.

17. On the **Adam Hobbs** properties window, verify the **Billing admin role** appears under the **Roles** section. Select the **X** in the upper-right corner of the screen to close the window. This returns you to the **Active users** list. 

18. Repeat steps 11 through 17 for **Ada Russell.** Assign Ada to both the **Helpdesk admin** role and the **User admin** role (both roles are in the initial list of admin roles that appear under the **Admin center access** option; you do not have to select **Show all by category**). 

19. Remain logged into the domain controller VM and the Microsoft 365 admin center as Holly Spencer.


### Task 2 - Assign Delegated Administrators with Windows PowerShell  

This task is similar to the prior one in that you will assign administrator rights to users; however, in this case, you will use Windows PowerShell to perform these functions rather than the Office 365 Admin Center. This will give you experience performing this management function in PowerShell, since some administrators prefer performing maintenance such as this using PowerShell.  

‎In this task, you will log into PowerShell as Holly Spencer, who is Adatum’s Enterprise Administrator.

1. On the LON-DC1 VM, navigate to the Windows PowerShell window that you left open from the previous lab. If you closed the PowerShell window, then open it again using the same instruction as before. 

2. You should begin by running the following command that connects your PowerShell session to the Microsoft Online Service:  <br/>

	‎**Connect-MsolService**  
	
3. In the **Sign in** dialog box, log in as **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) with password **Pa55w.rd**. 

4. PowerShell's execution policy settings dictate what PowerShell scripts can be run on a Windows system. Setting this policy to **Unrestricted** enables Holly to load all configuration files and run all scripts. At the command prompt, type the following command, and then press Enter:   <br/>

	‎**Set-ExecutionPolicy unrestricted**<br/>

	‎If you are prompted to verify that you want to change the execution policy, enter **A** to select **[A] Yes to All.** 

5. The "official" name of all roles within Office 365 includes the complete spelling of the word "administrator"; whereas, in the Office 365 admin center, "administrator" is abbreviated to "admin" simply for display purposes. When using PowerShell to perform role-related commands in the following steps, you must spell out the entire word "administrator"; otherwise, the command will return an error indicating that it cannot find the role.

	To view all of the available roles in Office 365, enter the following command in the Windows PowerShell window and then press Enter:
	
	**Get-MsolRole**

6. Holly now wants to assign **Libby Hayward** to the **Service support admin** role. In the Windows PowerShell window, at the command prompt, type the following command, and then press Enter:  <br/>

	**Add-MsolRoleMember -RoleName "Service support administrator” –RoleMemberEmailAddress Libby@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) 


7. You now want to verify which users have been assigned to certain roles. Displaying the users assigned to a role is a two-step process in PowerShell.<br/>

	‎**Note:** Do NOT perform the following commands just yet – this is an informational step whose purpose is to simply describe what you will be doing in the remaining steps in this task. 
	
	- You will begin by running a command that creates a macro command ($role) that states that anytime $role is used in a cmdlet, it should retrieve all users assigned to whichever role name you’re validating.  <br/> 
		
		**&dollar;role = Get-MsolRole -RoleName "enter name of role here"**
			
	- After creating the macro in the prior step, you will then run the following command that directs PowerShell to display all object IDs for the users who have been assigned to the name of the role that you invoked in the previous $role macro.  <br/>
	
		**Get-MsolRoleMember -RoleObjectId $role.ObjectId**  ‎
			
8. You should now run the following two commands as described in the previous step to verify that Libby Hayward was assigned the Service support administrator role:  <br/> 

	**&dollar;role = Get-MsolRole -RoleName "Service support administrator"**<br/>

	‎**Get-MsolRoleMember -RoleObjectId $role.ObjectId**
	
9. Verify that **Libby Hayward** is in the list of users who have been assigned the **Service support administrator** role. 

10. You should now run the following two commands to verify which Adatum users have been assigned to the **Billing administrator** role.  <br/>

	**&dollar;role = Get-MsolRole -RoleName "Billing administrator"**  <br/>

	‎**Get-MsolRoleMember -RoleObjectId $role.ObjectId** 

11. Verify that **Adam Hobbs** is in the list of users who have been assigned the **Billing administrator** role (you assigned Adam to this role in the prior task using the Microsoft 365 admin center). 

12. You should now run the following two commands to verify which users have been assigned to the Company administrator role.<br/>

	**&dollar;role = Get-MsolRole -RoleName "Company administrator"**<br/>

	‎**Get-MsolRoleMember -RoleObjectId $role.ObjectId**   

13. Verify that **Holly Spencer** and the **MOD Administrator** are the only two users who have the **Global admin** role.   <br/>

	‎**Important:** Holly Spencer is in this list because you manually assigned her this role when you created her user account in the prior lab. However, the MOD Administrator was also assigned to this role by default becasue the person who signed up for Microsoft online services automatically becomes a Global admin. For Adatum, this was the MOD Administrator account. 

	‎Verifying which users has been assigned the Company admin role is an important task that should be performed periodically for auditing purposes. Since the Company admin role should only be assigned to users who need global access to most management features and data across Microsoft online services, giving too many users global access is a security risk. Therefore, it is recommended that you only have between 2 and 4 Company admins.  
	
14. Leave your Windows PowerShell session open for future lab exercises; simply minimize it before going on to the next task.


### Task 3 - Verify Delegated Administration  

In this task, you will log into the Client 1 (LON-CL1) VM and then log into the Microsoft 365 admin center as various users to confirm several of the changes that you made when managing your administrative delegation in the prior tasks. 

1. Switch to the Client 1 VM (LON-CL1) by selecting the **Virtual machine** field at the top of the screen and then selecting **LON-CL1**.

2. On the log-in screen, you will log in as the **Administrator** account with a password of **Pa55w.rd**.

3. On the **Networks** window that appears, select **No**.

4. On the taskbar, select the **Microsoft Edge** icon. 

5. In your **Edge** browser navigate to **https://portal.office.com**. In the **Pick an Account** window, if **Alan Yoo** is listed then select his username; otherwise, select **Use another account** and log in as [](https://login.microsoftonline.com/)**Alan@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider).   <br/>

	‎**Note:** When entering Alan’s password, you must enter the temporary password that was assigned to Alan’s account in the prior exercise when you reset Alan’s account and had the system automatically assign him a temporary password. 

6. If a **Get your work done with Office 365** window appears, select the **X t**o close it.

7. In the **Office 365 home page**, note how the **Admin** option is not available since Alan was never assigned an administrator role. 

8. In **Microsoft Edge**, at the top right of the **Office 365 home page**, select the user icon for **Alan Yoo**, and in his **My account** pane, select **Sign out.**   <br/>

	‎**Important:** When signing out of one account and signing in as another, you should close all your browser tabs except for your current tab. This is a best practice that helps to avoid any confusion by closing the windows associated with the prior user. Please close all other browser tabs now.  
	
9. In your **Edge** browser, navigate to **https://portal.office.com** and repeat the previous sign-in steps to sign in as **Ada Russell** with a username of **Ada@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) with the password **Pa55w.rd.** 

10. Since Ada has been assigned to an administrator role, note how **Admin** appears in the **Office 365 home page**. Select **Admin.**

11. In the **Good morning/afternoon/evening Ada Russell** window, select **Get started**.

12. On the **Microsoft 365 admin center**, select **Users** on the left-hand navigation pane and then select **Active users**. 

13. As the **Helpdesk administrator**, Ada has permission to change user passwords. In this case, Libby Hayward and Alan Yoo have reported that their passwords have been compromised. Ada has been asked to reset their passwords to a different value.   <br/>

	‎In the **Active users** list, select the **key icon (Reset a password)** to the right of **Libby Hayward’s** name. 

14. In the **Reset password** window for Libby, ensure the **Auto-generate password** option is selected, and then uncheck the **Require this user to change their password when they first sign in** checkbox if it was selected. 

15. Select **Reset**.

16. You should receive an error message indicating that you cannot reset Libby’s password because she has admin roles. In Libby’s case, she was assigned to the Service Support Admin role. Since only Global Admins can change another admin’s password, you’ll need to ask Holly Spencer to make this change. Select **Close**. 

17. In the **Active users** list, select the **key icon (Reset a password)** to the right of **Alan Yoo’s** name. 

18. In the **Reset password** window for Alan, ensure the **Auto-generate password** option is selected, and then uncheck the **Require this user to change their password when they first sign in** checkbox if it was checked. 

19. Select **Reset**.<br/>

	**IMPORTANT:** It is very important that you write down the temporary password that was automatically generated for Alan’s account. You will need this password in the next exercise when you log into Office 365 as Alan. Once you write down this password, select the **Send password in email** checkbox, and then select **Close.**

20. Select **Send email and close.** 

21. Management has recently discovered that Adam Hobbs’s username may have been compromised. As a result, Ada has been asked to block Adam’s account so that no one can sign in with his username until management is able to determine the extent of the issue. In the **Active users** list, select the circle to the left of **Adam Hobbs’s** name (do NOT select Adam’s name itself). 

22. In the menu bar at the top of the page, select the **ellipsis icon** to display a drop-down menu of additional options. Select **Edit sign-in status**.

23. In the **Block this user?** window, select the **Block this user from signing in** checkbox, and then select **Save changes.** 

24. Close the **Block this user?** window by selecting **Cancel**. 

25. Ada has finished maintaining these accounts, so log out of the Microsoft 365 admin center by selecting the user icon for **Ada Russell** (the **AR circle**), and in her **My account** pane, select **Sign out.** 

26. Once Ada is signed out, close Microsoft Edge. 


# Proceed to Exercise 2

