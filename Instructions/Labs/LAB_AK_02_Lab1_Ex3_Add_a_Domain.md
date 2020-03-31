# Module 2 - Lab 1 - Exercise 3 - Add a Custom Domain

Not every company has just one domain; in fact, many companies have more than one domain. For this lab, Adatum has purchased a new domain (XXYYZZa.xxxCustomDomainxxx.xxx, which is provided by your lab hosting provider). In this exercise, you will gain experience adding this domain for Adatum Corporation. When you add a domain to Microsoft 365, it's called an accepted, or custom domain. Custom domains allow companies to have their own branding on emails and accounts so that customers can verify who is emailing them (for example, @contoso.com). 

### Task 1 - Add a Custom Domain

In your hosted lab environment, Adatum already has an existing on-premises domain titled **adatum.com**. In this lab, you will create a second domain for Adatum that will be titled **XXYYZZa.xxxCustomDomainxxx.xxx**; you will replace **XXYYZZa** with the UPN name assigned to your tenant by your lab hosting provider, and you will replace **xxxCustomDomainxxx.xxx** with your lab hosting provider's custom domain name. Your instructor will provide you with your lab hosting's provider's custom domain name as well as show you how to locate your UPN name.

1. If you’re not logged into the LON-DC1 VM as **ADATUM\Administrator** and password **Pa55w.rd**, then please do so now.

2. If Windows PowerShell is still open from the previous exercise, select the **Windows PowerShell** icon on the taskbar; otherwise, you must open an elevated instance of Windows PowerShell just as you did before. Maximize your PowerShell window.

3. At the command prompt, you should run the following command to create a new zone in DNS (remember to replace XXYYZZa with the unique UPN name assigned to your tenant by your lab hosting provider, and replace xxxCustomDomainxxx.xxx with your lab hosting provider's custom domain name): <br/>

    ‎**dnscmd /zoneadd XXYYZZa.xxxCustomDomainxxx.xxx /DsPrimary**
    
4. Minimize your Windows PowerShell window (do NOT close it as you will use it later).

5. In your Internet Explorer browser that was left open from the prior task, in the left-hand navigation pane in the **Microsoft 365 admin center**, select **...Show all**, select **Settings**, and then under **Settings** select **Domains**. 

6. Note that in the list of domains, only the M365xZZZZZZ.onmicrosoft.com domain appears. The existing on-premises **adatum.com** domain does not appear in the list of Microsoft 365 domains. To add Adatum's new Microsoft 365 domain, select **+Add domain** in the menu bar that appears above the list of domains; this will start the domain setup wizard. 

7. In the **Add a domain** page, in the **Domain name** field, enter your domain name in the form of **XXYYZZa.xxxCustomDomainxxx.xxx** (where XXYYZZa is the unique UPN name provided by your lab hosting provider, and xxxCustomDomainxxx.xxx is your lab hosting provider's domain name), and then select **Use this domain**. 

8. In the **Verify your domain** page, you must select a verification method to prove you own the domain. You can choose to verify using either a TXT record or a MX record. For this lab, you will use the **TXT record**, which is the option displayed by default on the menu bar. 

	To configure the domain later on in DNS Manager, you must copy the **TXT value**. To do so, select the **Copy record** icon that appears under the **TXT value** (to the left of **MS=msXXXXXXXX**). In the dialog box that appears, select **Allow access** to copy this value from the webpage to your clipboard.  <br/>

    ‎**Important:** If you select **Verify** at this point, you will receive an error indicating the system could not find the record you added for this domain (you can do this if you want to see the error; there is no harm in it). Therefore, you must complete the next series of steps to add the TXT record to this domain in **DNS Manager**. Once you finish that process, you will be instructed to return back to this page and select the **Verify** button so that you can complete the process of adding this domain in the Microsoft 365 admin center. 

9. You must now switch over to Server Manager. Select the **Server Manager** icon that appears in your taskbar at the bottom of the page. Maximize the Server Manager window if necessary.

10. In **Server Manager Dashboard,** select **Tools** in the top right corner of the window. In the drop-down menu, select **DNS**, which will open **DNS Manager**. Maximize the DNS Manager window.

11. In the **DNS Manager** window, in the **File Explorer** section in the left-hand column, under **LON-DC1** expand the **Forward Lookup Zones** folder and then select the **XXYYZZa.xxxCustomDomainxxx.xxx** zone that you previously added in Windows PowerShell (where XXYYZZa is the unique UPN name provided by your lab hosting provider and xxxCustomDomainxxx.xxx is your lab hosting provider's domain name). 

12. Right-click on this **XXYYZZa.xxxCustomDomainxxx.xxx** zone, and in the menu that appears, select **Other New Records...** 

13. In the **Resource Record Type** window that appears, in the **Select a resource record type** field, scroll down and select **Text (TXT),** and then select the **Create Record...** button at the bottom of the window.

14. In the **New Resource Record** box, in the **Text (TXT)** tab, leave the **Record name** field blank. However, right-click in the **Text** field and select **Paste** from the menu that appears. This will paste in the TXT valued of **MS=msXXXXXXXX** that you copied to the clipboard when you were in the Microsoft 365 admin center.

15. Select **OK** to create the record. 

16. In the **Resource Record Type** window, select **Done**. Note how this Text (TXT) record appears in the details pane on the right for the XXYYZZa.xxxCustomDomainxxx.xxx domain that you previously created. Leave your DNS Manager window open but minimize it as you will return to it in a later step in this task.

17. You are now ready to return to the Microsoft 365 admin center and resume adding the domain record. If you’ll recall, when you were earlier adding the domain in the Microsoft 365 admin center, you indicated that you wanted to verify the domain using a TXT record. At that point you had to switch to DNS Manger and add the TXT record. Now that you’ve added the TXT record, you can go back to the Microsoft 365 admin center and proceed with the domain verification process.<br/>

	‎In your Internet Explorer browser select the **Microsoft 365 admin center** tab that displays the **Verify you domain** page. The **TXT name** should display your UPN name (XXYYZZa) and the **TXT value** should display your MS=msXXXXXXXX value.

18. Scroll to the bottom of the window and select **Verify.**   <br/>

	**Note:** If you selected **Verify** in the prior step when you copied the TXT value just to see the error that you would receive, the **Verify** button changed to **Try again**. In you did this, then select **Try again** rather than **Verify**. 

    ‎**Important:** If you had a typo or any other configuration mistakes, the domain will not be verified. If this occurs, the **Activate records** window in the next step will not appear. In this case, you should repeat this task and take your time when configuring the domain to make sure you don’t run into similar issues at this step in the process.

19. If your Text (TXT) record was successfully verified, the **Activate records** window will appear. Select **Continue**.

20. In the **Add DNS records** window, it displays check boxes for three services that DNS supports - Exchange and Exchange Online Protection, Microsoft Teams and Skype for Business, and Intune and Mobile Device Management for Office 365. <br/>

	**Exchange and Exchange Online Protection** is the only check box selected by default (this is sufficient for Adatum; you should NOT select any other check box). Under the **Exchange and Exchange Online Protection** service, the description indicates that 3 records are needed for it to work properly: a Mail Exchanger (MX) record, an Alias (CNAME) record, and an additonal Text (TXT) record. You must now switch back and forth between this **Add DNS records** page and DNS Manager to add these three additional records. For each record that you add in DNS Manager, you will copy information from this **Add DNS records** page and then paste it into each corresponding record that you create in DNS Manager.  <br/>

	On the **Add DNS records** page, under teh **Exchange and Exchange Online Protection** section, select the arrow (**>**) in the **MX Records** section to expand it. This displays the **Expected value** that the domain setup wizard expects to see in the MX record that you create for this domain in DNS Manager. 
	
	Then select the arrow (**>**) in the **CNAME Records** section and the **TXT Records** section. All three record types should now be expanded.
	
21. You will begin by adding the **MX record** required by the **Exchange and Exchange Online Protection** service. 

	a. In the **MX Records** section, under the **Points to address or value** column, select the copy icon that appears to the left of the expected value (for example, XXYYZZa-xxxCustomDomainxxx-xxx.mail.protection.outlook.com) to copy this value to the clipboard.
	
	b. You must now switch to DNS Manager. On the taskbar at the bottom of the page, select the **DNS Manager** icon.

	c. In **DNS Manager**, under **Forward Lookup Zones**, the **XXYYZZa.xxxCustomDomainxxx.xxx** domain should be selected from when you earlier left off. If not, select this zone now. You should see the **TXT** record that you earlier created. You must now create a **Mail Exchanger (MX)** record for this domain. Under **Forward Lookup Zones**, right-click the **XXYYZZa.xxxCustomDomainxxx.xxx** domain and select **New Mail Exchanger (MX)...**

	d. In the **New Resource Record** window, in the **Mail Exchanger (MX)** tab, leave the **Host or child domain** field blank, but right-click in the **Fully qualified domain name (FQDN) of mail server** field and select **Paste** from the menu that appears. This will paste in the expected **Points to address or value** that you copied to the clipboard in step a above.
	
	e. Select **OK**. Note how this Mail Exchanger (MX) record appears in the details pane on the right for the XXYYZZa.xxxCustomDomainxxx.xxx domain that you previously created. Leave your DNS Manager window open as you will return to it in a later step in this task.
	
	f. Switch back to the **Add DNS records** page in the Microsoft 365 admin center by selecting the **Internet Explorer** icon on the taskbar at the bottom of the page and selecting the **Microsoft 365 admin center** tab. At this point, you can either select **Continue** at the bottom of the **Add DNS records** page to verify the MX record that you just added, or you can wait until you have added all three records and then select **Continue** to verify all three records at once. 
	
	For the purposes of this lab, you will verify each record as you create it. Therefore, select **Continue**. It will display either a checkmark or an exclamation point next to **MX Records**. The checkmark in a green circle indicates that it successfully validated the MX record for this domain in DNS Manager, and the exclamation point in a red circle indicates that there was a problem with the MX record and it did not validate successfully. If the MX record did not validate successfully, then review the record to ensure you entered the proper information, make any necessary corrections, and then select **Continue** again. 

22. Once a checkmark appears next to **MX Records**, you must perform the following steps to add the **CNAME record** required by Exchange and Exchange Online Protection service. 

	a. On the **Add DNS records** page, in the **CNAME Records** section, under the **Points to address or value** column, select the copy icon that appears to the left of the expected value (for example, autodiscover.outlook.com). <br/>
		
	**Important:** You will NOT copy the expected **Host Name** value. The value listed here as the expected host name is **autodiscover.XXYYZZa** (where XXYYZZa is your UPN name). However, if you paste this value in the **Alias name** field in the CNAME record in DNS Manager, the CNAME record validation on this page will fail. When you create the CNAME record in DNS Manager in the following steps, you will simply enter **autodiscover** as the Alias name and NOT **autodiscover.XXYYZZa**. <br/>
	
	The reason for only using autodiscover as the Alias name is that Autodiscover is an Exchange service that minimizes configuration and deployment. For small, single SMTP namespace organizations such as Adatum, only autodiscover is needed as the Alias, as opposed to autodiscover.XXYYZZa for larger organizations with multiple SMTP namespaces. By adding the CNAME record to your On-premise DNS server, you're creating a redirect record that allows users to configure Outlook and access OWA by using either Basic Authentication or Modern Authentication(OAUTH). <br/>
	
	Therefore, the only value you need to copy for the CNAME record is the expected value for the **Points to address or value** column (for example, autodiscover.outlook.com).

	b. On the taskbar at the bottom of the page, select the **DNS Manager** icon.

	c. In **DNS Manager**, under **Forward Lookup Zones**, right-click the **XXYYZZa.xxxCustomDomainxxx.xxx** domain and select **New Alias (CNAME)...**

	d. In the **New Resource Record** window, enter **autodiscover** in the **Alias name (uses parent domain if left blank)** field. 
	
	e. Right-click in the **Fully qualified domain name (FQDN) for target host** field and select **Paste** from the menu that appears. This will paste in the expected **Points to address or value** that you earlier copied to the clipboard.
	
	f. Select **OK**. Note how this Alias (CNAME) record appears in the details pane on the right for the XXYYZZa.xxxCustomDomainxxx.xxx domain that you previously created. Leave your DNS Manager window open as you will return to it in a later step in this task.
	
	g. Switch back to the **Add DNS records** page in the Microsoft 365 admin center. On the taskbar at the bottom of the page, select the **Internet Explorer** icon and select the **Microsoft 365 admin center** tab. At this point, you can either select **Continue** at the bottom of the **Add DNS records** page to verify the CNAME record, or you can wait until you have added all three records and then select **Continue** to verify all three records at once. <br/>
	
	For the purpose of this lab, select **Continue**. It will display either a checkmark or an exclamation point next to **CNAME Record**. The checkmark in a green circle indicates that it successfully validated the CNAME record for this domain in DNS Manager, and the exclamation point in a red circle indicates that there was a problem with the CNAME record and it did not validate successfully. If the CNAME record did not validate successfully, then review the record to ensure you entered the proper information, make any necessary corrections, and then select **Continue** again. 
	
23. Once a checkmark appears next to **CNAME Records**, you will finish by adding the **TXT record** required by Exchange and Exchange Online Protection service. 

	a. On the **Add DNS records** page, in the **TXT Records** section, under the **TXT value** column, select the copy icon that appears to the left of the expected value (for example, v=spf1 include:spf.protection.outlook.com -all) to copy this value to the clipboard.

	b. On the taskbar at the bottom of the page, select the **DNS Manager** icon.

	c. In **DNS Manager**, under **Forward Lookup Zones**, right-click the **XXYYZZa.xxxCustomDomainxxx.xxx** domain and select **Other New Records...**
	
	d. In the **Resource Record Type** window that appears, in the **Select a resource record type** field, scroll down and select **Text (TXT),** and then select the **Create Record...** button at the bottom of the window.

	e. In the **New Resource Record** window, in the **Text (TXT)** tab, leave the **Record name** field blank. However, right-click in the **Text** field and select **Paste** from the menu that appears. This will paste in the expected **TXT value** that you earlier copied to the clipboard.
	
	f. Select **OK**. 
	
	g. On the **Resource Record Type** window, select **Done**. 

24. In **DNS Manager**, you should now see the TXT record that you originally created to verify the domain, along with the MX, CNAME, and TXT records that you created for the Exchange service to work within this domain. Minimize the DNS Manager window. 

25. This should return you to the **Add DNS records** window in Internet Explorer. Select **Continue** to complete the new domain setup. If you selected **Continue** after adding the MX and CNAME records, and if each validated successfully, then only the TXT record will be validated at this point. However, if you did not select **Continue** after adding the MX and CNAME records, then all three records will be validated at this point. <br/>
	
	If all three records have been successfully validated, then the **Domain setup is complete** page will appear. If this occurs, then select the **Done** button to complete the domain setup process.
	
	However, if any of the three records did not validate successfully, then the **Add DNS records** window will return, and it will display either a checkmark or an exclamation point next to each record type to indicate which ones validated successfully and which ones did not. An exclamation point in a red circle indicates that there was a problem with the record and it did not validate successfully (note that the Actual value for the record is left blank). If this occurs, you must correct the data on the corresponding record in DNS Manager and then select **Continue** again. You must repeat this process until all three records have successfully validated and the **Domain setup is complete** page appears.

26. Once the domain setup process is complete and the three DNS records validated successfully for the **Exchange and Exchange Online Protection** service, the **Domains** page will be displayed. The **XXYYZZa.xxxCustomDomainxxx.xxx** custom domain that you just added should now appear in the list of domains, along with your **M365xZZZZZZ.onmicrosoft.com** domain.  

27. Remain logged into the LON-DC1 VM with both **Internet Explorer** and **Windows PowerShell** left open for the next task. 



# End of  Lab 1
