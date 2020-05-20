# Module 4 - Lab 3 - Exercise 5 - Review the Power Platform Admin Center

As Adatum begins its transition to Microsoft 365 as its hosted cloud solution, they want to use this opportunity to examine Microsoft’s Power Platform functionality. In your role as Holly Spencer, Adatum’s Enterprise Administrator, you have been asked to expand your Microsoft 365 pilot project to include Microsoft’s Power Platform. Therefore, your first task towards that goal is to familiarize yourself with the Power Platform admin center, which provides a unified portal for administrators to manage environments and settings for Power Apps, Power Automate, and Power BI. 

### Task 1 – Review the Power Platform Admin Center

In your role as Holly Spencer, you want to review the Power Platform admin center, which is the go-to destination for administrators who create, manage, and support their Power Platform environments. 

1. You should still be logged into your Domain Controller VM (LON-DC1) as **ADATUM\Administrator** and password **Pa55w.rd**; if not, then do so now.

2. You should still have Internet Explorer and the **Microsoft 365 admin center** open from the prior lab in which you were logged in as Holly Spencer. If so, proceed to the next step; otherwise, open Internet Explorer, navigate to **https://portal.office.com/**, log in as **Holly@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your tenant ID provided by your lab hosting provider) and **Pa55w.rd**, and then in the **Microsoft Office Home** page, select **Admin** to open the Microsoft 365 admin center.

3. Open a new tab in your browser and enter the following URL in the address bar: **https://make.powersapps.com** 

4. This opens the **PowerApps** studio. Select the **gear (Settings)** icon on the top right corner of the screen. In the **Settings** pane that appears, select **Admin center**. This opens a new Internet Explorer session that displays the **Power Platform admin center.** <br/>

	**Note:** As of this writing, the IE session does not fully expand and the Maximize option for the screen is disabled. 

5. In the **Power Platform admin center**, in the left-hand navigation pane, select **Environments**. In the list of **Environments**, note how there is only one environment, the **Adatum Corporation (default)** environment. Select the **Adatum Corporation (default)** environment and review the information available for this environment. 

6. In the navigation pane at the top of the screen (**Environments > Adatum Corporation (default))**, select **Environments**.

7. You have you have decided to create a new environment. On the menu bar at the top of the screen, select **+New** to create a new environment.

8. In the **New environment** pane that appears, enter the following information:

	- Name: **MS100-Test**

	- Type: **Sandbox**

	- Region: **United States - Default**

	-  Create a database for this environment: **No**

9. Select **Save.** <br/>

	**Note:** Trying to save this new environment record will result in an error message at the top of the window. This message indicates you need at least 1 Gb of database capacity, which is not available in your VM lab environment. Close the **New environment** window. 

10. Explore other areas of the **Power Platform admin center**, as desired. 

11. When you are finished, close the **Power Platform admin center** tab in your browser.

12. In your browser, leave the **Power Apps** tab open for the next lab exercise.

 

# Proceed to Lab 3 - Exercise 6
