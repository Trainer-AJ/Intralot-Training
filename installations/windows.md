# Install Terraform
1. [Quick Method](#quick-method)
2. [Time consuming Method](#long-method)


# Quick Method
1. Open PowerShell as Administrator.
2. Run the script below by copying and pasting it into the PowerShell window.
> After the script finishes, Terraform should be installed, and you can verify the installation by running terraform -v in PowerShell.
```ps1
# Step 1: Define the URL and paths
$terraformUrl = "https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_windows_386.zip"
$downloadPath = "$env:USERPROFILE\Downloads"
$extractPath = "$downloadPath\terraform"

# Step 2: Download the Terraform ZIP file
Write-Host "Downloading Terraform..."
Invoke-WebRequest -Uri $terraformUrl -OutFile "$downloadPath\terraform.zip"

# Step 3: Extract the ZIP file
Write-Host "Extracting Terraform ZIP..."
Expand-Archive -Path "$downloadPath\terraform.zip" -DestinationPath $extractPath

# Step 4: Move Terraform to C:\terraform
Write-Host "Moving Terraform to C:\terraform..."
New-Item -ItemType Directory -Force -Path "C:\terraform"
Move-Item -Path "$extractPath\terraform.exe" -Destination "C:\terraform\terraform.exe"

# Step 5: Update the system PATH environment variable
Write-Host "Updating system PATH..."
[System.Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\terraform", [System.EnvironmentVariableTarget]::Machine)

# Step 6: Verify the installation
Write-Host "Terraform installation complete. Verifying..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "terraform -v"

```

3. Close the terminal => open it again ==> type `terraform -v `
you should get response similar to below:
```sh
PS C:\Users\aj> terraform -v
Terraform v1.10.5
on windows_386
```

# Long Method

Developed by HashiCorp, Terraform is a powerful open-source Infrastructure as Code (IaC) tool that facilitates infrastructure management and creation on-premises and in the cloud. However, installing Terraform can be challenging without proper guidance. This guide will walk you through the installation process on Windows, macOS, and Linux.

## Prerequisites

Before you start the installation process, ensure you have:

- A Windows PC (for Windows installation)
- A Linux system (for Linux installation; Ubuntu 20.04 is used here)
- Basic command-line knowledge

## How to Install Terraform on Windows

### 1. Download the Installation File
- Navigate to the Terraform download page [Terraform Downloads](https://www.terraform.io/downloads.html).
- Choose the Windows version (e.g., v1.1.0) and download the `.zip` file.

![Downloading V1.1.0 from Terraform Downloads](https://spacelift.io/_next/image?url=https%3A%2F%2Fspaceliftio.wpcomstaging.com%2Fwp-content%2Fuploads%2F2021%2F12%2Fimage17-1.png&w=1920&q=75)

### 2. Unzip the File
- Create a folder on the C drive, `C:/terraform`, and extract the `.exe` file there.

[![C:/terraform](https://spacelift.io/_next/image?url=https%3A%2F%2Fspaceliftio.wpcomstaging.com%2Fwp-content%2Fuploads%2F2021%2F12%2Fimage21.png&w=1920&q=75)

### 3. Update Path Environment Variable
- Open the Start menu, search for "Environment variables," and open the Environment Variables settings page.
  
![Updating Path Environment Variabl](https://github.com/user-attachments/assets/657dd7b1-e641-4add-b700-846794ac18bc)

- Add the `C:/terraform` folder path to the Path variable.
![](https://spacelift.io/_next/image?url=https%3A%2F%2Fspaceliftio.wpcomstaging.com%2Fwp-content%2Fuploads%2F2021%2F12%2Fimage10-1-1.png&w=1920&q=75)


### 4. Verify Installation
- Open a command prompt and run:
  ```bash
  terraform --version
  ```

![image](https://github.com/user-attachments/assets/535d8cc1-2dea-4824-b51b-4c4e844b3a39)



