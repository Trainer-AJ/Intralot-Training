## how to Install Terraform on Linux (Ubuntu)

### Installation Using Package Repositories

1. **Update System**:  
   Run the following to update your system and install necessary packages:
   ```bash
   sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
   ```

2. **Add HashiCorp Repository**:  
   Add the HashiCorp GPG key and repository:
   ```bash
   curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
   sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
   sudo apt-get update
   ```

3. **Install Terraform**:
   Install Terraform with:
   ```bash
   sudo apt-get install terraform
   ```

4. **Verify Installation**:
   To verify the installation, run:
   ```bash
   terraform --version
   ```

![Verifying Installation on Linux](https://example.com/linux-verify)

### Install Using the Zip Archive

1. **Download the Zip Archive**:
   Go to [Terraform Downloads](https://www.terraform.io/downloads.html), select the Linux version, and copy the download link.

![Linux Download Link](https://example.com/linux-download)

2. **Extract and Install**:
   Use the following commands to download and unzip Terraform:
   ```bash
   curl -LO <download-link>
   unzip terraform_*.zip
   sudo mv terraform /usr/local/bin/
   ```
