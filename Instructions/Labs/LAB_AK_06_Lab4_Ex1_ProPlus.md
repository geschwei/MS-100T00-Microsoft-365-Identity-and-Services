# Module 6 - Lab 4 - Exercise 1 - Manage an Office 365 ProPlus installation

You have taken on the persona of Holly Spencer, Adatum's Enterprise Administrator, and you have Microsoft 365 deployed in a virtualized lab environment. In this exercise, you will perform the tasks necessary to manage a user-driven Office 365 ProPlus installation. Performing a user-driven Office 365 ProPlus installation is a two-step process: 1) configuring the user account so the user is eligible to download and install the Office 365 deployment tool, and 2) performing the installation. 

In the first two tasks in this exercise, you will verify the conditions that affect whether a user can be blocked from downloading the Office 365 ProPlus suite: <br/>

- The user does not have an appropriate Office 365 license (which you will verify in Task 1). 
	
- An admin turns off the global Office download setting that controls the downloading of mobile and desktop apps for all users (which you will verify in Task 2).

In the final task in this exercise, you will install the Office 365 ProPlus suite for one of Adatum's users.


### Task 1 – Verify how licensing affects installing Office 365 ProPlus

In this task, Holly will test whether a user who has not been assigned an appropriate Office 365 license can download Office 365 ProPlus. For this test, you cannot use any of the existing users that appear in the **Active Users** list in the Microsoft 365 admin center. These users only have Office 365 accounts (M365xZZZZZZ.onmicrosoft.com accounts); they do not have corresponding on-premises accounts in the adatum domain. Without an on-premises account, you cannot log into the Client 1 VM as any of these users to install Office 365 Pro Plus on the client machine. 

Therefore, you must use one of Adatum's on-premises user accounts that has been loaded in its VM environment. For this test, you will use **Laura Atkins**. You will create an Office 365 account for Laura, but you will not assign her an Office 365 license. 

1. If you’re not logged into the Domain Controller VM (LON-DC1) as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now. 

2. The **Microsoft 365 admin center** should still be open in Internet Explorer from the prior lab. If the **Active users** window is not displayed, select **Users** in the left-hand navigation pane and then select **Active users**. 

3. You will begin by testing whether a user **without** an appropriate Office 365 license can install Office 365 ProPlus. For this test, you will use **Laura Atkins**. Your lab hosting provider has already created an on-premises user account for Laura, but she does not have an Office 365 user account. You will create an Office 365 account for Laura, but you will not assign her an Office 365 license. 

	At the top of the **Active users** window, select **Add a user** on the menu bar.

4. In the **Set up the basics** window, enter the following information:
	- First name: **Laura**
	- Last name: **Atkins** 
	- Display name: When you tab into this field, Laura Atkins will appear.
	- Username: **Laura**

	**IMPORTANT:** To the right of the Username field is the domain field. It’s already prefilled with the custom XXYYZZa.xxxCustomDomainxxx.xxx on-premises domain (where XXYYZZ is your UPN number and xxxCustomDomainxxx.xxx is your lab hosting provider's domain); however, you must select the drop-down arrow and select the **M365xZZZZZZ.onmicrosoft.com** cloud domain instead (where ZZZZZZ is your tenant ID provided by your lab hosting provider). 

	After configuring this field, Laura’s Username should appear as: Laura@M365xZZZZZZ.onmicrosoft.com

	- Password settings: select the **Let me create the password** option
	- Password: **Pa55w.rd** 
	- Uncheck the **Require this user to change their password when they first sign in** check box 
	
5. Select **Next**.

6. In the **Assign product licenses** window, select the **Create user without product license (not recommended)** option, and then select **Next**.

7. In the **Optional settings** window, select **Next**. 

8. On the **You’re almost done – review and finish adding** window, review your selections. If anything needs to be changed, select the appropriate **Edit** link and make the necessary changes. Otherwise, if everything looks good, select **Finish adding**. 

9. On the **Laura Atkins has been added** page, select **Close**. If a survey form appears, select **Cancel**. 

10. You will now switch to the Client 1 VM (LON-CL1) and log in as **Laura Atkins**. In the **Virtual Machine** box at the top of the VM, select the drop-down arrow and select the Client 1 VM (**LON-CL1**). 

11. Once the Client 1 VM opens, at the top of the VM, select the **Actions** drop-down arrow and select **Ctrl+Alt+Delete**. This will display the log-in credentials for the **ADATUM\Administrator** account. Since you want to log in as Laura, select **Other user** in the lower-left portion of the desktop.

12. In the **Other user** log in, enter **adatum\laura** in the **Username** field, enter **Pa55w.rd** as the **Password**, and then select the arrow to log in.

13. If a **Networks** pane appears, select **Yes**. 

14. In the Client 1 VM, Laura prefers to use Microsoft Edge as her browser. Select the **Microsoft Edge** icon on either the desktop or the taskbar.

15. In **Microsoft Edge**, maximize your browser, then go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/**

16. In the **Sign in** window, enter **Laura@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider) and then select **Next**.

17. In the **Enter password** window, enter **Pa55w.rd** and then select **Sign in.**

18. In the **Stay signed in?** window, select the **Don't show this again** check box and then select **Yes.**

19. In the **Microsoft Office Home** page for Laura, notice that no Office 365 apps appear (since Laura does not have an Office 365 license assigned). Select the **Install Office** drop-down arrow, and then select **Install software**.

20. This displays the **My account** window for Laura. Under the **Office apps &amp; devices** section, select **View apps &amp; devices**. Note the message that appears at the top of page. Laura has not been assigned an Office license that includes the Office desktop apps, so she’s unable to install Office 365 ProPlus. <br/>
	
	‎**Important:** You have just verified that a user cannot download Office 365 Pro Plus if he or she has not been assigned an appropriate Office 365 license.
	
21. Leave your LON-CL1 VM open and remain signed into Office 365 as Laura Atkins for the next task.


### Task 2 – Verify how the global Office download setting affects installing Office 365 ProPlus

Holly is now going to test whether users can be prohibited from downloading Office 365 ProPlus if an admin such as herself turns off the global Office download setting that controls the downloading of mobile and desktop apps for all users.<br/>
	
1. You must switch back the Domain Controller VM (LON-DC1), so select the drop-down arrow in the **Virtual machine** field at the top of the VM and select the LON-DC1 VM. You should still be logged in as Holly Spencer, Adatum’s Enterprise Administrator.

2. To turn off the global Office download setting, select the **Microsoft 365 admin center** tab in your browser, select **...Show all** in the left-hand navigation pane, select **Settings,** and then select **Settings**. 

3. In the **Settings** window, scroll down through the list of services and select **Office software download settings.**

4. In the **Office software download settings** window, under the **Apps for Windows and mobile devices** section, the **Office (includes Skype for Business)** check box is currently selected. Select this check box so that it’s blank, which turns this feature Off. 

5. Select **Save changes**. 

6. Once you receive a message indicating the changes are saved, select the **X** in the upper-right corner of this window to close it. 

7. You should now test whether turning off this global download setting affects a **licensed** user from installing Office 365 ProPlus. In this case, you’re once again going to use **Laura Atkins**, so you must first assign Laura an Office 365 license. 
	
	In the **Microsoft 365 admin center**, under **Users** in the left-hand navigation pane select **Active users**, and then in the in the **Active users** list, select **Laura Atkins**.

8. In Laura Atkins’ account window, select the **Licenses and Apps** tab. In the **Licenses** section, select the **Office 365 E5** check box and then select **Save changes**. You can then close Laura’s account window.

9. Let’s now check whether Laura can download Office 365 ProPlus on to her client PC when the global Office download setting has been turned Off. To do this, you must switch back to the Client 1 VM and log in as Laura.<br/>
	
	‎In the **Virtual machine** field at the top of the VM, select the drop-down arrow and select the Client 1 VM (LON-CL1).

10. In the Client 1 VM, you should still be logged in as Laura Atkins. Your Edge browser should still be open, and the **Apps and devices** page should be displayed along with the error message that you received in the prior task that indicated that Laura was not assigned an Office license. If you select the **Refresh** icon on the address bar, it will return you to the **My account** page. Under the **Office apps &amp; devices** section, if you select **View apps &amp; devices**, note that it does not re-verify Laura's licensing status and still returns the same error message. Therefore, you must log out of Office 365 and log back in. 

	Select the Laura Atkins icon (the circle with LA in it) in the upper-right corner of the screen, and in the drop-down menu that appears, select **Sign out**.
	
	As a best practice, close all other tabs that are open in your Edge browser except for this **Sign out** tab.

11. In **Microsoft Edge**, go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/**

12. In the **Pick an account** window, select **Laura@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider).

13. In the **Enter password** window, enter **Pa55w.rd** and then select **Sign in.**

14. In the **Stay signed in?** window, select **Yes.**

15. In the **Microsoft Office Home** page for Laura, notice that the Office 365 apps now appear because Laura has been assigned an Office 365 license. <br/>

	Select the **Install Office** drop-down arrow, and then in the drop-down menu, select **Install software**.<br/>
	
16. In the **My account** window that appears, under the **Office apps &amp; devices** section, select **View apps &amp; devices**. 

17. In the **Apps &amp; devices** window, under the **Office** section at the top of the page, a message is displayed indicating the admin has turned off Office installs. <br/>
	
	‎**Important:** You have just verified that a licensed user is unable to download Office 365 ProPlus if the global Office download setting has been turned Off.

18. At this point Holly wants to turn the global Office download setting back On so that Laura can download Office 365 ProPlus. To do this, you must switch back the Domain Controller VM.<br/>
	
	‎To do so, select the drop-down arrow in the **Virtual machine** field at the top of the VM and select the Domain Controller VM (LON-DC1). You should still be logged in as Holly Spencer.

19. The **Microsoft 365 admin center**, under the **Settings** section in the left-hand navigation pane, select **Settings**. 

20. In the **Settings** window, scroll down and select **Office software download settings**.

21. In the **Office software download settings** window, under the **Apps for Windows and mobile devices** section, the **Office (includes Skype for Business)** check box is currently blank. Select this check box so that it displays a checkmark, which now turns this feature back On.

22. Select **Save changes**.

23. Once you receive a message indicating the changes are saved, select the **X** in the upper-right corner of this window to close it. 

24. Now that this global Office download option is turned back On, let’s see how it affects Laura’s ability to download Office 365 ProPlus. To do this, you must switch back to the Client 1 VM. <br/>
	
	‎In the **Virtual machine** field at the top of the VM, select the drop-down arrow and select the Client 1 VM (LON-CL1).

25. In the Client 1 VM, Laura's Edge browser should still be open, and the **Apps and devices** page should be displayed along with the error message that indicated your admin has turned off Office installs. Since you just turned this option back on, you need to refresh this page to see how it affects Laura’s ability to download Office 365 ProPlus (Note: unlike the previous time when you refreshed this page and it did not refresh Laura's Office 365 license status, refreshing this page after updating the global download setting works). 

	Select the **Refresh icon** that appears to the left of the address bar at the top of your browser. 

26. In the **My account** window that appears, under the **Office apps &amp; devices** section, the **Install Office** button now appears along with a message indicating you can install Office on up to 5 PCs or Macs, 5 tablets, and 5 smartphones. 
	
	‎**Important:** You have just verified that a user with an Office license is able to download Office 365 ProPlus if the global Office download setting is turned On.

27. Leave this page open and continue to the next task to perform the user-driven installation for Laura Atkins.


### Task 3 – Perform a User-Driven Installation of Office 365 ProPlus 

In the prior task, you logged into Laura Atkins’ client PC, and you verified that she could download Office 365 ProPlus once Laura was assigned an Office 365 license and the global Office download setting was turned On. In this task, you will continue the process by having Laura perform a user-driven installation of the ProPlus suite from the Microsoft 365 portal.  

1. On the Client 1 VM (LON-CL1), you should still be logged in as Laura Atkins. 

2. You should still be in Laura’s **My account** window, since this is where you left off at the end of the prior task. Under the **Office apps &amp; devices** section, the **Install Office** button now appears, since Laura is assigned an Office 365 E5 license and the global Office download setting is turned On.<br/>

	‎**Important:** Selecting this **Install Office** button will install the 64 bit, English version of Office 365 ProPlus. However, if you want to install a different language or version, then select **View apps &amp; devices**, which opens the **Apps &amp; devices** page; this enables you to select a different language and version of Office 365 ProPlus to install. 

	Since Laura wants to install the 64 bit English version of ProPlus, select the **Install Office** button.
		
3. In the **Just a few more steps** window that appears, select **Close**.

4. In the notification bar that appears at the bottom of the page, select **Save** to download the 64 bit Office 365 ProPlus installation wizard to the client PC.

5. Once the Office 365 ProPlus installation file has finished downloading, select **Run** in the notification bar that appears at the bottom of the page.

6. If a **Do you want to allow this app to make changes to your device?** dialog box appears, type **adatum\administrator** in the **username** box, type **Pa55w.rd** in the **Password** box, and then select **Yes**. 

7. You may receive a dialog box that displays a warning message indicating that it may be expensive to continue downloading. Select **OK.** <br/>

	‎**Important:** This window may appear behind the Office window that displays the message: **We’re getting things ready.** If so, move the Office window to the side so that you can respond to the warning message. The Office install will NOT proceed until you select **OK** on the warning message (the Office window will just keep displaying the **We’re getting things ready** message, but it won’t actually do anything).

8. The installation may take several minutes to complete. Once the installation finishes, select **Close**.

9. To verify Laura's Office 365 ProPlus installation, select the **Start** icon in the lower-left corner of the taskbar. Below the **Recently added** section (at the top of the **Start** menu) select **Expand** to display all the Office 365 ProPlus apps that were just installed. This should include Excel, Skype for Business, Access, Publisher, Outlook, PowerPoint, and Word.

10. Select your **Edge** browser icon on the taskbar, and on your **My account** window select **Apps &amp; devices** in the left-hand navigation pane. 

11. In the **Apps &amp; devices** page, under the **Office** section, select **DEVICES** to expand it. This displays all the devices on which you've currently installed Office 365 ProPlus. LON-CL1 should be the only device listed. 

12. Select the **Start** icon on the taskbar, and then in the **Start** menu, select **Word**.

13. On the **Accept the license agreement** window, select **Accept**.

14. On the **Your privacy option** window, select **Close**.

15. Verify that Word is functioning properly by opening a blank Word document, entering some text, and saving the document to the **Documents** folder. 

16. Close Word.

17. Leave the Client 1 VM open as you will continue from this point in the next task.


# Proceed to Lab 4 - Exercise 2
