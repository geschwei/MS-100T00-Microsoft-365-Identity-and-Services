# Module 3 - Lab 3 - Exercise 1 - Manage Administration Delegation

In this lab, you will continue in your role as Holly Spencer, Adatum's Enterprise Administrator. As part of Adatum's Microsoft 365 pilot project, you will manage administration delegation by assigning administrator roles to several of your users, configure Azure Rights Management and Compliance, and monitor and troubleshoot Microsoft 365. 


### ‎Task 1 - Assign Delegated Administrators in the Microsoft 365 Admin Center

As Holly Spencer, Adatum’s Enterprise Administrator (and Microsoft 365 Global Admin), you will use the Microsoft 365 Admin Center to assign administrator rights to several users. 

1. If you’re not logged into the Domain Controller VM (LON-DC1) as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Users** and then **Active Users**. 

3. In the **Active users** list, select **Diego Siciliani**. 

4. Diego Siciliani’s properties window displays, and the **Account** tab is displayed by default. Under the **Roles** section, select **Manage roles**. 

5. In the **Manage admin roles** window, the **User (no admin center access)** option is currently selected. Now that you want to assign Diego an administrator a role, select the **Admin center access** option. This enables the admin roles for selection. 

6. Diego has been promoted to Billing administrator, but since the Billing admin role does not appear in the list of commonly used roles, scroll down and select **Show all by category**. 

7. In the list of roles that appear by category, scroll down to the **Other** category and select **Billing admin**, and then select **Save changes**. 

8. On the **Admin roles updated** page, select the **X** in the upper-right corner of the screen to close the **Admin roles updated** window.

9. On the **Diego Siciliani** properties window, verify that **Billing admin** appears under the **Roles** section. Select the **X** in the upper-right corner of the screen to close the window. This returns you to the **Active users** list. 

10. Repeat steps 3-9 for **Lynne Robbins.** Assign Lynne to both the **Helpdesk admin** role and the **User admin** role (both roles are in the list of commonly used admin roles that appear under the **Admin center access** option; you do not have to select **Show all by category**). 

11. Remain logged into the domain controller VM and the Microsoft 365 admin center as Holly Spencer.


### Task 2 - Assign Delegated Administrators with Windows PowerShell  

This task is similar to the prior one in that you will assign administrator rights to users; however, in this case, you will use Windows PowerShell to perform this function rather than the Office 365 Admin Center. This will give you experience performing this management function in PowerShell, since some administrators prefer performing maintenance such as this using PowerShell. In addition, PowerShell enables you to display all the users assigned to a specific role, which can be very important when auditing your Office 365 deployment. In this task, you will learn how to use PowerShell to display all the users assigned to a specific role. 

1. On the LON-DC1 VM, navigate to the Windows PowerShell window that you left open from the previous lab. If you closed the PowerShell window, then open it again using the same instruction as before. 

2. You should begin by running the following command that connects your PowerShell session to the Microsoft Online Service:  <br/>

	‎**Connect-MsolService**  
	
3. In the **Sign in** dialog box, log in as **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) with password **Pa55w.rd**. 

4. PowerShell's execution policy settings dictate what PowerShell scripts can be run on a Windows system. Setting this policy to **Unrestricted** enables Holly to load all configuration files and run all scripts. At the command prompt, type the following command, and then press Enter:   <br/>

	‎**Set-ExecutionPolicy unrestricted**<br/>

	‎If you are prompted to verify that you want to change the execution policy, enter **A** to select **[A] Yes to All.** 

5. The "official" name of all roles within Office 365 includes the complete spelling of the word "administrator"; whereas, in the Office 365 admin center, "administrator" is abbreviated to "admin" simply for display purposes. When using PowerShell to perform role-related commands in the following steps, you must spell out the entire word "administrator". If you enter "admin" instead of "administrator", the command will return an error indicating that it cannot find the role.

	To view all the available roles in Office 365, enter the following command in the Windows PowerShell window and then press Enter:
	
	**Get-MsolRole**

6. Holly now wants to assign **Patti Fernandez** to the **Service support admin** role. In the Windows PowerShell window, at the command prompt, type the following command, and then press Enter:  <br/>

	**Add-MsolRoleMember -RoleName "Service support administrator” –RoleMemberEmailAddress PattiF@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) 

7. You now want to verify which users have been assigned to certain roles. Displaying the users assigned to a role is a two-step process in PowerShell.<br/>

	‎**Important:** Do NOT perform the following commands just yet – this is an informational step whose purpose is to describe what you will be doing in the remaining steps in this task. 
	
	- You will begin by running a command that creates a macro command ($role) that states that anytime $role is used in a cmdlet, it should retrieve all users assigned to whichever role name you’re validating.  <br/> 
		
		**&dollar;role = Get-MsolRole -RoleName "enter name of role here"**
			
	- After creating the macro in the prior step, you will then run the following command that directs PowerShell to display all object IDs for the users who have been assigned to the name of the role that you invoked in the previous $role macro.  <br/>
	
		**Get-MsolRoleMember -RoleObjectId $role.ObjectId**  ‎
			
8. You should now run the following two commands as described in the previous step to verify that Patti Fernandez was assigned the Service support administrator role:  <br/> 

	**&dollar;role = Get-MsolRole -RoleName "Service support administrator"**<br/>

	‎**Get-MsolRoleMember -RoleObjectId $role.ObjectId**
	
9. Verify that **Patti Fernandez** is in the list of users who have been assigned the **Service support administrator** role. 

10. You should now run the following two commands to verify which Adatum users have been assigned to the **Billing administrator** role.  <br/>

	**&dollar;role = Get-MsolRole -RoleName "Billing administrator"**  <br/>

	‎**Get-MsolRoleMember -RoleObjectId $role.ObjectId** 

11. Verify that **Diego Siciliani** is in the list of users who have been assigned the **Billing administrator** role (you assigned Diego to this role in the prior task using the Microsoft 365 admin center). 
	
12. Leave your Windows PowerShell session open for future lab exercises; simply minimize it before going on to the next task.


### Task 3 - Verify Delegated Administration  

In this task, you will log into the Client 1 (LON-CL1) VM and then log into the Microsoft 365 admin center as various users to confirm several of the changes that you made when managing your administrative delegation in the prior tasks. 

**Password Note:** When logging into Office 365 as any of the existing user accounts that were created for you in the Microsoft 365 tenant (for example, Allan Deyoung, Lynne Robbins, and so on), you must use the same Tenant Password that you used in Lab 1 when you signed in using the tenant email account (admin@M365xZZZZZZ.onmicrosoft.com). All of the existing user accounts have been assigned this same Tenant Password, which your instructor will provide for you.

1. Switch to the Client 1 VM (LON-CL1) by selecting the **Virtual machine** field at the top of the screen and then selecting **LON-CL1**.

2. On the log-in screen, you will log in as the **Administrator** account with a password of **Pa55w.rd**.

3. If a **Networks** window appears, select **No**.

4. On the taskbar, select the **Microsoft Edge** icon. 

5. In your **Edge** browser navigate to **https://portal.office.com**. 

6. In the **Sign-in** window, enter **AllanD@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) with the password **Pa55w.rd**.   <br/>

7. If a **Get your work done with Office 365** window appears, select the **X t**o close it.

8. In the **Office 365 home page**, note how the **Admin** option is not available since Allan was never assigned an administrator role. 

9. In **Microsoft Edge**, at the top right of the **Office 365 home page**, select the user icon for **Allan Deyoung**, and in his **My account** pane, select **Sign out.**   <br/>

	‎**Important:** When signing out of one account and signing in as another, you should close all your browser tabs except for your current tab. This is a best practice that helps to avoid any confusion by closing the windows associated with the prior user. Please close all other browser tabs now.  
	
10. In your **Edge** browser, navigate to **https://portal.office.com** and repeat the previous sign-in steps to sign in as **Lynne Roibbins** with a username of **LynneR@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider) with the password **Pa55w.rd**. 

11. Since Lynne has been assigned to an administrator role, note how **Admin** appears in the **Office 365 home page**. Select **Admin.**

12. If the **Good morning/afternoon/evening Lynne Robbins** window appears, select **Get started**.

13. On the **Microsoft 365 admin center**, select **Users** on the left-hand navigation pane and then select **Active users**. 

14. As the **Helpdesk administrator**, Lynne has permission to change user passwords. Lynne was recently contacted by **Diego Siciliani** and **Allan Deyoung**, who each reported that their passwords have been compromised. Lynne has been asked to reset their passwords to a different value.   <br/>

	‎In the **Active users** list, select the **key icon (Reset a password)** to the right of **Diego Siciliani's** name. 

15. In the **Reset password** window for Diego, ensure the **Auto-generate password** option is selected, and then uncheck the **Require this user to change their password when they first sign in** checkbox if it was selected. 

16. Select **Reset**.

17. You should receive an error message indicating that you cannot reset Diego’s password because he has been assigned an admin role. In Diego’s case, he was assigned to the Billing Admin role. Since only Global Admins can change another admin’s password, Lynne will need to ask Holly Spencer to make this change. Select **Close**. 

18. In the **Active users** list, select the **key icon (Reset a password)** to the right of **Allan Deyoung’s** name. 

19. In the **Reset password** window for Allan, ensure the **Auto-generate password** option is selected, and then uncheck the **Require this user to change their password when they first sign in** checkbox if it was checked. 

20. Select **Reset**.<br/>

	**IMPORTANT:** It is very important that you write down the temporary password that was automatically generated for Allan’s account. You will need this password in the next exercise when you log into Office 365 as Allan. Once you write down this password, select the **Send password in email** checkbox, and then select **Close.**

21. Select **Send email and close.** 

22. Management has recently discovered that Nestor Wilke’s username may have been compromised. As a result, Lynne has been asked to block Nestor’s account so that no one can sign in with his username until management is able to determine the extent of the issue. In the **Active users** list, select the circle to the left of **Nestor Wilke’s** name (do NOT select Nestor’s name itself). 

23. In the menu bar at the top of the page, select the **ellipsis icon** to display a drop-down menu of additional options. Select **Edit sign-in status**.

24. In the **Block this user?** window, select the **Block this user from signing in** checkbox, and then select **Save changes.** 

25. Close the **Block this user?** window by selecting **Cancel**. 

26. Lynne has finished maintaining these accounts, so log out of the Microsoft 365 admin center by selecting the user icon for **Lynne Robbins** (the **LR circle**), and in her **My account** pane, select **Sign out.** 

27. Once Lynne is signed out, close Microsoft Edge. 


# Proceed to Exercise 2

