# Module 3 - Lab 2 - Exercise 2 - Monitor and Troubleshoot Office 365  

In this exercise you will be introduced to some troubleshooting tools in Office 365 that enable you to troubleshoot mail flow issues. You will then analyze Adatum’s Office 365 service health by reviewing several of the key service health queries and reports that are available in Office 365. You will conclude this exercise by reviewing how to submit a service request with the Microsoft Support team should you ever need assistance with a problem.

### Task 1 - Troubleshoot Mail Flow in Office 365  

Holly Spencer, Adatum's new Enterprise Administrator, wants to prepare herself for any potential mail flow problems that may occur within Adatum’s Exchange environment. As part of her pilot project, she has decided to create a test scenario to analyze some of the troubleshooting options available to her. This task guides Holly though a variety of tools that she can use to troubleshoot different mail conflict scenarios. 

1. Switch to your Domain Controller (LON-DC1) VM. You should still be logged into Microsoft 365 as Holly Spencer.

2. In **Internet Explorer**, select the **Office 365 home page** tab, which should still be open (if not, navigate to **https://portal.office.com** and log in as **Holly@M365xZZZZZZ.onmicrosoft.com** and **Pa55w.rd**).

3. In the **Office 365 home page,** select **Outlook.** In the Outlook settings window that appears, accept **English** as the language, select your corresponding **Time zone**, and then select **Save**.

4. If a **Welcome** window appears, select the **X** in the upper right-hand corner to close it. 

5. In Holly’s mailbox, at the top of the left-hand navigation pane, select the **New message** button to create a new email.

6. In the email pane that appears on the right side of the window, in the **To** text box, type **user@alt.none**. 

7. Enter a subject and some body text and then send the email. 

8. Wait for the delivery failure message to appear in Holly’s Inbox, then double-click the message to open it in a new window. This will make it easier to copy the text of the message in the next step. 

9. In the **Underliverable: {subject of message}** window, scroll down through the message until you reach the body of text that says **Original message headers**. Select the text in the body of the message starting after **Original message headers** through the end of the message. With this text selected, press **Ctrl+C** to copy it to the clipboard.  

10. Close the message window.

11. Open a new tab in your web browser and enter the following URL: **https://testconnectivity.microsoft.com**. 

12. On the **Microsoft Remote Connectivity Analyzer** page, below the announcement at the top of the page, select the **Message Analyzer** tab. 

13. Under the **Message Header Analyzer**, it indicates that the Message Analyzer Header has moved to a new location. Select the link for the new location; this will open a new tab that displays the Message Header Analyzer. 

14. In the **Message Analyer Header** window, paste the message (right-click and select **Paste**) and then select **Analyze headers**. <br/>

	**Important:** Note the diagnostic information and the time taken for the message to be rejected. SMTP message headers contain a wealth of information that allows you to determine the origins of a message and how it made its way through one or more SMTP servers to its destination. Here’s a quick summary:

	- **Summary section**: Displays the most important properties and total delivery time at a quick glance.

	- **Received headers section**: Displays the more important header properties and delivery time. Enables you to analyze the received headers and displays the longest delays quickly for each discovery of sources of message transfer delays.

	- **Other headers section**: Enables you to quickly detect where the longest message transfer delays occurred. You can sort all headers by occurrence number, name or value.   

	The primary problem in this example (see Hop 1) is that the domain of the email address **(@alt.none**) does not exist. Normally this is caused by a typo in the recipient’s domain name that needs to be corrected to resolve the issue. 

15. Select **Clear** to reset the Message Header Analyzer window. 

16. Return to the **Mail - Holly Spencer - Outlook** tab in your browser. 

17. Select **New message**, and then in the **To** field for the email, type **difflop8675399@outlook.com**. 

18. Enter a subject and some body text, and then select **Send**. 

19. Wait for the delivery failure message to appear. When the message appears in Holly’s Inbox, double-click the message to open it in a separate window. 

20. In the **Underliverable: {subject of message}** window, scroll down through the message until you reach the body of text that says **Original message headers**. Select the text in the body of the message starting after **Original message headers** through the end of the message. With this text selected, press **Ctrl+C** to copy it to the clipboard. 

21. Close the message window.

22. Switch to the **Message Header Analyzer** tab in your browser. 

23. In the **Message Header Analyzer** box, right-click and select **Paste** to paste in the message, and then select **Analyze headers**. <br/>

	**Note:** Review the diagnostic information and the time taken for the message to be rejected. In the prior email, the domain of the email address did not exist. In this email, the user's domain (outlook.com) was valid, but the user mailbox (**difflop8675399@outlook.com**) does not exist. 

24. Close the **Microsoft Remote Connectivity Analyzer** tab and the **Message Header Analyzer** tab in Internet Explorer. 

25. Select the **Microsoft Office Home** tab in Internet Explorer and then select **Admin**. 

26. On the **Microsoft 365 admin center** page, in the left-hand navigation pane, select **Show all**. 

27. Scroll down through left-hand navigation pane, and under **Admin centers,** select **Exchange**. This will open the Exchange Admin Center.

28. On the **Exchange Admin Center**, in the left-hand navigation pane, select **mail flow**. 

29. In the **mail flow** window, select **message trace** in the menu bar at the top of the page. 

30. In the **message trace** window, in the **Date range** field, select the drop-down arrow and select **Past 24 hours**. 

31. In the **Delivery status** field, select the drop-down arrow and select **Failed**.

32. Scroll to the bottom of the page. To the right of the **Sender** field, select **add sender**. 

33. In the **Select Members** window, in the list of users, select **Holly Spencer**, select **add-&gt;,** and then select **OK**.<br/>

	**Note:** If no names appear in the list when the window first opens, select the **Refresh** icon above the **Display name** field. 

34. At the bottom of the page, select the **search** button. 

35. In the **Message Trace Results** window that appears, if no failed message deliveries appear in the list, you may need to wait several minutes before selecting the **Refresh** icon that appears above the item list. 

36. Double-click on each failed message to view the sender, recipient, message size, ID, and IP address information, as well as the **HOW TO FIX IT** instructions. Select the **Close** button to close each message window.

37. Close the Message Trace Results window. This will return you to the Exchange admin center.

38. Remain signed into Office 365 as Holly. In your Internet Explorer browser, leave the other Microsoft 365 admin center tabs open for the next task.
  

### Task 2 - Monitor Service Health and Analyze Reports 

Adatum's CTO is concerned with the service health issues that have recently come to light throughout the organization He has asked Holly to review several of the key service health queries and reports so that she becomes aware of the information that's available to help Adatum monitor its service health.

1. On the LON-DC1 VM, select the **Microsoft 365 admin center** tab within your Internet Explorer browser. 

2. In the left-hand navigation pane, you previously selected the **Show all** option in the prior task. Select the **Health** group that displayed when you selected **Show all**, and then select **Service health**. 

3. On the **Service health** page, the **All services** tab is displayed by default. Select the **History** tab.  

4. The default option is to display a list of items from the past 7 days. Select any entry in the list to see further details about the incident. Close the incident window when you’re done reviewing it. 

5. In the **Office 365 admin center**, on the left-hand navigation pane, select **Reports**, and then select **Usage.** 

6. On the **Usage** page, scroll down and view the **Email activity** chart.  <br/>

	‎**Note:** There might be little or no data shown because there is not much mailbox usage in the lab environment. 

7. At the top of the **Usage** page, select the **Select a report** drop-down arrow. In the menu that appears, select **Exchange**, and then select **Mailbox usage**. 

8. Select the following different date views to see how the display changes: **7 days**, **30 days**, **90 days** and **180 days**. 

9. Scroll back to the top of the page. On the menu bar above the chart, it currently displays **Mailbox usage** followed by a drop-down arrow. Select the drop-down arrow, and in the menu that appears, select **SharePoint**. In the SharePoint group, select **Site usage**. 

10. Select the following different date views to see how the display changes: **7 days**, **30 days**, **90 days** and **180 days**. 

11. You now want to review the reports that are available in the **Security &amp; Compliance center**. In your browser, select a new tab and then enter the following URL in the address bar: **https://protection.office.com.** 

12. In the **Office 365 Security &amp; Compliance center**, scroll down in the left-hand navigation pane and select **Reports,** and then under the **Reports** section, select **Dashboard.** 

13. Scroll down to any report that has data displayed and click in the chart area to open the **Report Viewer** for that particular report. 

14. After reviewing the report, select **Dashboard** in the menu bar at the top of the page to return to the report dashboard.

15. Repeat these last two steps for any other report that has data displayed.

16. Close the **Security &amp; Compliance center** tab in your Internet Explorer browser, but leave the other Microsoft 365 admin center tabs open for the next task.
 

### Task 3 – Submit a Help Request to Microsoft Support

With Microsoft 365, if you ever run into a situation where you need assistance with a problem, you must submit a service request with the Microsoft Support team. As part of Adatum's pilot project, Holly and Patti Fernandez, Adatum's Service Support Administrator, have decided to submit a test request that does not require a call back so that they know how to submit a request should a situation ever arise that requires it.

1. On the LON-DC1 VM, in the **Microsoft 365 admin center** tab of your Internet Explorer browser, select **Support** in the left-hand navigation pane, and then select **Service request history** to see if there are any outstanding service request tickets.

2. In the left-hand navigation bar, under the **Support** group, select **New service request**.

3. In the **Support Assistant** window that appears, select the Message line at the bottom of the window (which currently displays **Messge e.g. How do I install Office?**), type the following and then press Enter: **This is a test of the request system. A call back is not needed.**

4. This displays a list of recommended articles related to the issue that you entered.

5. If you need further assistance and would like to speak to a Microsoft support agent, at the top of the window select the **headset** icon (the middle icon) to get help from one of the support agents. Select the **headset** icon now.

6. In the **Contact support** window that appears, do NOT enter any information; instead, just review the information that you would enter to complete this request in a real-world environment. You could also attach any necessary documents before selecting **Contact me** at the bottom of the page.   <br/>

	‎**IMPORTANT:** Do NOT complete this form in your lab environment. If you enter this request with the **Phone** option selected, you will receive a call from a Microsoft 365 support representative.  
	
7. Select the **X** in the upper right-hand corner of the page to close the **Contact support** window.
	
8. Leave your LON-DC1 VM open for the next lab.  
‎  
‎

# Proceed to Lab 2 - Exercise 3
