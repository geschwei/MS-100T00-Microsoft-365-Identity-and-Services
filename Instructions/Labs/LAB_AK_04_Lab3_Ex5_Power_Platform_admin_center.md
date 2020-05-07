# Module 4 - Lab 3 - Exercise 5 - Review the Power Platform Admin Center

As Adatum begins its transition to Microsoft 365 as its hosted cloud solution, they want to use this opportunity to examine Microsoft’s Power Platform functionality. In your role as Holly Spencer, Adatum’s Enterprise Administrator, you have been asked to expand your Microsoft 365 pilot project to include Microsoft’s Power Platform. Therefore, your first task towards that goal is to familiarize yourself with the Power Platform admin center, which provides a unified portal for administrators to manage environments and settings for Power Apps, Power Automate, and Power BI. 

### Task 1 – Review the Power Platform Admin Center

In your role as Holly Spencer, you want to review the Power Platform admin center, which is the go-to destination for administrators who create, manage, and support their Power Platform environments. 

1. You should still be logged into your Domain Controller VM (LON-DC1) as **ADATUM\Administrator** and password **Pa55w.rd**; if not, then do so now.

2. You should still have Internet Explorer and the **Microsoft 365 admin center** open from the prior lab in which you were logged in as Holly Spencer. If so, proceed to the next step; otherwise, open Internet Explorer, navigate to **https://portal.office.com/**, log in as **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider) and **Pa55w.rd**, and then in the **Microsoft Office Home** page, select **Admin** to open the Microsoft 365 admin center.

3. Open a new tab in your browser and enter the following URL in the address bar: **https://make.powersapps.com** 

4. This opens the **PowerApps** studio. Select the **gear (Settings)** icon on the top right corner of the screen and select **Admin center**. This opens the **Power Platform admin center.**

5. In the **Power Platform admin center**, in the left-hand navigation pane, **Environments** is selected by default. In the list of **Environments**, note how there is only one environment, the **Adatum Corporation (default)** environment. Select this environment. 

6. The **Details** page for the **Adatum Corporation** environment is displayed. 

7. In the **Acces**s pane on the right, under **Environment admin**, select **See all**. 

8. On the **Environment Admin** page, select the **Add people** button. 

9. In the **Add people to the Environment Admin security role** pane, select inside the **Search for a name, group name, or email address** field and enter **MOD**. In the list of users that appears whose name starts with **MOD**, select **MOD Administrator** and then select **Add**. 

10. This returns you to the **Environment Admin** page which should display the **MOD Administrator**. In the navigation thread at the top of the page (**Environments &gt; Adatum Corporation (default) &gt; Environment Admin**), select **Environments**

11. You have decided to create a new environment. On the menu bar at the top of the **Environments** page, select **+New**.

12. In the **New environment** pane that appears, enter the following information:

	- Name: **MS100-Test**

	- Type: **Sandbox**

	- Region: **United States - Default**

	-  Create a database for this environment: **No**

13. Select **Save.**   
‎  
‎**Note:** Trying to save this new environment record will result in an error message at the top of the **New environment** pane. The reason for this error is that a new environment requires at least 1 Gb of database capacity, which is not available with the tenant provided in your lab environment.   
‎  
‎Select **Cancel**.

14. In the **Power Platform admin center**, in the left-hand navigation pane, select **Resources**. 

15. Under the **Resources** group, select **Dynamics 365** **Apps**. This page displays the Dynamics 365 apps that are available to be installed in your tenant. 

16. Under the **Resources** group, select **Data integration**. This page displays statistics for all the latest Power Platform runs. Once you create your Power App and Power Automate flow in the upcoming lab exercises, you can return to this page to see the runs that have been made. 

17. Explore other areas of the **Power Platform admin center**, as desired. 

18. When you are finished, close the **Power Platform admin center** tab in your browser.

19. In your browser, leave the **Power Apps** tab open for the next lab exercise.


# Proceed to Lab 3 - Exercise 6
