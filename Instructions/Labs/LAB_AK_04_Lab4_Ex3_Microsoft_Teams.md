# Module 4 - Lab 4 - Exercise 3 - Review Key Features of Microsoft Teams

In this exercise you will learn how to manage and configure teams through the Microsoft Teams admin center.

### Task 1 – Manage Meeting Policies

Meeting policies control the features that are available to meeting participants for meetings that are scheduled by users in your organization. An organization-wide policy named Global is created by default, and all users in your organization are assigned this meeting policy by default. You can either make changes to this policy or create one or more custom policies and assign users to them. When you create a custom policy, you can allow or prevent certain features from being available to your users, and then assign it to one or more users who will have the settings applied to them. 

As Holly Spencer, Adatum's Enterprise Administrator, you want to customize the company's Global meeting policy as part of Adatum’s pilot project for implementing Microsoft Teams.

1. In the **Microsoft 365 admin center**, in the left-hand navigation pane, under **Admin Centers**, select **Teams.** This will open the Microsoft Teams admin center.

2. In the **Microsoft Teams admin center**, the left-hand navigation pane by default only displays the icons of each feature area. For easier navigation, select the navigation menu option at the top (the 3 lines, above the house). This expands the navigation pane. 

3. In the expanded left-hand navigation pane, select **Meetings** and then in the drop=down menu, select **Meeting policies.**

4. In the Meeting policies window, select **Global (Org-wide default)**. This opens the **Global** window.

5. In the Global window, under the **General** section, review each option. All options should be turned **On.**

6. Scroll down and under the **Audio &amp; video** section, review each option. Set **Allow transcription** to **On.**

7. Scroll down and under the **Content Sharing** section, review each option. Set **screen sharing mode** to **Single application.**

8. Scroll down and under the **Participant &amp; guests** section, review each option. Set **allow dial-in users to bypass the lobby** to **On.**

9. Scroll to the bottom of the page and select **Save.**


### Task 2 – Manage Meeting Settings

As Holly Spencer, Adatum’s Microsoft 365 Enterprise Administrator, you use the Teams meetings settings to control whether anonymous users can join Teams meetings and customize meeting invitations. You can also use these settings to enable Quality of Service (QoS) and set port ranges for real-time traffic. These settings apply to all Teams meetings that users schedule in your organization. As part of Adatum’s pilot project for implementing Microsoft Teams, you want to configure Teams meeting settings to see how they handle email invitations.

1. On the left-hand navigation pane in the **Teams admin center**, select **Meetings** and then select **Meeting settings.**

2. Under the **Email invitation** section, enter the following information:

	- Logo URL: leave blank

	- Legal URL: **https://adatum.com/legal/html**

	- Help URL: **https://adatum.com/joingingmeetinghelp.htm**

	- Footer: **Please accept at your earliest convenience. Thank you!!!!**

3. Select **Preview invite**.

4. Review the preview image of the invitation and then select **Close**.

5. Under the **Network** section, review the current settings.  

	‎**Note:** If you have specific ports that your company uses for sending and receiving media traffic, this is where you would enter those ports. If you do not have specific media ports prescribed by your network administrator, then you would leave this section alone. For the purposes of this lab, you will not update this section. 

6. Scroll to the bottom of the page and select **Save**.
 

### Task 3 – Manage Messaging Policies

Messaging policies are used to control which chat and channel messaging features are available to users in Microsoft Teams. You can use the Global default policy that is created automatically or create one or more custom messaging policies for people in your organization. After you create a policy, you can assign it to a user or group of users in your organization. 

As part of your Microsoft Teams pilot project for Adatum, you want to create a new messaging policy that addresses the chat and channel messaging requirements set forth by Adatum’s project team. 

1. On the left-hand navigation pane in the **Teams admin center**, select **Messaging policies.**

2. In the **Messaging policies** window, select **+Add** in the menu bar at the top of the page.

3. Select the **New messaging policy** field at the top of the page and enter **Chat and Channel Messaging Policy** as the name of the policy.

4. Select the following values for each option:

	- Owners can delete sent messages: **Off**

	- Users can delete sent messages: **Off**

	- User can edit sent messages: **On**

	- Read receipts: **Turned on for everyone**

	- Chat: **On** 

	- Use Giphys in conversations: **Off**

	- Giphy content rating: **Strict**

	- Use memes in conversations: **Off**

	- User stickers in conversations: **Off**

	- Allow URL preview: **On**

	- Allow users to translate messages: **On**

	- Allow immersive reader for viewing messages: **On**

	- Lets users send urgent messages using priority notifications: **On** 

	- Voice message creation: **Allowed in chats and channels**

	- On mobile devices, display favorite channels about recent chats: **Disabled**

	- Allow a user to remove users from a group chat: **Off**

5. Select **Save.** 
 

### Task 4 – Create a Resource Account

A resource account, which is also known as a disabled user object in Azure Active Directory, can be used to represent resources in general. For example, a resource account in Exchange can be used to represent conference rooms. In Microsoft Teams, each Phone System call queue or auto attendant is required to have an associated resource account. 

As part of Adatum’s pilot project for implementing Microsoft Teams, you have been asked to create a resource account for a cloud call queue, which is a service that accepts customer calls, plays a greeting message, and then places the customer calls in a wait queue while searching a pre-configured list of agents to answer each call. 

Creating a calling queue is a two-step process. In this task, you will first create a resource account that represents the call queue. In the next task, you will create the call queue and associate it with this resource account. 

1. On the left-hand navigation pane in the **Teams admin center**, select **Org-wide Settings** and then select **Resource accounts.**

2. In the **Resource accounts** window, select **+Add** in the menu bar at the top of the page.

3. In the **Add resource account** pane, enter the following information:

	- Display name: **Calling Queue 1**

	- Username: **CQ1**

	- Domain name: In the domain name field to the right of the username, select the drop-down arrow and select **M365xZZZZZZ.onmicrosoft.com** (where ZZZZZZ is your unique tenant ID provided by your lab hosting provider)

	- Resource account type: **Call queue**

4. Select **Save**.


### Task 5 - Create a Call Queue

Now that you have created the resource account for your calling queue, you will create the call queue itself and assign it the resource account.

1. On the left-hand navigation pane in the **Teams admin center**, select **Voice** and then select **Call queues.**

2. In the **Call queues** window, select **+Add** in the menu bar at the top of the page.

3. The unnamed field at the top of the page is the title of the call queue. A message displays below this field indicating that it’s required as well as its length. Enter **Call Queue 1**  as the name of the call queue.

4. The page displays a message indicating **You haven’t added any resource accounts**. Below this message, select **Add accounts**.

5. In the **Add account** pane, in the **Search** box, enter **Calling.** As you type Calling, a window appears listing call queues whose title starts with Calling. **Calling Queue 1** is displayed. As you hover your mouse over **Calling Queue 1**, an **Add** button appears to the right. Select the **Add** button.

6. At the bottom of the **Add accounts** pane, select **Add.** This returns you to the **Call Queue 1** window, which now displays **Calling Queue 1** in the list of Resource accounts.

7. In the **Call Queue 1** window, scroll down the page and select the following values for each option:

	- Greeting: **No greeting**

	- Music on hold: **Play default music**

	- Call answering: select the **Add call agents** button. In the **Add call agents** pane, in the **Search** box, enter **Sales.** As you type Sales, a window appears listing call agents whose name starts with Sales. As you hover your mouse over **Sales Department**, an **Add** button appears to the right. Select the **Add** button.

	- Routing Method: **Round Robin**   
	
		‎**Note:** The Routing Method text may be covered up by the **Call agents** box. However, the Round Robin option appears below the box, so select it.

	- Agents can opt out of taking calls: **On**

	- Call overflow: **leave all settings to their default values**

	- Call time out handling: **leave all settings to their default values**

8. Select **Save**.


### Task 6 - Create a Calling Policy 

In Microsoft Teams, calling policies control which calling and call forwarding features are available to users. Calling policies determine whether a user can make private calls, use call forwarding or simultaneous ringing to other users or external phone numbers, route calls to voicemail, send calls to Call Groups, use delegation for inbound and outbound calls, and so on. A default global policy is created automatically, but admins can also create and assign custom calling policies. 

As part of your Microsoft Teams pilot project, you will create a custom calling policy for Adatum. Instead of customizing the default global policy, you will follow best practice guidelines and create your own customized policy that will be used as Adatum’s default policy.

1. On the left-hand navigation pane in the **Teams admin center**, select **Voice** and then select **Calling policies.**

2. In the **Calling policies** window, select **+Add** in the menu bar at the top of the page.

3. Select the **Add new calling policy** field at the top of the page and enter **Default Adatum Calling Policy** as the name of the policy.

4. In the window that appears, scroll down the page and select the following values for each option:

	- Make private calls: **On**

	- Call forwarding and simultaneous ringing to people in your organization: **Off**

	- Call forwarding and simultaneous ringing to external phone numbers: **Off**

	- Voicemail is available for routing inbound calls: **Enabled**

	- Inbound calls can be routed to a call group: **On**

	- Allow delegation for inbound and outbound calls: **Off**

	- Prevent toll bypass and send calls through the PSTN: **On**

	- Busy on busy is available when in a call: **On**

5. Select **Save**.
 

### Task 7 – Manage External Access

With Microsoft Teams’ external access feature, Teams users from other domains can participate in your chats and calls. You can also block the users in specific domains from joining chats and calls. 

As part of your Microsoft Teams pilot project, you will enable the users from one external domain to participate in chats and calls, and you will block users from another domain from doing the same. 

1. On the left-hand navigation pane in the **Teams admin center**, select **Org-wide settings** and then select **External access.**

2. In the **External access** window, select **Add a domain.**  

	**Note:** This action enables you to communicate with users from specific domains.

3. In the **Add a domain** window, enter the following information:

	- Domain: **microsoft.com**

	- Action to take on this domain: **Allowed**

4. Select **Done.** 

5. In the **External access** window, select **Add a domain.**

6. In the **Add a domain** window, enter the following information:

	- Domain: **spam.com**

	- Action to take on this domain: **Blocked**

7. Select **Done.**

8. In the **External access** window, validate that **microsoft.com** and **spam.com** are represented in the list of domains.

9. Select **Save.**
 

### Task 8 – Manage Guest Access

Microsoft Teams’ guest access feature is a tenant-level setting that is turned Off by default. Once this setting is turned On, you can configure settings for guests. IT admins can add guests at the tenant level, set and manage guest user policies and permissions, and generate reports on guest user activity. 

As part of your Microsoft Teams pilot project for Adatum, you will turn on guest access and then customize a variety of the guest settings as defined by Adatum’s project team.

1. On the left-hand navigation pane in the **Teams admin center**, select **Org-wide settings** and then select **Guest access.**

2. In the **Guest access** window, set the **Allow guest access in Teams** option to **On**. 

3. Once you set this switch to **On**, a variety of options are enabled. Set these options to the following values:

	- Calling

		- Make private calls: **Off**

	- Meeting

		- Allow IP video: **On**

		- Screen sharing mode: **entire screen**

		- Allow meet now: **On**

	- Messaging

		- Edit sent messages: **Off**

		- Delete sent Messages: **Off**

		- Chat: **On**

		- Use Giphys in conversations: **Off**

		- Giphy content rating: **Strict**

		- Use Memes in conversations: **Off**

		- User Stickers in conversations: **Off**

		- Allow immersive reader for viewing messages: **On**

4. Select **Save.**


### Task 9 – Manage Teams Settings

Microsoft Teams includes a variety of global settings that control performance within Teams. As part of your Microsoft Teams pilot project, you will configure a number of these settings as determined by Adatum’s project team.

1. On the left-hand navigation pane in the **Teams admin center**, select **Org-wide settings** and then select **Teams settings.**

2. In the **Teams settings** window, select the following values for each option:

	- Email integration

		- Allow users to send emails to a channel email address: **On**

		- Accept channel email from these SMTP Domains: **microsoft.com**

	- Files

		- ShareFile: **On**

		- DropBox: **Off**

		- Box: **Off**

		- Google Drive: **Off**

	- Organization

		- Show Organization tab in chats: **On**

	- Devices

		- Require a secondary form of authentication to access meeting content: **No access**

		- Set content pin: **Required for outside scheduled meeting**

		- Resource accounts cans send messages: **On**

	- Search by name

		- Scope directory search using an Exchange address book policy: **On**

3. Select **Save.**

4. Since this is the end of Lab 4, close Internet Explorer.  


# End of Lab 4
