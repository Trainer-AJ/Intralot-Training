---
lab:
  title: "Validate lab environment"
  module: "Module 0: Welcome"
---


## Instructions to create an Azure DevOps Organization (you only have to do this once)

> **Note**: DO `NOT USE` INTRALOT ACCOUNT FOR AZURE PORTAL / AZURE DEVOPS

### launch your Lab in xtremelabs [HERE](https://labs.xtremelabs.io/Account/LogOn?returnUrl=%2fMyAccount), launch labs => login to Azure Portal using the lab credentials IN `INCOGNITO WINDOW ` and continue

1. Open a browser and navigate to Azure portal at `https://portal.azure.com`, then search at the top of the Azure portal screen for **Azure DevOps**. In the resulting page, click **Azure DevOps organizations**.

1. Next, click on the link labelled **My Azure DevOps Organizations** or navigate directly to `https://aex.dev.azure.com`.

1. On the **We need a few more details** page, select **Continue**.

1. In the drop-down box on the left, choose **Default Directory**, instead of **Microsoft Account**.

1. If prompted (_"We need a few more details"_), provide your name, e-mail address, and location and click **Continue**.

1. Back at `https://aex.dev.azure.com` with **Default Directory** selected click the blue button **Create new organization**.

1. Accept the _Terms of Service_ by clicking **Continue**.

1. If prompted (_"Almost done"_), leave the name for the Azure DevOps organization at default (it needs to be a globally unique name) and pick a hosting location close to you from the list.

1. Once the newly created organization opens in **Azure DevOps**, select **Organization settings** in the bottom left corner.

1. At the **Organization settings** screen select **Billing** (opening this screen takes a few seconds).

1. Select **Setup billing** and on the right-hand side of the screen, select your **Azure Subscription** and then select **Save** to link the subscription with the organization.

1. Once the screen shows the linked Azure Subscription ID at the top, change the number of **Paid parallel jobs** for **MS Hosted CI/CD** from 0 to **3**. Then select **SAVE** button at the bottom.

   > **Note**: You may **wait a couple of minutes before using the CI/CD capabilities** so that the new settings are reflected in the backend. Otherwise, you will still see the message _"No hosted parallelism has been purchased or granted"_.



To follow all lab instructions, you'll need set up a new Azure DevOps project, create a repository that's based on the [intralot](https://github.com/Trainer-AJ/Intralot-Training.git) application, and create a service connection to your Azure subscription.

### Create the team project

First, you'll create an **intralot** Azure DevOps project to be used by several labs.

1. Open your browser and navigate to your Azure DevOps organization.

1. Select the **New Project** option and use the following settings:

   - name: **intralot**
   - visibility: **Private**
   - Advanced: Version Control: **Git**
   - Advanced: Work Item Process: **Scrum**

1. Select **Create**.

   ![Screenshot of the create new project panel.](images/create-project.png)


