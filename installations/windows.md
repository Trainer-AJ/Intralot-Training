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

![Downloading V1.1.0 from Terraform Downloads](https://example.com/download-image)

### 2. Unzip the File
- Create a folder on the C drive, `C:/terraform`, and extract the `.exe` file there.

![C:/terraform](https://example.com/terraform-folder)

### 3. Update Path Environment Variable
- Open the Start menu, search for "Environment variables," and open the Environment Variables settings page.
- Add the `C:/terraform` folder path to the Path variable.

![Updating Path Environment Variable](https://example.com/path-variable)

### 4. Verify Installation
- Open a command prompt and run:
  ```bash
  terraform --version
  ```

![Verifying Installation](https://example.com/verify-installation)


## How to Install Terraform on macOS

1. **Install Using Homebrew**:
   You can install Terraform using Homebrew:
   ```bash
   brew install terraform
   ```

2. **Verify Installation**:
   After installation, verify Terraform is correctly installed by running:
   ```bash
   terraform --version
   ```

## Conclusion

This guide covered the installation of Terraform on Windows, Linux, and macOS. Following these steps should ensure that Terraform is installed and ready for use on your system.
```

You can replace the `![Image](URL)` placeholders with actual URLs for the images if needed. Let me know if you need anything else!
