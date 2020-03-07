# Module 4 - Lab 3 - Exercise 2 - Review Key Features of SharePoint Online

In this exercise you will review some of the basic administrator functions in SharePoint Online.

### Task 1 – Site Management

A team site includes a group of related web pages, a default document library for files, lists for data management, and web parts that can be customized to meet your collaboration needs. Adatum is excited to use team sites in SharePoint Online to improve collaboration between team members when working on specific projects. As part of Adatum's pilot project, Holly Spencer has been tasked with creating a team site for the IT department so that the IT team can work on projects and share information from anywhere and on any device. 

1. You should already be in the **Microsoft 365 admin center** after having finished the prior exercise. 

2. In the left-hand navigation pane, under **Admin Centers**, select **SharePoint.** This will open the SharePoint admin center.

3. In the **SharePoint admin center**, in the left-hand navigation pane, select **Sites**, and then select **Active sites.** 

4. In the **Active sites** window, select the **+Create** option on the menu bar.   

	‎**Note:** Depending on the team or company need, there are several templates that can be used.

5. In the **Create a site** window, select **Team site.**

6. In the **Get a team site connected to Office 365 Groups** window, enter the following information.

	- Site name: **IT Services**

	- Group email address: this is the alias for the group email address. As you typed in **IT Services** in the **Site name** field, the same text automatically prefilled in this field, although the blank space was removed so that it appears as one word. Do not change this default value.

	- Group owner: type **Diego**, and in the window that appears displaying the users whose first name starts with Diego, select **Diego Siciliani**.

	- Select a language: Select your appropriate language

	- Select **Advanced settings** to expand this section and then enter the following information:

		- Privacy settings: Given the confidential nature of HR information, select **Private – only members can access this site**

		- Time zone: since this group is located in Adatum’s Redmond, WA location, select **Pacific Time (US and Canada)**

		- Site Description: **This site is used by the HR department** 

7. Select **Next**.

8. In the **Add group members** window, in the **Add additional owners** field, enter **Holly**. As you enter Holly, a window appears listing users whose first name starts with Holly. Select **Holly Spencer**.

9. You now want to add **Patti Fernandez** and **Nestor Wilke** as members of this group. 

	In the **Add members** field, enter **Patti**. As you enter Patti, a window appears listing users whose first name starts with Patti. Select **Patti Fernandez**. 

10. Repeat the previous step for **Nestor Wilke**.

11. Select **Finish**.

12. You’re now going to test the process of deleting a team site and then restoring it. In the list of **Active sites**, select the circle and checkmark to the left of the **IT Services** site name (do not select the IT Services site name, as this will open a properties window for the site).

13. In the menu bar at the top of the page, select the **ellipsis (…)** icon, and in the drop-down menu that appears, select **Delete**. 

14. In the **Delete Office 365 group** window, select the **Delete the group “IT Services” and all its resources** check box, and then select **Delete.** Note that the IT Services site disappears from the **Active sites** list. 

15. In the left-hand navigation pane on the **SharePoint admin site**, under **Sites**, select **Deleted sites.** Note how the IT Services site that you just deleted appears in the list of deleted sites. 

16. In the **Deleted sites** window, select the circle and checkmark to the left of the **IT Services** site name (do not select the IT Services site name).

17. In the menu bar at the top of the page, select **Restore**.

18. In the **Restore Office 365 group** window, select **Restore**.  Note that the IT Services site disappears from the **Deleted sites** list. 

19. In the left-hand navigation pane on the **SharePoint admin site**, under **Sites**, select **Active sites.** The IT Services site should once again appear in the **Active sites** list. 

20. In the **Active sites** list, select the checkmark to the left of the **IT Services** site name. If you scroll to the right, you will see that the information that you previously entered for this site has been restored.

21. Remain in the SharePoint admin center for the next task.

 
### Task 2 – Hierarchical Permissions

SharePoint Online uses hierarchical permissions to set authorization and access of sites. In other words, when a site is created (known as the parent site) any sites that are later created under that site (known as children sites) will, by default, inherit the main site permissions of the parent site. Since you just created a team site for IT Services, you now plan to configure site permissions to meet the IT team's security requirements.

1. In the **SharePoint admin center**, you should still be displaying **Active sites**.

2. Select the **IT Services** site that you created in the prior task.

3. In the **IT Services** window that appears, select the URL that is displayed under **URL.** 

4. A new tab will open in Internet Explorer that displays the **IT Services** site.

5. In the upper right-hand corner of the **IT Services** site, select the **gear (Settings)** icon.

6. In the **Settings** pane that appears, select **Site permissions.**

7. At the bottom of the **Site permissions** pane, select **Advanced permissions settings**, which opens a new **Permissions: IT Services** tab for the IT Services site.

8. In the ribbon that appears in the **Permissions** tab at the top of the **Permissions: IT Services** window,, select **Check Permissions.**  

	**Note:** This option enables you to check access permissions for users and groups. In this case, you will check the permissions that were assigned to Diego Siciliani, Nestor Wilke, and Patti Fernandez. In the prior task, you assigned Diego as an owner of the HR site, and Nestor and Patti as site members. The following steps will enable you to check what permissions they were assigned in these roles. 

9. In the **IT Services: Check Permissions** window that appears, in the **User/Group** field, type **Diego**. As you type Diego, a window appears listing users whose first name starts with Diego. Select **Diego Siciliani** and then select **Check now**. Since Diego is an owner of this site, this confirms that he was automatically assigned **Full Control** permissions.

10. In the **User/Group** field, select the **X** next to Diego’s name to remove it from the field. In the **User/Group** field, type **Nestor**. As you type Nestor, a window appears listing users whose first name starts with Nestor. Select **Nestor Wilke** and then select **Check now.** Since Nestor is member of this site, this confirms that he was automatically assigned **Edit** permissions.

	If you repeat this step for **Patti Fernandez**, you will confirm that as a site member, she also has **Edit** permissions.

11. Repeat the prior step and check the permission for **Alex Wilber**. You will see that Alex does not have permission to access or update the site since he has not been assigned as a site member.

12. In the **IT Services: Check Permissions** window, select **Close.**

13. You are now back in the **Permissions: IT Services** tab in your browser. You have been asked to create a new group of users and assign them permission to access the IT Services site. In the ribbon that appears at the top of the page, select **Create Group.**  

	‎**Best Practice:** It’s a best practice that you should use Groups to assign access permissions rather than assigning access to individual user accounts for two important reasons: Assigning individual users access to a site makes it difficult to track user access when the user leaves your organization, and direct permissions can override security groups permissions.

14. In the **People and Groups &gt; Create Group** window, enter the following information:   

	- Name: **Information Technology**

	- About me: **This group is used for members of the IT staff**

	- Group owner: If Holly Spencer appears as the owner, select the **X** to the right of her name to remove her, and then enter **MOD**. As you type MOD, a window appears listing users whose first name starts with MOD. Select **MOD Administrator**.  
	
		‎**Best Practice:** When you create groups make sure the group owner is either a generic Administrator account or an Administrator group. Giving ownership of groups to individuals can cause editing issues because only the owners can make changes to groups.

	- Group Settings:

		- Who can view the membership of the group: **Groups Members**

		- Who can edit the membership of the Group: **Group Owner**

	- Membership Requests:

		- Allow requests to join/leave this Group: **Yes**

		- Auto-accept requests: **No**

		- Send membership requests to the following e-mail address: If Holly Spencer’s email appears, select in the field and then select the **X** that appears to the right of her address to remove it, and then enter **admin@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Give group permission to this site:

		- Choose the permission level group members get on this site: **Full Control – Has full control**

15. Select **Create**. 

16. In the **People and Groups** window that appears, the **Information Technology** group information will appear. The users displayed in the list are the members of this group. Since Holly Spencer created the group, she is listed as the sole member.

17. In the menu bar that appears above the user list, select **New**, and then in the drop-down menu, select **Add users to this group.**

18. In the **Share ‘IT Services’** window, the **Invite people** tab is selected in the left-hand pane by default. In the **Enter names or email addresses** field, enter **Isaiah**. As you type Isaiah, a window appears listing users whose first name starts with Isaiah. Select **Isaiah Langer**. 

	Repeat this step for **Joni Sherman** (type **Joni** next to Isaiah Langer's name in the **Enter names or email addresses** field).

19. Below the personal message field, select **SHOW OPTIONS.**

20. Uncheck the **Send an email invitation** option.

21. Select **Share** to share the IT Services site with the members of this Information Technology group.

22. In the **People and Groups** window that appears, the **Information Technology** group information will appear. The members of the group (Holly, Isaiah, and Joni) should be displayed.

23. Close this **Peoples and Groups** tab in Internet Explorer. This will return you to the **IT Services** team site.

24. In the upper right-hand corner of the **IT Services** site, select the **gear (Settings)** icon.

25. In the **Settings** pane that appears, select **Site permissions.**

26. At the bottom of the **Site permissions** pane, select **Advanced permissions settings**, which opens a new **Permissions: IT Services** tab for the IT Services site.

27. In the ribbon that appears in the **Permissions** tab at the top of the **Permissions: IT Services** window,, select **Check Permissions.**  

28. On the ribbon that appears at the top of the page, select **Permission Levels**.  

	‎**Note:** This option enables you to customize permission levels to better fit your organization.

26. In the **Permission Levels** window, in the menu bar at the top of the page, select **Add a Permission Level.**

27. You want to create a permission level for your team’s web specialists who will be designing SharePoint sites upon request. They need to be assigned permission levels that provide complete editing and administrative capabilities. In the window that appears, enter the following information:

	- Name: **Designer**

	- List Permissions – select the following permission levels:

		- **Add Items**

		- **Edit Items**

		- **Delete Items**

		- **View Items**

		- **Open Items**

		- **View Versions**

	- Site Permissions – select the following permission levels:

		- **Create Subsites**

		- **Add and Customize Pages**

		- **Apply Themes and Borders**

		- **Apply Style Sheets**

		- **Browse Directories**

		- **View Pages**

		- **Enumerate Permissions** 

		- **Browse User Information**

		- **Use Remote Interfaces**

		- **Use Client Integration Features**

		- **Open**

28. Scroll to the bottom of the page and select **Create** to apply the changes that you just made.

29. The **Permission Levels** window now displays the permissions that you just added.

30. In Internet Explorer, close the **Permission Levels** tab and the **SharePoint admin center** tab.


# Proceed to Lab 3 - Exercise 3
