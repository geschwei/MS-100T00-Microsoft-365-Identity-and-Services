
# This script will extract your existing ticketing system from a csv file and upload it into a SharePoint list on the new IT Services team site. 
# Lines 6-8 set your execution policy as Remote Signed and installs both the Sharepoint Online module as well as the SharePoint PNP module. 
# This will enable you to remotely sign into your Sharepoint Online enviroment and create the SharePoint list in your Sharepoint IT Services site.

Set-ExecutionPolicy RemoteSigned
Install-Module -Name Microsoft.Online.SharePoint.PowerShell
Install-Module SharePointPnPPowerShellOnline

# The next two lines set variables to reduce the amount of typing you have to do.

$Credential= Get-Credential -Message "please enter your Global Administrator Credentials."
$ServiceRequestSystem= Import-Csv "C:\Users\DomainAdmin\Documents\Service Request System.csv"


# You will be prompted twice for your IT Consultant's MOD Administrator credentials. Please fill it out both times.

# This next step connects you to the Sharepoint Online site your are building the ticketing system in.

# THE FOLLOWING URL IS FOR YOUR IT SERVICES SITE ON YOUR ADATUM TENANT. REPLACE ZZZZZZ WITH YOUR ADATUM TENANT SUFFIX ID (NOT THE IT CONSULTANT'S TENANT SUFFIX ID).

Connect-PnPOnline -Url "https://m365xZZZZZZ.sharepoint.com/sites/ITServices" -Credentials $credentials



# The next line will create the  Service Request list from the General list template.

New-PnPList -Title "Service Desk Requests" -Template GenericList

# The next line will have you review the available Sharepoint list to confirm the name of the list.

Get-PnPList

# The next line will import the csv file to the terminal

$ServiceRequestSystem

# This last step associates the csv file to the existing list and replaces the older content.

# The left side of the statement is the name of the SharePoint field and the right side is a CSV column name.

foreach($Record in $ServiceRequestSystem){
Add-PnPListItem -List "Service Desk Requests" -Values @{
"issueTitle"= $Record.'IssueTitle';
"Date"= $Record.'Date';
"Location"= $Record. 'Location';
"Title"= $Record.'Issue Status';
"Description"= $Record.'Sumary Of Issue'}}

# Once this script is complete you should see a lis of the 30 ticketing system items on the output in the Powershell UI.



#Complete