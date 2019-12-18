# Module 4 - Lab 4 - Exercise 2 - Review Key Features of SharePoint Online

In this exercise you will review some of the basic administrator functions in SharePoint Online.

### Task 1 – Site Management

A team site includes a group of related web pages, a default document library for files, lists for data management, and web parts that can be customized to meet your collaboration needs. Adatum is excited to use team sites in SharePoint Online to improve collaboration between team members when working on specific projects. As part of your pilot project, you have been tasked with creating a team site for the Human Resources department so that the HR team can work on projects and share information from anywhere and on any device. 

1. You should already be in the **Microsoft 365 admin center** after having finished the prior exercise. 

2. In the left-hand navigation pane, under **Admin Centers**, select **SharePoint.** This will open the SharePoint admin center.

3. In the **SharePoint admin center**, in the left-hand navigation pane, under **Sites**, select **Active sites.** Note that there are already several sites in this list that you created in the previous lab. 

4. In the **Active sites** window, select the **+Create** option on the menu bar.   

	‎**Note:** Depending on the team or company need, there are several templates that can be used).

5. In the **Create a site** window, select **Team site.**

6. In the **Get a team site connected to Office 365 Groups** window, enter the following information.

	- Site name: **Human Resources**

	- Group email address: this is the alias for the group email address. As you typed in **Human Resources** in the **Site name** field, the same text automatically prefilled in this field, although the blank space was removed so that it appears as one word.

	- Group owner: type **Libby**, and in the window that appears displaying the users whose first name starts with Libby, select **Libby Hayward**.

	- Select a language: Select your appropriate language

	- Select **Advanced settings** to expand this section and then enter the following information:

		- Privacy settings: Given the confidential nature of HR information, select **Private – only members can access this site**

		- Time zone: since this group is located in Adatum’s Redmond, WA location, select **Pacific Time (US and Canada)**

		- Site Description: **This site is used by the Human Resources department** 

7. Select **Next**.

8. In the **Human Resources private group** window, in the **Add additional owners** field, enter **Holly**. As you enter Holly, a window appears listing users whose first name starts with Holly. Select **Holly Dickson**.

9. You need to add a second owner to this group. In the **Add additional owners** field, enter **Laura**. As you enter Laura, a window appears listing users whose first name starts with Laura. Select **Laura Atkins**.

10. You now want to add **Alan Yoo** and **Ada Russell** as members of this group. 

	In the **Add members** field, enter **Alan**. As you enter Alan, a window appears listing users whose first name starts with Alan. Select **Alan Yoo**. 

11. Repeat the previous step for **Ada Russell**.

12. Select **Finish**.

13. You’re now going to test the process of deleting a team site and then restoring it. In the list of **Active sites**, select the newly created **Human Resources** team site.

14. In the menu bar at the top of the page, select the **ellipsis (…)** icon, and in the drop-down menu that appears, select **Delete**. 

15. In the **Delete Office 365 group** window, select the **Delete the group “Human Resources” and all its resources** check box, and then select **Delete.** Note that the Human Resources group is no longer displayed in the **Active sites** list. 

16. In the left-hand navigation pane on the **SharePoint admin site**, under **Sites**, select **Deleted sites.** Note how the Human Resources site that you just deleted appears in the list of deleted sites. 

17. In the **Deleted sites** window, select the **Human Resources** team site.

18. In the menu bar at the top of the page, select **Restore**.

19. In the **Restore Office 365 group** window, select **Restore**. 

20. In the left-hand navigation pane on the **SharePoint admin site**, under **Sites**, select **Active sites.** The Human Resources site should once again appear in the **Active sites** list. 

21. In the **Active sites** list, select the **Human Resources** site. The summarized information for this site is displayed in the pane that appears on the right-side of the window. If you scroll down through this pane, you will see that the information that you previously entered for this site has been restored.

22. Remain in the SharePoint admin center for the next task.

 
### Task 2 – Hierarchical Permissions

SharePoint Online uses hierarchical permissions to set authorization and access of sites. In other words, when a site is created (the Parent site) any sites that are later created under that site (children sites) will, by default, inherit the main site permissions of the parent site. Since you just created a team site for Human Resources, you now plan to configure site permissions to meet the HR team’s security requirements.

1. In the **SharePoint admin center**, you should still be displaying **Active sites**.

2. Select the **Human Resources** site that you created in the prior task.

3. In the **Human Resources** pane that appears on the right, select the URL that is displayed under **URL.** 

4. A new tab will open in Internet Explorer that displays the **Human Resources** site.

5. In the upper right-hand corner of the **Human Resources** site, select the **gear** **(site settings)** icon.

6. In the drop-down menu, select **Site permissions.**

7. At the bottom of the **Site permissions** pane, select **Advance permissions settings**, which opens a new **Permissions: Human Resources** window.

8. In the **Permissions: Human Resources** window, in the ribbon that appears at the top of the page, select **Check Permissions.**  

	**Note:** This option will allow you to check access permissions for users and groups.

9. In the **Human Resources: Check Permissions** window, in the **User/Group** field, type **Libby**. As you type Libby, a window appears listing users whose first name starts with Libby. Select **Libby Hayward** and then select **Check now.** This will display the level of access that Libby has for this site, which is **Full Control**.

10. Select the x next to Libby’s name to remove her name from the User/Group field. In the **User/Group** field, type **Alan**. As you type Alan, a window appears listing users whose first name starts with Alan. Select **Alan Yoo** and then select **Check now.** This will display the level of access that Alan has for this site, which is **Edit only**.

11. Repeat the prior step and check the permission for **Adam Hobbs**. You will see that Adam does not have permission to access or update the site.

12. Select **Close.**

13. You are now back in the **Permissions: Human Resources** window. You have been asked to create a new group of users and assign them permission to access the Human Resources site. In the ribbon that appears at the top of the page, select **Create Group.**  

	‎**Best Practice:** It’s a best practice that you should use Groups to assign access permissions rather than assigning access to individual user accounts for two important reasons: Assigning individual users access to a site makes it difficult to track user access when the user leaves your organization, and direct permissions can override security groups permissions.

14. In the **People and Group &gt; Create Group** window, enter the following information:   

	- Name: **Information Technology**

	- About me: **This group is used for members of the IT staff**

	- Group owner: If Holly Dickson appears as the owner, select the x to the right of her name to remove her, and then enter **MOD.** As you type MOD, a window appears listing users whose first name starts with MOD. Select **MOD Administrator.**  
	
		‎**Best Practice:** When you create groups make sure this is either a generic Administrator account or an Administrator group. Giving ownership of groups to individuals can cause editing issues because only the owners can make changes to groups.

	- Group Settings:

		- Who can view the membership of the group: **Groups Members**

		- Who can edit the membership of the Group: **Group Owner**

	- Membership Requests:

		- Allow requests to join/leave this Group: **Yes**

		- Auto-accept requests: **No**

		- Send membership requests to the following e-mail address: If Holly Dickson’s email appears as the owner, select the x to the right of her address to remove it, and then enter **admin@M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Give group permission to this site:

		- Choose the permission level group members get on this site: **Full Control – Has full control**

15. Select **Create**. 

16. In the **People and Groups** window that appears, the **Information Technology** group information will appear. The users displayed in the list are the members of this group. Since Holly Dickson created the group, she is listed as the sole member.

17. In the menu bar that appears above the user list, select **New**, and then in the drop-down menu, select **Add users to this group.**

18. In the **Share ‘Human Resources’** window, the **Invite people** tab is selected in the left-hand pane by default. In the Enter names or email addresses field, enter **Alan**. As you type Alan, a window appears listing users whose first name starts with Alan. Select **Alan Yoo**. Repeat this process for **Adam Hobbs** and **Ada Russell.**

19. Below the personal message field, select **SHOW OPTIONS.**

20. Uncheck the **Send an email invitation** option.

21. Select **Share** to add the users to this group.

22. In the **People and Groups** window that appears, the **Information Technology** group information will appear. The members of the group (Alan, Holly, Ada, and Adam) should be displayed.

23. Close this **Peoples and Groups** tab in Internet Explorer. This will return you to the **Human Resources** team site.

24. The **Site permissions** settings should still be displayed in the right-hand pane. At the bottom of the pane, select **Advance permissions settings,** which takes you back to the **Permissions: Human Resources** page.

25. On the ribbon that appears at the top of the page, select **Permission Levels.**  

	‎**Note:** This option enables you to customize permission levels to better fit your organization.

26. In the **Permission Levels** window, in the menu bar at the top of the page, select **Add a Permission Level.**

27. You want to create a permission level for your team’s web specialists who will be designing SharePoint sites upon request. They need to be assigned permission levels that provide complete editing and administrative capabilities. In the window that appears, enter the following information:

	- Name: **Designer**

	- List Permissions – select the following:

		- **Add Items**

		- **Edit Items**

		- **Delete Items**

		- **View Items**

		- **Open Items**

		- **View Versions**

	- Site Permissions – select the following:

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

28. Select **Create.** to apply the changes that you just made.

29. The **Permission Levels** window now displays the permissions that you just added.

30. In Internet Explorer, close the **Permission Levels** tab, the **Human Resources - Home** tab, and the **SharePoint admin center** tab.


# Proceed to Exercise 3
