# Module 7 - Lab 6 - Exercise 3 - Implement Password Management 

As Holly Spencer, Adatum’s Enterprise Administrator, you have been asked by Adatum’s CTO to deploy Pass-through Authentication (PTA) and Azure AD Smart Lockout as a means of strengthening password management throughout the organization. 

### Task 1: Deploy Azure AD Pass-Through Authentication 

Pass-through Authentication allows users to log in to cloud-based services using their on-premises passwords. All user passwords are only stored locally in the on-premises domains and never synchronized to the cloud. When a user logs in, the PTA agent takes the authentication to your on-premises environment to verify if the password is correct and then communicates the result with Azure AD.   

‎Adatum's CTO wants to provide the company's users with a better logon experience (since PTA requires one less password to remember) as well as reduce Adatum’s IT helpdesk costs because with PTA their users are less likely to forget how to sign in. While this can also be achieved by employing Password Hash Synchronization as well as Active Directory Federation Services, Adatum has chosen to test PTA in its pilot project.

1. On your **Domain Controller VM** (LON=DC1) select the **Start** button, and then in the **Start** menu, select the **Azure AD Connect** program group, and then select **Azure AD Connect**.

2. In the **Welcome to Azure AD Connect** window, you will receive a page indicating the synchronization service scheduler is suspended until this setup wizard is closed. This is because if you start the Azure AD Connect installation wizard (which you did in an earlier task), then the scheduler is temporarily suspended. Select **Configure.**

3. On the **Additional tasks** page, select the **Change user Sign-in** task and then select **Next**. 

4. On the **Connect to Azure AD** page, sign into Azure AD. The **USERNAME** field is already filled with **Holly@XXYYZZa.xxxCustomDomainxxx.xxx.** Enter **Pa55w.rd** in the **PASSWORD** field, and then select **Next**.

5. On the **User sign-in** page, select **Pass-Through Authentication** and then select **Next**. 

6. On the **Enable single sign-on** page, select **Enter credentials**. 

7. In the **Forest Credentials** dialog box, enter **adatum\administrator** as the **User name** and **Pa55w.rd** as the **Password**, and then select **OK**. 

8. When the credentials are verified, a check mark will appear to the right of the **Enter credentials** button. Select **Next**. 

9. On the **Ready to configure** page, select **Configure**. 

10. On the **Configuration complete** page, select **Exit**. Pass-Through Authentication has now been enabled.  

11. To verify that Pass-Through Authentication is successfully enabled, select a new tab in **Internet Explorer** and enter the following URL in the address bar: **https://aad.portal.azure.com/**

12. This opens the **Azure Active Directory admin center**. In the left-hand navigation pane, select **Azure Active Directory**. 

13. On the **Azure Active Directory admin center** page, in the left-hand navigation pane, select **All services**.

14. On the **All services** page, in the middle pane under the **Identity** group, select **Azure Active Directory**. 

15. On the **Adatum Corporation – Overview** page, in the middle pane under the **Manage** group, select **Azure AD Connect**.

16. On the **Adatum Corporation – Azure AD Connect** page, in the detail pane on the right, under the **USER SIGN IN** section, verify that the status of **Pass-through authentication** is **Enabled**, and then select **Pass-Through Authentication**. 

17. On the **Pass-through authentication** page, review the list of servers on which your pass-through authentication agents are installed, and then close the **Pass-through authentication** page. 

18. Leave the Azure AD admin center open as you will use it in the next task.
   

### Task 2: Deploy Azure AD Smart Lockout

Adatum’s CTO has asked you to deploy Azure AD Smart Lockout, which assists in locking out bad actors who are trying to guess your users’ passwords or use brute-force methods to get admitted into your network. Smart Lockout can recognize sign-ins coming from valid users and treat them differently than sign-ins from attackers and other unknown sources. 

The CTO is anxious to implement Smart Lockout because it will lock out the attackers while letting Adatum’s users continue to access their accounts and be productive. The CTO has asked you to configure Smart Lockout so that users can’t use the same password more than once, and they can’t use passwords that you deem too simplistic or common. 

1. On the Domain Controller (LON-DC1), open **Server Manager** if it’s not already open.

2. In **Server Manager**, select **Tools** in the upper-right menu bar, and in the drop-down menu, select **Group Policy Management.**

3. Maximize the **Group Policy Management** window.

4. You want to edit the group policy that includes your organization's account lockout policy.   <br/>

	‎In the root console tree, under **Adatum.com**, right-click on **Default Domain Policy,** and then in the drop-down menu, select **Edit**.

5. Maximize the **Group Policy Management Editor** window.

6. In the **Default Domain Policy** tree in the right-hand pane, browse to **Computer Configuration** > **Policies** > **Windows Settings** > **Security Settings** > **Account Policies.**

7. Select **Account Lockout Policy**.

8. As you can see in the right-hand pane, none of the smart lockout parameters have been defined. You’re going to use the **Azure AD admin center** to assign these values.   <br/>

	‎In Internet Explorer, select the tab displaying the **Azure Active Directory admin center** that you used in the prior task. 

9. In the **Azure Active Directory admin center**, in the left-hand navigation pane, select **Azure Active Directory**.

10. In the **Adatum Corporation – Overview** page, in the middle pane under the **Manage** section, select **Security**.

11. In the **Security – Getting started** window, in the middle pane under the **Manage** section, select **Authentication Methods**.

12. In the **Authentication methods – Authentication method policy (Preview)** page, , in the middle pane under the **Manage** section, select **Password protection.**

13. In the **Authentication methods – Password protection** window, in the detail pane on the right, enter the following information:

	- In the **Custom smart lockout** section:

		- **Lockout threshold:** this field indicates how many failed sign-ins are allowed on an account before its first lockout. The default is 10. For testing purposes, Adatum has requested that you set this to **3.**

		- **Lockout duration in seconds:** This is the length in seconds of each lockout. The default is 60 seconds (one minute). Adatum has requested that you change this to **90** seconds.

	- In the **Custom banned passwords** section:

		- **Enforce custom list**: select **Yes**

		- **Custom Banned Passwords** **List:** Enter the following values (press Enter after entering each value so that each value is on a separate line):

			- **Password01**

			- **F00tball01**

			- **Se@Hawks1**

			- **Never4get!!**

14. Select **Save**.

15. Log out and try to log in to a random account using one of these banned passwords. Since you set the **Lockout threshold** to **3**, you will need to try logging in 3 times using one or more of the banned passwords to trigger the Smart Lockout threshold. 

16. When the Smart Lockout threshold is triggered, you should receive the following message while the account is locked: **Your account is temporarily locked to prevent unauthorized use. Try again later, and if you still have trouble, contact your admin.**

17. Try logging in immediately after receiving this message. You should be prohibited from doing so until after the **90 second lockout duration** that you set. 

18. After 90 seconds, try logging in again to verify that you can once again attempt to log in. 
 

# End of Lab 6


