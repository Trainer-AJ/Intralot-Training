# How to Install Terraform on Windows, macOS, and Linux

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



