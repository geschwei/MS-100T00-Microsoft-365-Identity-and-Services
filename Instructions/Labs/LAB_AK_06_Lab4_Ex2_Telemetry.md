# Module 6 - Lab 4 - Exercise 2 - Implement Office Telemetry Components 

In this exercise, you will configure the Microsoft 365 Telemetry engine on the LON-CL1 VM to gather information about the Adatum’s Microsoft 365 client. 

### Task 1 – Prepare to Deploy Office Telemetry Components 

Before you can install the Telemetry Processor in the next task, the Client 1 VM (LON-CL1) must first be prepped for the installation. To do so, you will log into LON-CL1 as the administrator account and create a folder on the C Drive for storing the Telemetry components. The final step in the preparation process is to verify that the SQL Server 2017 services that are installed on LON-CL1 are all running. 

1. After having completed the previous exercise, you should still be logged into the Client 1 VM (LON-CL1) as **Laura Atkins**. To install the Telemetry processor, you will log out as Laura and log back in as the **adatum\administrator** account. <br/>

	‎If your LON-CL1 VM is still open to your browser, then in your lab hosting environment, select the **Ctrl+Alt+Delete** option, select **Sign out** in the menu that appears, select the desktop, and then on the log-in screen, select **Other User**. 
	
	However, if you LON-CL1 VM displays the desktop with the sign-in screen for Laura Atkins, then select **Other User**.

2. On the **Other user** log in screen, enter **adatum\administrator** in the **User name** field, and enter **Pa55w.rd** in the **Password** field. 

3. On the desktop, select the **File Explorer** icon on the taskbar. Maximize the File Explorer window that opens. 

4. In the **File Explorer** window, expand **This PC** (if necessary) and then right-click on **Local Disk (C:)**. In the menu that appears, select **New**, and then select **Folder**. 

5. In the **New folder** field, enter **Telemetry** as the folder name and then press Enter.

6. Minimize the **File Explorer** window as you will use it in the next task. 

7. If a **Welcome to Microsoft Teams!** window appears, then close it.

8. Select the **Start** icon in the lower-left corner of the taskbar. 

9. In the **Start** menu, scroll down to the **Microsoft SQL Server 2017** program group, select it to expand the group, and then select **SQL Server 2017 Configuration Manager**.

10. If a **Do you want to allow this app to make changes to your device?** window appears, select **Yes**. 

11. In the **Sql Server Configuration Manager** window, select **SQL Server Services** in the left-hand pane. 

	- Verify that the **State** of all three services is **Running**. If any of the services is **Stopped**, then right-click on the service and select **Start** in the menu. 
	- Verify that the **Start Mode** for all three services is set to **Automatic**. If any of the services is set to **Manual**, right-click on the service, select **Properties**, and in the **Properties** window, select the **Service** tab and change the **Start Mode** to **Automatic**.  

12. Close the Sql Server Configuration Manager window.

13. You have now completed the prerequisites needed to install the Telemetry Processor. Leave the LON-CL1 VM open and proceed to the next task to install the Telemetry Processor. 


### Task 2 - Install the Telemetry Processor  

The Office Telemetry Processor runs on one or more computers and collects inventory, usage, and health data from a shared folder and imports the data to a SQL Server database controlled by your organization (the data is NOT sent to Microsoft). The processor is installed as a Windows service named "Office Telemetry Processor."

In this task, you will install the Telemetry Processor so that Adatum can begin collecting data as part of its Office Telemetry pilot project. 

1. After having completed the previous task, you should still be on the Client 1 VM (LON-CL1) and logged in as **adatum\administrator**. 

2. On the taskbar, type **Telemetry** in the **Search** box.

3. In the list of search results, select **Telemetry Dashboard for Office**. This opens a **TelemetryDashboard1.xlsx** file in **Microsoft Excel**.

4. In **Microsoft Excel**, select the **Getting started** worksheet. 

5. Select **step 1 - Set up prerequisites**. 

6. Review the prerequisite information. You will use Microsoft SQL Server 2017, which is already installed on LON-CL1 for this lab; therefore, you do not need to install Microsoft SQL Server Express Edition as noted in this prerequisite. Select **Set up prerequisites** to collapse step 1. 

7. Select **step 2 - Install Telemetry Processor**. In this step, select the **Install Telemetry Processor on This Computer** button. 

8. This starts the **Microsoft Office Telemetry Processor (x64) Setup Wizard**. Select **Next** on the **Welcome** page.

9. If a **Do you want to allow this app to make changes to your device?** window appears, select **Yes**. 

10. In the **Completed the Microsoft Office Telemetry Processor (x64) Setup Wizard** page, select **Finish**. Since the **Run the Office Telemetry Processor settings wizard now** check box is selected, this settings wizard will begin once you select **Finish**.

11. If a **Do you want to allow this app to make changes to your device?** window appears, select **Yes**. 

12. This initiates the **Office Telemetry Processor settings** wizard. The **Getting Started** window opens, but it may stay minimized on the taskbar. If so, select the icon on the taskbar to maximize the **Getting Started** window. On the **Getting Started** window, select **Next.**

13. On the **Database Settings** page, select the drop-down arrow in the **SQL Server** field and in the menu that appears, select **(local)\TELEDASH** and then select **Connect**. 

14. In the **SQL database** box, type **Dashboard**, and then select **Create**. This displays a processing window that displays the status of the Dashboard database being created. Once the database has been created, the processing window will disappear. At this point, select **Next**. 

15. In the **Office Telemetry Processor settings wizard** dialog box, select **Yes** to configure the database now. 

16. On the **Shared Folder** page, in the **Path** box, type **C:\Telemetry**, which is the location of the folder that you created at the start of this task for storing data from client computers. Select **Next**. 

17. In the **Office Telemetry Processor settings wizard** dialog box, read the information provided for sharing permissions and then select **Yes** to configure the folder now.

18. On the **Microsoft Customer Experience Improvement Program** page, select the **I don’t want to sign up for the program at this time** option and then select **Next**. 

19. Select **Finish** to complete the wizard. 

20. Leave the Telemetry Dashboard open in Excel for the next task.
 

### Task 3 - Manage the Office 2019 Group Policy Administrative Templates  

In this task, you will download the Office 2019 Group Policy Administrative Template files (ADMX/ADML). These files are used by Group Policy to configure installations of Office 365 products, such as Office 365 ProPlus, and volume licensed versions of Office 2016 and Office 2019. You can also use the group policy templates to enable and configure agents such as the Office Telemetry agent. 

To enable and configure the agent, you can edit the registry on each monitored client computer in small or test environments. For production environments that contain hundreds or thousands of client computers, you can use Group Policy administrative templates. For the purpose of this lab, you will use the group policy templates to enable and configure the Office Telemetry agent.

1. On **LON-CL1**, you should still be logged in as adatum\administrator. If necessary, log in as **adatum\administrator** with a Password of **Pa55w.rd**.

2. The **Telemetry Dashboard for Office** spreadsheet should still be open in Excel from the prior task; however, if you closed it at the end of the prior task, then on the taskbar, type **Telemetry** in the **Search** box and then select **Telemetry Dashboard for Office**.

3. On the **Getting started** worksheet, note that you will NOT run **step 3 - Deploy Telemetry Agent.** The reason this step is skipped is that the Telemetry Agent is included in Office 2013 and later client computers. Therefore, you should skip step 3 and instead select **step 4 - Configure Telemetry Agent**. 

4. Under **step 4 - Configure Telemetry Agent**, select the **Download Office Administrative Templates files** link. This opens your Microsoft Edge browser and displays the **Microsoft Download Center** for the **Administrative Template files (ADMX/ADML) and Office Customization Tool for Office 365 ProPlus, Office 2019, and Officed 2016**. 

5. On this **Microsoft Download Center** window, scroll down and select the **Download** button. 

6. On the **Choose the download you want** window, select the check box for the 64 bit version of the administrative templates file (as of this writing, the file name is **admintemplates_x64_4966-1000_en-us.exe**; Note: the version number in this file name (4966-1000) may change if a more current file has been released by the time you run this lab), and then select **Next**. 

7. In the notification bar that appears at the bottom of the page, select **Save** to download the file to the **Downloads** folder on your LON-CL1 VM.

	**Important:** Once the download has finished, a notification bar will appear at the bottom of the page asking whether you want to run the downloaded file. **Do NOT select Run; instead, select the X to close this notification bar.** You will not run the file on the LON-CL1 VM; instead, in the remaining steps in this task you will switch over to the domain controller VM (LON-DC1) and run the dowloaded file there.
	
8. Switch to the Domain Controller VM (LON-DC1). You should still be signed in as **adatum\Administrator**.  

9. On LON-DC1, right-click on the **Start** button on the taskbar and in the menu that appears, select **Run**. 

10. In the **Run** window, type **\\LON-CL1\C$\Users\Administrator.ADATUM\Downloads** and then select **OK**. This opens a File Explorer window that displays the Downloads folder on LON-CL1. 

11. In the **File Explorer** window, the **C:\Users\Administrator.ADATUM\Downloads** folder appears. In the right-hand pane, double-click the **admintemplates_x64_4966-1000_en-us.exe** file to run it.  

12. If a **Do you want to run this file?** dialog box appears, select **Run**.

13. This initiates the **Microsoft Office Administrative Templates** wizard. If **The Microsoft Office Administrative Templates** window does not appear, select the icon for this wizard on the taskbar to display it. 

14. In **The Microsoft Office Administrative Templates** window, select the check box to accept the Microsoft Software License Terms, and then select **Continue**.  

15. In the **Browse For Folder** dialog box that appears, expand **This PC**, select the **Documents** folder, and then select **OK**. 

	**Note:** This will extract all the template files into a child folder (under **Documents**) titled **admx**.

16. In the **Files extracted successfully** dialog box, select **OK**. 

17. In the **File Explorer** window, under **This PC**, expand the **Documents** folder and then select the **admx** child folder. 

18. Select all the files in the **admx** folder, then right-click and select **Copy** to copy all the selected files to the clipboard. 

19. In the **File Explorer** window, browse to **C:\Windows\PolicyDefinitions**, then right-click in the **PolicyDefinitions** folder and select **Paste** to copy the **admx** files into the **PolicyDefinitions** folder. 

20. Close File Explorer. 

21. Select the **Search** icon on the taskbar and then type **Group Policy** in the **Search** box.

22. In the list of search results, select **Group Policy Management**. 

23. In the **Group Policy Management Console**, expand **Forest: Adatum.com.**, expand **Domains**, expand **Adatum.com**, and then select the **IT** folder. 

24. Right-click on the **IT** folder and select **Create a GPO in this domain, and Link it here**. 

25. In the **New GPO** dialog box, in the **Name** field, type **Office Telemetry Agent Settings** and then select **OK**. 

26. In the left-hand pane in the **Group Policy Management** console, expand **IT**, and then select **Office Telemetry Agent Settings**. 

27. If a **Group Policy Management Console** dialog box appears indicating you have selected a link to a GPO, select the **Do not show this message again** check box and then select **OK**.

28. In the left-hand pane in the **Group Policy Management** console, right-click **Office Telemetry Agent Settings** and then select **Edit**. 

29. In the **Group Policy Management Editor** window, under the **User Configuration** section in the left-hand pane, expand **Policies**, expand **Administrative Templates**, expand **Microsoft Office 2016**, and then select **Telemetry Dashboard**. 

30. Maximize the **Group Policy Management Editor** window. This will enable you to see the **State** column, which is important for you to ensure that you have enabled the necessary settings.

31. In the list of settings, right-click **Turn on telemetry data collection** and select **Edit**. In the **Turn on telemetry data collection** window, select **Enabled**, and then select **OK**. 

32. In the list of settings, right-click **Turn on data uploading for Office Telemetry Agent** and select **Edit**. In the **Turn on data uploading for Office Telemetry Agent** window, select **Enabled**, and then select **OK**.  

33. In the list of settings, right-click **Specify the UNC path to store Office telemetry data** and select **Edit**. In the **Specify the UNC path to store Office telemetry data** window, select **Enabled**. Under the **Options:** section, in the **UNC path to store Office telemetry data** field, type **\\LON-CL1\Telemetry** and then select **OK**. 

34. In the list of settings, right-click **Specify custom tags for Office telemetry data** and select **Edit**. In the **Specify custom tags for Office telemetry data** window, select **Enabled**. In the **Tag 1** box, type **Pilot** and then select **OK**. 

35. In the list of settings, the **State** of the four settings that you edited in the prior steps should all be **Enabled**.

36. Close the Group Policy Management Editor console. 

 

### Task 4 - Force Group Policy Update and manually trigger data collection  

In this task, you will update the group policy templates that you downloaded and configured in the prior task. Updating the templates will expedite the data collection process by enforcing it on the LON-CL1 PC. Once you have forced an update of the group policy templates, you will then create a Word doc so that you can later see this activity in the data that is captured by the Office Telemetry agent.

It is important to note that when a user logs into an Office client in a normal production environment, the Office Telemetry agent waits 10 minutes to allow other logon processes to be completed, and then waits a randomized number of minutes for up to 4 hours to avoid client computers sending data to the network at the same time. After this initial scan, the Office Telemetry agent scans and collects data every 8 hours.

Obviously, waiting this length of time to collect data will not work in our lab environment, or in selected test scenarios. To bypass the normal Office Telemetry agent scan times, you can manually trigger the data collection by running the OfficeTelemetryAgentLogOn2016 task within the Task Scheduler app. This is the process you will perform in this task. You will then view the collected data in the next task.

1. Switch to **LON-CL1.** You should still be signed in as the **adatum\Administrator**. If necessary, log in as the  **Administrator** with a Password of **Pa55w.rd**.
 
2. On the taskbar, right-click on the **Start** icon and select **Run**. 

3. In the **Run** window, type **gpupdate /force** in the **Open:** field and then select **OK**. 

4. Wait for the group policy update to complete. 

5. You will now create a Word document so that you can later see this activity in the Office Telemetry data that is captured. Select the **Start** icon, and in the **Start** menu, select **Word**. 

6. Open a blank document in Word, enter some text in the document and then save it in the **Documents** folder. 

7. Close Word. 

8. You will now manually trigger the data collection process. On the taskbar, type **schedule** in the **Search** box. In the list of search results, right-click on **Task Scheduler** and select **Run as administrator**. 

9. Maximize the **Task Scheduler** window.

10. In the **Task Scheduler** window, in the console tree on the left, expand **Task Scheduler Library**, expand **Microsoft**, and then select **Office**. 

11. In the **Results** pane, drag the right edge of the **Name** column to the right so that you can see the entire name of each task. 

12. Select **OfficeTelemetryAgentLogOn2016**, then right-click on it and select **Run** in the menu that appears. Verify that the **Status** of **OfficeTelemetryAgentLogOn2016** changed from **Ready** to **Running**. 

13. Close the Task Scheduler window. 
   

### Task 5 - Review Telemetry Data   

In this task, you will open the Office Telemetry Dashboard to review the data that was collected when you manually triggered the data collection process in the prior task. 

1. On **LON-CL1**, you should still be signed in as **adatum\administrator**.

2. Select the **Excel** icon on the taskbar at the bottom of the page to display the Telemetry Dashboard1 spreadsheet.

3. In the **Telemetry Dashboard** spreadsheet, in the **Getting started** workbook, select **step 5 - Connect to the database to view telemetry data**. 

4. Select **Connect to Database**. 

5. In the **Data connection settings** dialog box, in the **SQL database** field, verify that **Dashboard** is displayed as the name of the SQL database, and then select **Connect**. 

6. This opens a window indicating that a query is being processed. After the query is complete, a spreadsheet is displayed with multiple workbooks. Select the **Documents** workbook. 

7. Notice the documents reported. 

8. Select the **Solutions** menu. 

9. Review the add-ins that have been reported as installed. Scroll right to see which add-ins are built into the application. 

10. Close Microsoft Excel, and at the prompt, select **Don’t Save**.


# End of Lab 4

