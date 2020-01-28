# Module 7 - Lab 6 - Exercise 1 - Prepare for Identity Synchronization  

As in the previous lab exercises you will take on the role of Holly Spencer, Adatum Corporation’s Enterprise Administrator. Adatum has recently subscribed to Microsoft 365, and you have been tasked with deploying the application in Adatum’s virtualized lab environment. In this lab, you will perform the tasks necessary to manage your Microsoft 365 identity environment using both the Microsoft 365 admin center and Windows PowerShell. 

During this exercise you will set up and manage Azure AD Connect. You will create on-premises users and validate the sync process so that their identity is moved to the cloud. Some of the steps may feel familiar from previous exercises; however, in this case they are needed to validate the synchronization process.

### Task 1: Configure your UPN suffix

In Active Directory, the default User Principal Name (UPN) suffix is the DNS name of the domain where the user account was created. The Azure AD Connect wizard uses the UserPrincipalName attribute, or it lets you specify the on-premises attribute (in a custom installation) to be used as the user principal name in Azure AD. This is the value that is used for signing into Azure AD. 

If you recall, your VM environment was created by your lab hosting provider with an on-premises domain titled **adatum.com**. This domain included a number of on-premises user accounts, such as Holly Spencer, Laura Atkins, and so on. Then in the first lab in this course, you created a custom, accepted domain for Adatum titled **XXYYZZa.xxxCustomDomainxxx.xxx** (where XXYYZZa was the unique UPN name assigned to your tenant, and xxxCustomDomainxxx.xxx was the name of your lab hosting provider's custom domain).

In this task, you will use PowerShell to change the user principal name of the domain for the entire Adatum Corporation by replacing the originally established **adatum.com** domain with the custom **XXYYZZa.xxxCustomDomainxxx.xxx** domain. In doing so, you will update the UPN suffix for the primary domain and the UPN on every on-premises user account in AD DS with **@XXYYZZa.xxxCustomDomainxxx.xxx**. 

1. On your Domain Controller VM (LON-DC1), make sure you’re logged in as **ADATUM\Administrator** and password **Pa55w.rd**. 

2. You must now open **Windows PowerShell**. Select the magnifying glass (**Search**) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. 

3. In the menu that appears, right-click on **Windows PowerShell** and select **Run as administrator** in the drop-down menu. 

4. Using **Windows PowerShell**, you must replace the on-premises **adatum.com** domain with the **XXYYZZa.xxxCustomDomainxxx.xxx** domain (where you will replace XXYYZZa with the unique UPN name assigned to your tenant, and you will replace xxxCustomDomainxxx.xxx with your lab hosting provider's custom domain). In doing so, you will update the UPN suffix for the primary domain and the UPN on every user in AD DS with **@XXYYZZa.xxxCustomDomainxxx.xxx**. <br/> 

	‎In the following command, the **Set-ADForest** cmdlet modifies the properties of an Active Directory forest, and the **-identity** parameter specifies the Active Directory forest to modify. To perform this task, run the following command to set the **UPNSuffixes** property for the **adatum.com** forest (remember to change XXYYZZa to your unique UPN name and xxxCustomDomainxxx.xxx to your lab hosting provider's custom domain name):<br/>
	
	‎**Set-ADForest -identity adatum.com -UPNSuffixes @{replace="XXYYZZa.xxxCustomDomainxxx.xxx"}**

5. You must then run the following command that changes all existing adatum.com accounts to the new UPN @XXYYZZa.xxxCustomDomainxxx.xxx domain (remember to change XXYYZZa to your unique UPN name and xxxCustomDomainxxx.xxx to your lab hosting provider's custom domain name): <br/>

	‎**Get-ADUser -Filter * -Properties SamAccountName | ForEach-Object { Set-ADUser $_  -UserPrincipalName ($_.SamAccountName + "@XXYYZZa.xxxCustomDomainxxx.xxx" )}**

6. You will continue using PowerShell on your Domain Controller VM in the next task.


### Task 2: Prepare problem user accounts   

Integrating your on-premises Active Directory with Azure AD makes your users more productive by providing a common identity for accessing both cloud and on-premises resources. However, errors can occur when identity data is synchronized from Windows Server Active Directory (AD DS) to Azure Active Directory (Azure AD). 

For example, two or more objects may have the same value for the **ProxyAddresses** attribute or the **UserPrincipalName** attribute in on-premises Active Directory. There are a multitude of different conditions that may result in synchronization errors. Organizations can correct these errors by running the IdFix tool, which performs discovery and remediation of identity objects and their attributes in an on-premises Active Directory environment in preparation for migration to Azure Active Directory. 

In this task, you will run a script that breaks various Adatum on-premises user accounts. As part of your Adatum pilot project, you are purposely breaking these identity objects so that you can later run the IdFix tool in the next task to see how it will fix them. 

1. On your Domain Controller VM (LON-DC1), in the Windows PowerShell window, run the following command to change the root source to **C:\labfiles** so that you can access any files from that location: <br/>

	‎<strong>CD C:\labfiles\ </strong>

2. PowerShell's execution policy settings dictate what PowerShell scripts can be run on a Windows system. Setting this policy to **Unrestricted** enables Holly to load all configuration files and run all scripts. At the command prompt, type the following command, and then press Enter:   <br/>

	‎**Set-ExecutionPolicy Unrestricted**

3. You will then be prompted to confirm the execution policy change. Type **A** to select the **[A] Yes to All** option.

4. Enter the following command that runs a PowerShell script (stored in the C:\labfiles folder) that creates problem users. These users will purposely have issues with their user account so that you can troubleshoot them in the next task with the IdFix tool.  <br/>

	‎<strong>.\CreateProblemUsers.ps1 </strong> <br/>
	
	**Note:** Wait until the script has completed before proceeding to the next task. This Windows PowerShell script will make the following changes in AD DS:

	- **Klemen Sic**. Update the UserPrincipalName for Klemen to include an extra "@" character. 

	- **Lara Raisic**. Update the emailAddress attribute for Lara to **lara@adatum.com**. 

	- **Logan Boyle**. Update the emailAddress attribute for Logan to **logan@adatum.com**.

	- **Holly Spencer**. Update the emailAddress attribute for Holly to **holly @adatum.com**. Note: this includes a blank space between “holly” and “@adatum.com”; this blank space is there on purpose.

	- **Maj Hojski**. Update the emailAddress attribute for Maj to blank characters (“ “).  

5. Close PowerShell.


### Task 3: Run the IdFix tool and fix identified issues 

In this task you will download and use the IdFix tool to fix the user accounts that were broken in the previous task. Running the IdFix tool will correct any user account errors prior to synchronizing identity data between your on-premises environment and Azure AD.

1. Switch to the Client 1 VM (LON-CL1) and log in as **adatum\administrator**. The desktop will display the login screen for Adam Hobbs, who was the last user to previously user the Client 1 VM. On the Desktop, select **Other user**, and then enter **adatum\administrator** as the **User name** and **Pa55w.rd** as the **Password.**

2. Open **Microsoft Edge** and then enter the following URL in the address bar to access the Microsoft Download Center page for the IdFix Directory Synchronization Error Remediation Tool: <br/>

	<strong>https://www.microsoft.com/en-us/download/details.aspx?id=36832 </strong>

3. Scroll down on the **Download Center** page for **the IdFix Directory Synchronization Error Remediation Tool** and select the **Download** button. 

4. In the notification bar that appears at the bottom of the page, select **Save**.

5. Wait for the download to complete, and then in the notification bar, select **Open**. 

6. In the **File Explorer** window that appears, it should already be displaying the **Downloads** folder (if not, select the Downloads folder). Right-click **IdFix.zip**, select **Open**, and then if a **Compressed (zipped) folders** dialog box, select **Extract All...**  <br/>

	‎**Note:** When you select **Open**, the **Compressed (zipped) folder** dialog box may not appear; instead, it may automatically extract all files and take you to the next step. 

7. In the **Select a Destination and Extract Files** dialog box, in the **Files will be extracted to this folder** field, type **C:\Deployment Tools\IdFix**, and then select **Extract**. 

8. In **File Explorer**, it should already be displaying the **C:\Deployment Tools\IdFix** folder. Right-click **IdFix.exe**, and then select **Run as administrator**. 

9. In the **IdFix Privacy Statement** message box, select **OK**. 

10. In the **IdFix** window, on the menu bar, select **Query**. After a short wait, you should see several errors. 

11. Select the **ERROR** column to sort the character errors to the top of the list.   <br/>

	‎**Note:** If **topleveldomain** errors appear, then ignore them as they cannot be fixed by the IdFix tool.  

12. In the **Holly Spencer** row, select the drop-down arrow in the **ACTION** field and select **EDIT**. 

13. In the **Maj Hojski** row, select the drop-down arrow in the **ACTION** field and select **EDIT**. 

14. In the **Klemen Sic** row, select the drop-down arrow in the **ACTION** field and select **EDIT**. 

15. On the toolbar at the top of the window, select **Apply**. 

16. In the **Apply Pending** dialog box, select **Yes**; note the **COMPLETE** status in the **ACTION** column indicating successful writes. <br/>

	‎**Note:** Notice that IdFix updated the three user objects and corrected the errors. 

17. Switch to **File Explorer**, and in the **C:\Deployment Tools\IdFix** folder, double-click **Verbose {date} {time}.txt** to open Notepad and view the updated transactions in the transaction log. Note the three Updates that appear at the bottom of the file that reflect the updates you just initiated. When you’re done, close Notepad. 

18. Switch back to the **IdFix tool**. On the toolbar, select **Query**. 

19. Find the **Logan Boyle** row, and then click in the **UPDATE** column for Logan. In this case, a duplicate UPN was detected. You can replace the string in the **UPDATE** column with the correct value. Enter **logan@adatum.com**, and then select the drop-down arrow in the **ACTION** field and select **EDIT**. 

20. Find the **Maj Hoski** row, and then click in the **UPDATE** column for Maj. In this case, the UPN is incorrect. You can replace the string in the **UPDATE** column with the correct value. Enter **maj@adatum.com**, and then select the drop-down arrow in the **ACTION** field and select **EDIT**. 

21. On the toolbar at the top of the window, select **Apply**. 

22. In the **Apply Pending** box, select **Yes**.  <br/>

	‎**Note:** This will update the two user objects and correct their UPN. 

23. On the toolbar, select **Query** and verify the errors are corrected (the users will no longer appear on the screen). As you can see, there are two users whose errors you did not fix (**Ngoc Bich Tran** and **An Dung Dao**). We are purposely leaving these errors alone so that you can see what happens during the synchronization process using the Azure AD Connect tool in Task 5 when it processes users with these conditions. <br/>

	**Note:** Where there are format and duplicate errors for distinguished names, the **UPDATE** column either contains the same string as the **VALUE** column, or the **UPDATE** column entry is blank. In either case, this means that IdFix cannot suggest a remediation for the error. You can either fix these errors outside IdFix, or manually remediate them within IdFix. You can also export the results and use Windows PowerShell to remediate many errors.  

24. Close the open File Explorer windows. 


### Task 4: Prepare for Directory Synchronization    

The Azure Active Directory Connect synchronization services (Azure AD Connect sync) is a main component of Azure AD Connect. It takes care of all the operations that are related to synchronizing identity data between your on-premises environment and Azure AD. The sync service consists of the following two components: the on-premises Azure AD Connect sync component and the cloud service component in Azure AD called Azure AD Connect sync service.

Before you can run Azure AD Connect, you must first configure several settings that control the synchronization process. Once you have completed the preparation process, you will then run the Azure AD Connect tool in the next task. 

1. Switch to you Domain Controller VM (LON-DC1). If you’re not already logged on as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. In your **Internet Explorer** browser, select the **gear (Tools) icon** in the upper-right corner of the screen, then in the drop-down menu select **Internet options**, and then in the **Internet Options** window, select the **Security** tab. 

3. The **Internet** zone should be selected by default. Towards the bottom of the window, select **Custom Level**. 

4. In the **Security Settings – Internet Zone** window, scroll down to the **Downloads** section. The first option in this section is **File download**. Verify the **File download** option is set to **Enable** and then select **OK**. 

5. This takes you back to the **Internet Options** window. Select the **Trusted sites** zone.

6. In the **Trusted Sites** zone, you must add several sites. Select the **Sites** button. 

7. In the **Trusted sites** window, in the **Add this website to the zone** field, enter the following URL and then select **Add**: **https://outlook.office365.com/** 

8. Repeat step 7 to add the following site: **https://outlook.office.com/**  

9. Repeat step 7 to add the following site: **https://portal.office.com/**  

10. Select **Close** once you have added these three sites.

11. In the **Internet Options** window, select **OK** to close the window.

12. Enter the following URL in the address bar to open the **Microsoft Office Home** page: **https://portal.office.com/** 

13. If you’re signed in as Holly Spencer (the circle in the upper-right corner displays **HS**), then proceed to the next step; otherwise, sign in as **Holly@M365xZZZZZZ.onmicrosoft.com** with the password **Pa55w.rd** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider). 

14. In the **Microsoft Office Home** page, select **Admin**. 

15. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Users**, and then select **Active** **Users**.  

16. In the **Active users** list, select **Holly Spencer**. 

17. In Holly Spencer’s account page, under the **Username/E-mail** section, select **Manage username**.

18. In the **Manage username** window, select the drop-down arrow in the **domain** field and then select the **XXYYZZa.xxxCustomDomainxxx.xxx** domain (where XXYYZZa is your unique UPN Name provided by your lab hosting provider and xxxCustomDomainxxx.xxx is your lab hosting provider's custom domain name).   <br/>

	‎**Important:** This step will break Holly’s account. You are purposely doing this to introduce a common problem that many organizations face today – they will correctly create the same UPN’s for a user’s on-premises and cloud accounts, but they accidentally (and incorrectly) point each account to a different domain.   <br/>
	
	‎As a result of creating this domain mismatch, the synchronization process will create two accounts for this user in the Microsoft 365 Active User list instead of just one account. In addition, each account will have its own mailbox because the mailboxes will have different domain and routing addresses. In a normal situation in which the user’s on-premises and cloud accounts have the same UPN and domain, the synchronization process will create one user account in the Microsoft 365 Active User list that has multiple SMTP addresses in the email address property chain.

19. Read the warning that appears at the top of the window and then select **Save changes**. 

20. You should be signed out automatically. 

21. In the **Pick an account** window, you want to log in using Holly’s **Holly@XXYYZZa.xxxCustomDomainxxx.xx** account. Note that her **Holly@M365xZZZZZZ.onmicrosoft.com** account appears in the list, but not her **Holly@XXYYZZa.xxxCustomDomainxxx.xxx** account. Therefore, select **Use another account.** 

22. In the **Sign in** window, enter **Holly@XXYYZZa.xxxCustomDomainxxx.xxx** (where XXYYZZa is your unique UPN Name provided by your lab hosting provider and xxxCustomDomainxxx.xxx is your lab hosting provider's custom domain name) and then select **Next**. 

23. In the **Enter password** window, enter **Pa55w.rd** and then select Sign in.

24. In the **Stay signed in?** window, select **Yes**.

25. Close Internet Explorer, then select the **Internet Explorer icon** on the taskbar to open it again. 

26. Proceed to the next task. You are now ready to install the Azure AD Connect tool. 
  

### Task 5: Running Azure AD Connect and Performing a Full Synchronization

In this task, you will run the Azure AD Connect setup wizard to enable synchronization between Adatum’s on-premises Active Directory and Azure Active Directory. Once the configuration is complete, the synchronization process will automatically start. 

‎This task resumes from the prior task, where you logged into the Domain Controller VM as **Holly@XXYYZZa.xxxCustomDomainxxx.xx** and you closed and then reopened Internet Explorer.

1. In **Internet Explorer**, select the **Microsoft 365 admin center** tab. 

2. In the **Active users** window, select the **ellipsis** icon (to the right of **Add a user**), and then in the drop-down menu, select **Directory synchronization**. 

3. In the **Active Directory preparation** window, select **Download Microsoft Azure Active Directory Connect tool**. This takes you to the Microsoft Download Center.

4. In the **Microsoft Download Center** page, scroll down to the **Microsoft Azure Active Directory Connect** section and select **Download**. 

5. In the notification bar that appears at the bottom of the page, select **Save**.

6. Once the download is complete, in the notification bar at the bottom of the page, select **Run**.

7. This initiates the installation of the Microsoft Azure Active Directory Connect Tool. If the **Welcome to Azure AD Connect** window does not appear on the desktop, find the icon for it in the taskbar and select it. On the Welcome to Azure AD Connect window in the setup wizard, select the **I agree to the license terms and privacy notice** option and then select **Continue**.

8. On the **Express Settings** page, read the instruction regarding a single Windows Server AD forest and then select **Use express settings**.

9. On the **Connect to Azure AD** window, enter **Holly@XXYYZZa.xxxCustomDomainxxx.xxx** (where XXYYZZ is your unique UPN Name provided by your lab hosting provider and xxxCustomDomainxxx.xxx is your lab hosting provider's custom domain name) in the **USERNAME** field, enter **Pa55w.rd** in the **PASSWORD** field, and then select **Next.** 

10. On the **Connect to AD DS** page, enter **adatum\Administrator** in the **USERNAME** field, enter **Pa55w.rd** in the **PASSWORD** field, and then select **Next.**

11. In the **Azure AD sign-in configuration** window, select the **Continue without matching all UPN suffixes to verified domains** option, and then select **Next**.

12. On the **Ready to configure** screen, select the check box for **Start the synchronization process when configuration completes** if it’s not already selected, and then select **Install**.   <br/>

	‎**Note:** In a real-world deployment, if you’re also preparing Azure AD Connect for an Exchange hybrid deployment, you would select the **Exchange hybrid deployment** option as well. In this lab, you will leave this option blank.

13. Wait for the installation to complete and then select **Exit**. 

14. In the taskbar at the bottom of the VM, select the **magnifying glass (Search)** icon, and then in the Search box, enter **Synchronization**. In the menu, select the **Synchronization Service** desktop application to open it.

15. In the **Synchronization Service Desktop Manager** window, the Operations tab is displayed by default so that you can monitor the synchronization process.   <br/>

	‎**Note:** Because a synchronization had not been performed prior to this, the initial synchronization is a **Full Synchronization** (see the **Profile Name** column). Because the synchronization process will continue to run automatically every 30 minutes (the default syn interval for Azure AD Connect is set to 30 minutes during installation), any subsequent synchronizations will display **Delta Synchronization** in the **Profile Name**. If you leave the Synchronization Service Manager window open, after 30 minutes you will see that it attempts to synchronize the two users who were not synchronized during the initial synchronization. 

16. Wait for the **Export** profile to complete for **M365xZZZZZZ.onmicrosoft.com** (with a **Status** of **completed-export-errors**). Select this row.  

17. In the bottom portion of the screen, note the number of users that were added and the number that were updated. Also note the two errors that appear in the **Export Errors** section. If you recall back in Task 3 when you ran the IdFix tool, there were two users with validation errors that you purposely did not fix (**Ngoc Bich Tran** and **An Dung Dao**). If you select the links to each of the **Export Errors**, you’ll see that these are the two users that were not synchronized by the Azure AD Connect tool due to these data validation errors.   <br/>

	‎Also note that because a synchronization had not been performed prior to this, the initial synchronization is a **Full Synchronization** (see the **Profile Name** column). Because the synchronization process will continue to run automatically every 30 minutes, any subsequent synchronizations will display **Delta Synchronization** as its **Profile Name**. If you leave the Synchronization Service Manager window open, after 30 minutes you will see that it attempts to synchronize the two users who were not synchronized during the initial synchronization. These will display as a **Delta Synchronization**.

18. Now that you have seen Azure AD Connect complete a Full Synchronization, and rather than waiting for it to synchronize future updates, in the next task you will make some updates and manually force a synchronization. Leave the Domain Controller VM open as it will be used in the next exercise.


# Proceed to Exercise 2
 
