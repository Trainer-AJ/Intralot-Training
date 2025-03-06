## AIM 
> how to clone a repository, edit the code after creating a branch, and create a pull request. Using Git and GitHub for this workflow. **Same commands can be used for Azure Repo**
---

### Step 1: Clone the Repository

1. **check if git installed**
```sh
git --version
```

3. **Clone the Repository Locally**  
   Open your terminal (or Git Bash) and run the following command, replacing the URL with the one you copied:

   ```bash
   git clone https://github.com/Trainer-AJ/upload-code-here.git
   ```

   This will clone the repository to your local machine.

4. **Navigate to the Cloned Repository**  
   Once the cloning process is complete, navigate into the directory of the cloned repository:

   ```bash
   cd upload-code-here
   ```


---

### Step 2: Create a New Branch

1. **Check Current Branch**  
   Before creating a new branch, it's good practice to check which branch you're currently on. Run:

   ```bash
   git branch
   ```

   This will show a list of all branches, and the active branch will have an asterisk (*) next to it. Typically, you should be on the `main` or `master` branch initially.

2. **Create a New Branch**  
   Now, let's create a new branch to work on. The branch name should be descriptive of the changes you're going to make. For example, if you're adding a new feature, you might call it `feature/add-login`.

   Run the following command to create a new branch and switch to it:

   ```bash
   git checkout -b terraform/your-name
   ```

   This creates and switches to a new branch called `terraform/your-name`.

3. **Create a folder here with your name**
```sh
mkdir your-name
```


---

### Step 3: Edit Code Locally

1. **Make Changes to the Code**  :
  


3. **Edit the Code**  
   

4. **Check the Status of Your Changes**  
   Once you're done editing the code, return to the terminal and run:

   ```bash
   git status
   ```

   This will show the modified files that have been changed or added.

5. **Stage the Changes**  
   To stage the changes for commit, use the `git add` command:

   ```bash
   git add .
   ```

   This stages all the changes. You can also stage specific files by replacing the `.` with the file path.

6. **Commit the Changes**  
   After staging your changes, commit them with a descriptive message. For example:

   ```bash
   git commit -m "Added new file"
   ```

---

### Step 4: Push Your Changes to GitHub

1. **Push the Changes to GitHub**  
   After committing, push your changes to the remote repository:

   ```bash
   git push origin feature/add-login
   ```

2. **Verify Your Changes**  
   Go back to GitHub in your web browser and navigate to the repository. You should see your new branch listed under the "Branch" dropdown.

---

### Step 5: Create a Pull Request (PR)

1. **Navigate to the "Pull Requests" Tab**  
   On GitHub, go to the repository’s main page. You'll see a tab labeled **Pull requests**. Click on it.

2. **Click "New Pull Request"**  
   On the Pull Requests page, click the green **New pull request** button.

3. **Select the Base and Compare Branches**  
   - **Base**: This is the branch you want your changes to be merged into. Typically, this will be `main` or `master`.
   - **Compare**: This is your newly created branch (e.g., `feature/add-login`).

   GitHub will automatically show the differences between the two branches.

4. **Write a Pull Request Description**  
   Write a title and description for your pull request, explaining what changes you made and why. Be clear and concise.

   Example PR title:
   ```
   Add login feature to the app
   ```

   Example PR description:
   ```
   - Added a login feature with email and password authentication.
   - Updated the authentication logic to integrate with the backend.
   ```

5. **Create the Pull Request**  
   After writing your description, click the green **Create pull request** button. This will open the PR for review.

---

### Step 6: Review and Merge the Pull Request

1. **Code Review**  
   If you're working with a team, someone (or yourself if you're the only one) will review the pull request. They can leave comments, request changes, or approve it.

2. **Merge the PR**  
   After the pull request is reviewed and approved, you (or the repository admin) can merge the pull request into the `main` branch by clicking the green **Merge pull request** button.

3. **Delete the Branch (Optional)**  
   After the pull request is merged, you can delete your feature branch from both your local machine and GitHub to keep things clean.

   - To delete the local branch:

     ```bash
     git branch -d feature/add-login
     ```

   - To delete the remote branch on GitHub:

     ```bash
     git push origin --delete feature/add-login
     ```

---

### Recap of the Workflow

1. Clone the repository using `git clone`.
2. Create a new branch with `git checkout -b <branch-name>`.
3. Make your changes to the code.
4. Stage and commit the changes using `git add` and `git commit`.
5. Push the changes to GitHub with `git push origin <branch-name>`.
6. Create a pull request on GitHub, compare the branches, and submit the PR.
7. Review and merge the PR after it's been approved.
8. Optionally, delete the feature branch locally and remotely.

---

This workflow is common for collaborative projects where multiple developers are working on the same repository. Creating pull requests allows for code reviews, collaboration, and tracking of changes.
