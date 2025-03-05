## Git & GitHub Tutorial: Creating a Repository and Pushing Changes

This tutorial will guide you through creating a Git repository, making changes, and pushing them to GitHub.

---
### 0. Create a Github Account (its free)
1. go to https://github.com/
2. click on sign up
3. provide your details (use personal email not comapny email)

### **1. Install Git (If Not Installed)**
Check if Git is installed by running:
```sh
git --version
```
If Git is not installed, download and install it from [git-scm.com](https://git-scm.com/).

---

### **2. Configure Git (First-Time Setup)**
Set your username and email (required for commits):
> provide Github username & password
```sh
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Verify your settings:
```sh
git config --list
```

---

### **3. Create a New Repository on GitHub**
1. Go to [GitHub](https://github.com/)
2. Click the **+** sign in the top right corner and select **"New repository"**
3. Enter a **repository name** (e.g., `my-project`)
4. Choose **Public** or **Private**
5. Click **Create repository**
6. Copy the repository URL (e.g., `https://github.com/your-username/my-project.git`)

---

### **4. Initialize Git Locally**
In your terminal or command prompt, navigate to your project folder:
```sh
cd path/to/your/project
```
Initialize Git:
```sh
git init
```
This creates a hidden `.git` folder, making it a Git repository.

---

### **5. Connect Local Repository to GitHub**
Add the remote repository URL:
```sh
git remote add origin https://github.com/your-username/my-project.git
```
Verify the remote:
```sh
git remote -v
```

---

### **6. Create a File and Commit Changes**
Create a new file:
```sh
echo "# My Project" >> README.md
```
Stage the file for commit:
```sh
git add README.md
```
Commit the changes:
```sh
git commit -m "Initial commit"
```

---

### **7. Push Changes to GitHub**
Push your changes to GitHub:
```sh
git branch -M main  # Rename the branch to 'main' (optional)
git push -u origin main
```
It will ask for your GitHub credentials (or use a **personal access token** if required).

---

### **8. Verify on GitHub**
Go to your repository on GitHub and refresh the page—you should see your file uploaded.

---

### **9. Make Further Changes and Push Updates**
Modify a file (e.g., `README.md`), then follow these steps:
```sh
git add .
git commit -m "Updated README"
git push origin main
```


---

### **Summary of Common Git Commands**
| Command | Description |
|---------|------------|
| `git init` | Initialize a local repository |
| `git remote add origin <URL>` | Link to a GitHub repository |
| `git add .` | Stage all changes for commit |
| `git commit -m "message"` | Commit changes |
| `git push origin main` | Push commits to GitHub |
| `git pull origin main` | Pull the latest changes from GitHub |
| `git clone <URL>` | Clone an existing repo |

Now you know how to create a Git repository and push changes to GitHub! 🚀
