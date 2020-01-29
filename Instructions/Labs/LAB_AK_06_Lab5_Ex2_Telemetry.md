# Module 6 - Lab 5 - Exercise 2 - Implement Office Telemetry Components 

In this exercise, you will configure the Microsoft 365 Telemetry engine on the LON-CL1 VM to gather information about the Adatum’s Microsoft 365 client. 

### Task 1 – Prepare to Deploy Office Telemetry Components 

Before you can install the Telemetry Processor in the next task, the Client 1 VM (LON-CL1) must first be prepped for the installation. To do so, you will log into LON-CL1 as the administrator account and create a folder on the C Drive for storing the Telemetry components. The final step in the preparation process is to verify that the SQL Server 2017 services that are installed on LON-CL1 are all running. 

1. After having completed the previous exercise, you should still be logged into the Client 1 VM (LON-CL1) as **Laura Atkins**. To install the Telemetry processor, you will log out as Laura and log back in as the **adatum\administrator** account. <br/>

	‎Select the **Actions** field at the top of the VM, and in the drop-down menu select **Ctrl+Alt+Delete**.

2. In the menu that appears, select **Sign out**.

3. Select the desktop, and then on the log-in screen that appears, select **Other User**. 

4. On the **Other user** log in screen, enter **adatum\administrator** in the **User name** field, and enter **Pa55w.rd** in the **Password** field. 

5. If a **Welcome to Microsoft Teams** window appears, then close it.

6. On the desktop, select the **File Explorer** icon on the taskbar. 

7. In the **File Explorer** window, expand **This PC** and then right-click on **Local Disk (C:)**. In the menu that appears, select **New**, and then select **Folder**. 

8. In the **New folder** field, enter **Telemetry** as the folder name and then press Enter.

9. Minimize the **File Explorer** window as you will use it in the next task. 

10. If a **Welcome to Microsoft Teams** window appears, then close it.

11. Select the **Start** icon in the lower-left corner of the taskbar. 

12. In the **Start** menu, scroll down to the **Microsoft SQL Server 2017** program group, select it to expand the group, and then select **SQL Server 2017 Configuration Manager**.

13. In the **Do you want to allow this app to make changes to your device?** window, select **Yes**. 

14. In the **Sql Server Configuration Manager** window, select **SQL Server Services** in the left-hand pane. 

	- Verify that the **State** of all three services is **Running**. If any of the services is **Stopped**, then right-click on the service and select **Start** in the menu. 
	- Verify that the **Start Mode** for all three services is set to **Automatic**. If any of the services is set to **Manual**, right-click on the service, select **Properties**, and in the **Properties** window, select the **Service** tab and change the **Start Mode** to **Automatic**.  

15. Close the Sql Server Configuration Manager window.

16. You have now completed the prerequisites needed to install the Telemetry Processor. Leave the LON-CL1 VM open and proceed to the next task to install the Telemetry Processor. 


### Task 2 - Install the Telemetry Processor  

The Office Telemetry Processor runs on one or more computers and collects inventory, usage, and health data from a shared folder and imports the data to a SQL Server database controlled by your organization (the data is NOT sent to Microsoft). The processor is installed as a Windows service named "Office Telemetry Processor."

In this task, you will install the Telemetry Processor so that Adatum can begin collecting data as part of its Office Telemetry pilot project. 

1. After having completed the previous task, you should still be on the Client 1 VM (LON-CL1) and logged in as adatum\administrator. 

2. On the taskbar, type **Telemetry** in the **Search** box.

3. Select **Telemetry Dashboard for Office**. This opens a **TelemetryDashboard1.xlsx** file in **Microsoft Excel**.

4. If an **Accept the license agreement** window appears, then select the **Accept** button. If a **Your privacy option** window appears, then select **Close**. 

5. In **Microsoft Excel**, select the **Getting started** worksheet. 

6. Select **step 1 - Set up prerequisites**. 

7. Review the prerequisite information. You will use Microsoft SQL Server 2017 that is already installed on LON-CL1 for this lab, so you do not need to install Microsoft SQL Server Express Edition as noted in this prerequisite. Select **Set up prerequisites** to collapse step 1. 

8. Select **step 2 - Install Telemetry Processor**. In this step, select the **Install Telemetry Processor on This Computer** button. 

9. This starts the **Microsoft Office Telemetry Processor (x64) Setup Wizard**. Select **Next** on the **Welcome** page.

10. In the **Do you want to allow this app to make changes to your device?** window, select **Yes**. 

11. In the **Completed the Microsoft Office Telemetry Processor (x64) Setup Wizard** page, select **Finish**. Since the **Run the Office Telemetry Processor settings wizard now** check box is selected, this wizard will begin once you select **Finish**.

12. In the **Do you want to allow this app to make changes to your device?** window, select **Yes**. 

13. This initiates the **Office Telemetry Processor settings** wizard. The **Getting Started** window opens, but it may stay minimized on the taskbar. If so, select the icon on the taskbar to maximize the **Getting Started** window. On the **Getting Started** window, select **Next.**

14. On the **Database Settings** page, select the drop-down arrow in the **SQL Server** field and in the menu that appears, select **(local)\TELEDASH** and then select **Connect**. 

15. In the **SQL database** box, type **Dashboard**, and then select **Create**. 

16. Select **Next**. 

17. In the **Office Telemetry Processor settings wizard** dialog box, select **Yes** to configure the database now. 

18. On the **Shared Folder** page, in the **Path** box, type **C:\Telemetry**, and then select **Next**. 

19. In the **Office Telemetry Processor settings wizard** dialog box, read the information provided for sharing permissions and then select **Yes**.

20. On the **Microsoft Customer Experience Improvement Program** page, select the **I don’t want to sign up for the program at this time** option and then select **Next**. 

21. Select **Finish** to complete the wizard. 

22. Leave the Telemetry Dashboard open in Excel for the next task.
 

### Task 3 - Manage the Office 2019 Group Policy Administrative Templates  

In this task, you will download the Office 2019 Group Policy Administrative Template files (ADMX/ADML). These files are used by Group Policy to configure installations of Office 365 products, such as Office 365 ProPlus, and volume licensed versions of Office 2019 and Office 2016. You will perform this task as part of your Office Telemetry pilot project for Adatum.

1. On **LON-CL1**, you should still be logged in as adatum\administrator. If necessary, log in as **adatum\administrator** with a Password of **Pa55w.rd**.

2. The **Telemetry Dashboard for Office** spreadsheet should still be open in Excel from the prior task; however, if you closed it at the end of the prior task, then on the taskbar, type **Telemetry** in the **Search** box and then select **Telemetry Dashboard for Office**.

3. On the **Getting started** worksheet, note that you will NOT run **step 3 - Deploy Telemetry Agent.** The reason this step is skipped is that the Telemetry Agent is included in Office 2013 and later client computers. Therefore, you should skip step 3 and instead select **step 4 - Configure Telemetry Agent**. 

4. Under **step 4 - Configure Telemetry Agent**, select the **Download Office Administrative Templates files** link. This opens your Microsoft Edge browser and displays the **Microsoft Download Center** for the **Administrative Template files (ADMX/ADML) and Office Customization Tool for Office 365 ProPlus, Office 2019, and Officed 2016**. 

5. On this **Microsoft Download Center** window, scroll down and select the **Download** button. 

6. On the **Choose the download you want** window, select the check box for the 64 bit version of the administrative templates file (as of this writing, the file name is **admintemplates_x64_4966-1000_en-us.exe**; Note: the version number in this file name (4966-1000) may change if a more current file becomes available), and then select **Next**. 

7. In the notification bar that appears at the bottom of the page, select **Save** to download the file to the **Downloads** folder.

	**Important:** Once the download has finished, a notification bar will appear at the bottom of the page asking whether you want to run the downloaded file. Do NOT select Run. You will not run the file on the LON-CL1 VM; instead, in the remaining steps in this task you will switch over to the domain controller VM (LON-DC1) and run the dowloaded file there.
	
8. Switch to the Domain Controller VM (LON-DC1). You should still be signed in as **ADATUM\Administrator**.  

9. On LON-DC1, select the **Search** icon on the taskbar and then type **Run** in the **Search** box. In the list of search results, select **Run**. 

10. In the **Run** window, type **\\LON-CL1\C$\Users\Administrator.ADATUM\Downloads** and then select **OK**. 

11. In the **File Explorer** window, the **C:\Users\Administrator.ADATUM\Downloads** folder appears. In the right-hand pane, double-click the **admintemplates_x64_4966-1000_en-us.exe** file to run it.  

12. This initiates the **Microsoft Office Administrative Templates** wizard. If **The Microsoft Office Administrative Templates** window does not appear, select the icon for this wizard on the taskbar to display it. 

13. In **The Microsoft Office Administrative Templates** window, select the check box to accept the Microsoft Software License Terms, and then select **Continue**.  

14. In the **Browse For Folder** window, expand **This PC**, select the **Documents** folder, and then select **OK**. 

	**Note:** This will extract all the template files into a child folder (under **Documents**) titled **admx**.

15. In the **Files extracted successfully** dialog box, select **OK**. 

16. In the **File Explorer** window, under **This PC**, expand the **Documents** folder and then select the **admx** child folder. 

17. Select all the files in the **admx** folder, then right-click and select **Copy** to copy all the selected files to the clipboard. 

18. In the **File Explorer** window, browse to **C:\Windows\PolicyDefinitions**, then right-click in the **PolicyDefinitions** folder and select **Paste** to copy the **admx** files into the **PolicyDefinitions** folder. 

19. Close File Explorer. 

20. Select the **Search** icon on the taskbar and then type **Group Policy** in the **Search** box.

21. In the list of search results, select **Group Policy Management**. 

22. In the **Group Policy Management Console**, expand **Forest: Adatum.com.**, expand **Domains**, expand **Adatum.com**, and then select **IT**. 

23. Right-click **IT** and select **Create a GPO in this domain, and Link it here**. 

24. In the **New GPO** dialog box, in the **Name** field, type **Office Telemetry Agent Settings** and then select **OK**. 

25. In the left-hand pane in the **Group Policy Management** console, expand **IT**, and then select **Office Telemetry Agent Settings**. 

26. If a **Group Policy Management Console** dialog box appears indicating you have selected a link to a GPO, select the **Do not show this message again** check box and then select **OK**.

27. In the left-hand pane in the **Group Policy Management** console, right-click **Office Telemetry Agent Settings** and then select **Edit**. 

28. In the **Group Policy Management Editor** window, under the **User Configuration** section in the left-hand pane, expand **Policies**, expand **Administrative Templates**, expand **Microsoft Office 2016**, and then select **Telemetry Dashboard**. 

29. In the list of settings that appear in the right-hand pane, right-click **Turn on telemetry data collection** and select **Edit**. 

30. In the **Turn on telemetry data collection** window, select **Enabled**, and then select **OK**. 

31. In the list of settings, right-click **Turn on data uploading for Office Telemetry Agent** and select **Edit**.  

32. In the **Turn on data uploading for Office Telemetry Agent** window, select **Enabled**, and then select **OK**.  

33. In the list of settings, right-click **Specify the UNC path to store Office telemetry data** and select **Edit**.

34. In the **Specify the UNC path to store Office telemetry data** window, select **Enabled**. Under the **Options:** section, in the **UNC path to store Office telemetry data** field, type **\\LON-CL1\Telemetry** and then select **OK**. 

35. In the list of settings, right-click **Specify custom tags for Office telemetry data** and select **Edit**. 

36. In the **Specify custom tags for Office telemetry data** window, select **Enabled**. In the **Tag 1** box, type **Pilot** and then select **OK**. 

37. Close the Group Policy Management Editor console. 

 

### Task 4 - Force Group Policy Update and Verify Policy Settings  

In this task, you will update the group policy templates that you downloaded and configured in the prior task. Updating the templates will expedite the data collection process by enforcing it on the LON-CL1 PC. You will then schedule and run a task that collects Office Telemetry Agent logon information.

1. Switch to **LON-CL1.** You should still be signed in as Adam Hobbs. 

2. On the desktop, point to the lower left corner, right-click **Start**, and then select **Run**. 

3. In the **Open** box, type **gpupdate /force**, and then select **OK**. 

4. Wait for the group policy update to complete. 

5. On the **Start** screen, open **Word 2016**. 

6. Skip if the activation dialog appears, select **Accept and start Word**. 

7. Type in the following text: <br/>

	**=rand(10,20)**

8. Wait for the text to generate and save the document as **Acquisition Strategy.docx** in the **Documents** folder. 

9. Close the open document and close File Explorer. 

10. Select **Start**. 

11. On the **Start** screen, type **Schedule tasks**. 

12. In the **Results** pane, select **Schedule tasks.** <br/>

	‎**Note:** Since you are logged in as Adam is a local administrator, you do not have to right-click on **Schedule tasks** and select **Run as administrator.** 

13. In the console tree, expand **Task Scheduler Library**, expand **Microsoft**, and then select **Office**. 

14. In the **Results** pane, right click **OfficeTelemetryAgentLogOn2016** and then select **Run**. You may need to expand the **Name** column to see the task names. 

15. Run the scheduled task again to ensure the data has been collected. 

16. Close the Task Scheduler. 
   

### Task 5 - Review Telemetry Data   

In this task, you will review the Telemetry data that has been collected at Adatum. 

1. On **LON-CL1**, you should still be signed in as Adam Hobbs.

2. In the **Telemetry Dashboard**, select **step 5 Connect to the database to view telemetry data**. 

3. Select **Connect to Database**. 

4. In the **Data connection settings** dialog box, in the **SQL database** box, verify that Dashboard is listed as the Database name, and then select **Connect**. 

5. After the query is complete, select **Documents**. 

6. Notice the documents reported. 

7. Select the **Solutions** menu. 

8. Review the add-ins that have been reported as installed. Scroll right to see which add-ins are built into the application. 

9. Close Microsoft Excel, and at the prompt, select **Don’t Save**.


# End of Lab 5

