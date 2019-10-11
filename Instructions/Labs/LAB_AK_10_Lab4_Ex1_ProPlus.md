# Module 10 - Lab 4 - Exercise 1 - Manage an Office 365 ProPlus Installation

You are the Enterprise Administrator for Adatum Corporation, and you have Microsoft 365 deployed in a virtualized lab environment. In this lab, you will perform the tasks necessary to manage a user-driven Office 365 ProPlus installations. You will also deploy and configure Office Telemetry components.

In this exercise you will learn how to download and manage the Office 365 ProPlus suite for an individual user. 

### Task 1 – Prepare a User Account for Installing Office 365 ProPlus

Performing a user-driven Office 365 ProPlus installation is a two-step process: 1) configuring the user account so the user is eligible to download and install the Office 365 deployment tool, and 2) performing the installation. 

In this task, you will complete the first step by reviewing several user accounts to see which are eligible to perform a user-driven installation. In doing so, you will see what factors play a role in determining whether a user can download the deployment tool. In the next task, you will install the Office 365 ProPlus suite for one of the users.

‎**Note:** There are two ways in which a user can be blocked from downloading the Office 365 ProPlus suite. First, an individual user can be prohibited from downloading Office 365 ProPlus if he or she does not have an appropriate Microsoft 365 license (which you will verify in this task with Laura Atkins). Second, all users can be prohibited from downloading Office 365 ProPlus if an admin turns off the global Office download setting that controls the downloading of mobile and desktop apps for all users (which you will verify with Adam Hobbs).<br/>

1. You should switch to your Domain Controller VM (LON-DC1) and if necessary, log in as **ADATUM\Administrator** and password **Pa55w.rd.**

2. Open Internet Explorer. In your browser go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/** 

3. In the **Pick an account** window, select **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider).

4. In the **Enter password** dialog box, enter **Pa55w.rd** and then select **Sign in**.

5. In the **Microsoft Office Home** page, select **Admin**, which opens the Microsoft 365 admin center.

6. In the **Microsoft 365 admin center**, in the left-hand navigation pane, select **Users** and then select **Active Users**. 

7. We’ll begin by testing whether a user without an appropriate Microsoft 365 license can install Office 365 ProPlus. For this test, you will switch to the Client 1 VM (LON-CL1) and log in as **Laura Atkins**. You added Laura in Lab 1, but you did not assign her an Office 365 E5 license. <br/>

	‎In the **Virtual Machine** box at the top of the VM, select the drop-down arrow and select the Client 1 VM (**LON-CL1**). 

8. Once the Client 1 VM opens, at the top of the VM, select the **Actions** drop-down arrow and select **Ctrl+Alt+Delete**. This will display the log-in credentials for the **ADATUM\Administrator** account. Since you want to log in as Laura, select **Other user** in the lower-left portion of the desktop.

9. In the **Other user** log in, enter **adatum\laura** with a password of **Pa55w.rd.**

10. In the Client 1 VM, Laura prefers to use Microsoft Edge as her browser. Select **Microsoft Edge** either on the desktop or on the taskbar.

11. In **Microsoft Edge**, maximize your browser, then go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/**

12. In the **Sign in** window, enter **Laura@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider) and then select **Next**.

13. In the **Enter password** window, enter **Pa55w.rd** and then select **Sign in.**

14. In the **Stay signed in?** window, select **Yes.**

15. In the **Microsoft Office Home** page for Laura, notice that no apps appear. Select the **Install Office** drop-down arrow, and then select **Install software**.

16. This displays the **My installs** window for Laura. Note the message that appears at the top of page. Laura has not been assigned an Office license that includes the Office desktop apps, so she’s unable to install Office 365 ProPlus. <br/>
	
	‎**Important:** You have just verified that a user cannot download Office 365 Pro Plus if he or she has not been assigned an appropriate Office license.

17. You’re now going to test whether users can be prohibited from downloading Office 365 ProPlus if an admin such as Holly turns off the global Office download setting that controls the downloading of mobile and desktop apps for all users.<br/>
	
	‎You need to switch back the Domain Controller VM, so select the drop-down arrow in the **Virtual machine** field at the top of the VM and select the Domain Controller VM (LON-DC1). You should still be logged in as Holly Dickson, Adatum’s Global Administrator.

18. To turn off the global Office download setting, select the **Microsoft 365 admin center** tab in your browser, select **Show all** in the left-hand navigation pane, select **Settings,** and then select **Services &amp; add-ins**. 

19. In the **Services and add-ins** window, scroll down through the list of services and add-ins and select **Office software download settings.**

20. In the **Office software download settings** window, under the **Apps for Windows and mobile devices** section, the **Office (includes Skype for Business)** check box is currently selected. Select this check box so that it’s blank, which turns this feature Off. 

21. Select **Save** **changes** (which replaces the text in this button with a check mark).

22. Select the X in the upper-right corner of this window to close it. 

23. Let’s now see whether turning off this global download setting affects a licensed user from installing Office 365 ProPlus. In this case, we’re going to use **Adam Hobbs**. Let’s first check Adam’s license status. <br/>
	
	‎In the **Microsoft 365 admin center**, in the **Active users** list, select **Adam Hobbs**. 

24. In Adam Hobbs’ account window, select the **Licenses and Apps** tab. In the **Licenses** section, note that Adam has not been assigned a license. Like Laura Atkins, you did not assign Adam a license when you added his account in Lab 1; therefore, you must assign Adam an Office 365 E5 license now.<br/>

	In the **Licenses and Apps** tab, select the **Office 365 E5** check box and then select **Save changes**. You can then close Adam’s account window.

25. Let’s now check whether Adam can download Office 365 ProPlus on to his client PC when the global Office download setting has been turned Off. To do this, you must switch back to the Client 1 VM and log in as Adam.<br/>
	
	‎In the **Virtual machine** field at the top of the VM, select the drop-down arrow and select the Client 1 VM (LON-CL1).

26. Once the Client 1 VM opens, at the top of the VM, select the **Actions** drop-down arrow, select **Ctrl+Alt+Delete,** and then on the desktop select **Switch user**. This will display the log-in credentials for **Laura Atkins**, who last used this VM. Since you want to log in as Adam Hobbs, select **Other user** in the lower-left portion of the desktop.

27. In the **Other user** log in, enter **adatum\adam** and password **Pa55w.rd.**

28. In the Client 1 VM, Adam also prefers to use Microsoft Edge as his browser. Select **Microsoft Edge** either on the desktop or on the taskbar.

29. In **Microsoft Edge**, maximize your browser, then go to the **Microsoft Office Home** page by entering the following URL in the address bar: **https://portal.office.com/**

30. In the **Sign in** window, enter **Adam@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider) and then select **Next**.

31. In the **Enter password** window, enter **Pa55w.rd** and then select **Sign in.**

32. In the **Stay signed in?** window, select **Yes.**

33. If a **Get your work done with Office 365** window appears, select the X in the upper-right corner to close it.

34. In the **Microsoft Office Home** page for Adam, select the **Install Office** drop-down arrow, and then in the drop-down menu, select **Other install options**.<br/>
	
	‎**Note:** After selecting the **Install Office** button, you would typically select the **Office 365 apps** option to initiate the installation (unless you needed to select a different language or install other apps available with your subscription, in which case you would select **Other install options**). <br/>
	
	However, in this lab, we want you to verify that with the Global Office download setting turned Off, you cannot install Office. If you select the **Office 365 apps** option, you can select the taskbar option to run the .exe setup program, in which case it will download the file and start to run the program; however, because the Global Office download setting is turned Off, the setup will start but then immediately hang and not proceed through the installation. On the other hand, by selecting **Other install options** as you have been directed to do so in this step, it will open the **My installs** window (in the next step) and display a message indicating that Office installs are turned off. You were purposely directed to select **Other install options** to see this message.

35. In the **My installs** window for Adam, in the **Office** section at the top of the page, a message is displayed indicating that the admin (Holly) has turned off Office installs. <br/>
	
	‎**Important:** You have just verified that a licensed user is unable to download Office 365 ProPlus if the global Office download setting has been turned Off.

36. At this point you want Holly to turn the global Office download setting back On so that you can see if Adam can download Office 365 ProPlus. To do this, you must switch back the Domain Controller VM.<br/>
	
	‎To do so, select the drop-down arrow in the **Virtual machine** field at the top of the VM and select the Domain Controller VM (LON-DC1). You should still be logged in as Holly Dickson.

37. The **Microsoft 365 admin center** should still be displaying the **Services and add-ins** window. Select **Office software download settings.**

38. In the **Office software download settings** window, under the **Apps for Windows and mobile devices** section, the **Office (includes Skype for Business)** check box is currently blank. Select this check box so that it displays a checkmark, which now turns this feature back On.

39. Select **Save** **changes** (which replaces the text in this button with a check mark).

40. Select the X in the upper-right corner of this window to close it. 

41. Now that this global Office download option is turned back On, let’s see how it affects Adam’s ability to download Office 365 ProPlus. To do this, you must switch back to the Client 1 VM. <br/>
	
	‎In the **Virtual machine** field at the top of the VM, select the drop-down arrow and select the Client 1 VM (LON-CL1).

42. The Client 1 VM will open where it left off, which is displaying the **My installs** window from Adam’s **My account** page. The **My installs** window is still displaying the message from earlier when the global Office download option was turned off. Since you just turned this option back on, you need to refresh this page to see how it affects Adam’s ability to download Office 365 ProPlus. Select the **refresh icon** that appears to the left of the address bar. 

43. Once the **My installs** window refreshes, notice how the Office section at the top of the page provides the ability to install Office.<br/>
	
	‎**Important:** You have just verified that a user with an Office license is able to download Office 365 ProPlus if the global Office download setting is turned On.

44. Leave this page open and continue to the next task to perform the user-driven installation for Holly Dickson.


### Task 2 – Perform a User-Driven Installation of Office 365 ProPlus 

In the prior task, you logged into Adam Hobbs’ client PC, and you verified that he could download Office 365 ProPlus. In this task, you will continue the process by having Adam perform a user-driven installation of the ProPlus suite from the Microsoft 365 portal.  

1. On the Client 1 VM (LON-CL1), you should still be logged in as Adam Hobbs. 

2. You should still be in Adam’s **My installs** window, since this is where you left off at the end of the prior task. Under the **Office** section, you can see that you have the ability to download Office since Adam is assigned an Office 365 E5 license and the global Office download setting is turned On.<br/>

	‎To install Office 365 ProPlus to your PC, select the **Language** that you need, select the **64-bit** **Version**, and then select the **Install Office** button.

3. In the **Just a few more steps** window, select **Close**.

4. In the notification bar that appears at the bottom of the page, select **Run** to download and run the installation wizard on the client PC.

5. If a **Do you want to allow this app to make changes to your device?** dialog box appears, type **adatum\administrator** in the **username** box, type **Pa55w.rd** in the **Password** box, and then select **Yes**. 

6. You may receive a warning indicating that it may be expensive to continue downloading. Select **OK.** <br/>

	‎**Important:** This window may appear behind the Office window that displays the message: **We’re getting things ready.** If so, move the Office window to the side so that you can respond to the warning message. The Office install will NOT proceed until you select **OK** on the warning message (the Office window will just keep displaying the **We’re getting things ready** message, but it won’t actually do anything).

7. The installation may take several minutes to complete. Select **Close** to close the wizard when it finishes. 

8. Now let’s verify that you can use one of the Office 365 ProPlus apps. Select the **Start** icon in the lower-left corner of the taskbar. In the **Start** screen, scroll down and you’ll notice the following apps that are flagged as **New**: Access, Excel, Outlook, PowerPoint, Publisher, Skype for Business, and Word.

9. In the **Start** screen, select **Word** to open it. 

10. If the **Sign in and Setup Office** window appears, perform the following steps:

	- Select **Sign in**.

	- In the **Activate Office** window, enter **Adam@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider) and then select **Next**.

	- In the **Enter password** window, enter **Pa55w.rd** and then select **Sign in.**

	- In the **Use this account everywhere on your device** window, select **Yes**.

	- In the **You’re all set** window, select **Done**.

11. Open a blank document, enter some text, save it to the **Documents** folder, and then close Word. 

12. In the **Accept the license agreement** window, select **Accept**.

13. Switch to your **Edge** browser and select the **My account** tab. This displays the status of your installs prior to the Office 365 ProPlus installation; therefore, select the **Refresh** icon at the top of the page, to the left of the address bar. 

14. After refreshing the **My account** page, it displays the **My account** tab in the left-hand navigation pane. Note in the **Install status** section that there’s 1 detected install.

15. Leave the Client 1 VM open as you will continue from this point in the next task.


# Proceed to Exercise 2
