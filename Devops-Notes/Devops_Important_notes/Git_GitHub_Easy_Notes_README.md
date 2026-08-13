# Git & GitHub — Easy Notes

## 1. What is Git?

**Git** is a version control tool used to track changes in code.

Think of Git as a **time machine for your project**.

It helps you:
- Track changes
- Create branches
- Go back to previous versions
- Work with other developers

## 2. What is GitHub?

**GitHub** is an online platform where Git repositories are stored and shared.

```text
Git      → Tool on your computer
GitHub   → Online place to store/share Git repositories
```

---

## 3. Basic Git Setup

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --list
```

Create a new repository:

```bash
git init
```

Download an existing repository:

```bash
git clone <repository-url>
```

---

## 4. Git Working Flow

```text
Working Directory
       ↓ git add
Staging Area
       ↓ git commit
Local Repository
       ↓ git push
GitHub
```

### `git status`

Shows what has changed.

```bash
git status
```

### `git add`

Moves changes to the staging area.

```bash
git add file.txt
git add .
```

### `git commit`

Saves staged changes in your local Git history.

```bash
git commit -m "Add login feature"
```

### `git push`

Sends your local commits to GitHub.

```bash
git push origin main
```

---

## 5. Git Diff — See Changes

`git diff` shows changes you made but have **not staged yet**.

```bash
git diff
```

### See staged changes

```bash
git diff --staged
```

```text
git diff         → Changes not staged
git diff --staged → Changes already staged
```

---

## 6. Git Fetch vs Pull

### `git fetch`

Downloads the latest information from GitHub **without changing your current working files**.

```bash
git fetch
```

> **Fetch = Check/download remote changes.**

### `git pull`

Downloads changes from GitHub **and integrates them into your current branch**.

```bash
git pull
```

> **Pull = Fetch + integrate changes.**

### Easy difference

```text
git fetch → Download/check changes, don't update my current branch
git pull  → Download + integrate changes
```

---

## 7. Remote Repository

A remote connects your local repository to GitHub.

Check it:

```bash
git remote -v
```

Add GitHub as a remote:

```bash
git remote add origin <repository-url>
```

`origin` is the common name for the remote repository.

---

## 8. Branches

A branch is a separate line of development.

```text
main
  |
  └── feature-login
```

Create:

```bash
git branch feature-login
```

Switch:

```bash
git switch feature-login
```

Create + switch:

```bash
git switch -c feature-login
```

List:

```bash
git branch
```

Delete:

```bash
git branch -d feature-login
```

---

## 9. Merge

Merge brings changes from one branch into another.

```bash
git switch main
git merge feature-login
```

> **Merge = Combine another branch's changes into the current branch.**

If Git cannot automatically combine changes, you get a **merge conflict**. Resolve the files, then:

```bash
git add .
git commit -m "Resolve merge conflict"
```

---

## 10. Git Log

See commit history:

```bash
git log
```

Short version:

```bash
git log --oneline
```

---

## 11. Undo Commands

Remove a file from staging:

```bash
git restore --staged file.txt
```

Discard changes in a file:

```bash
git restore file.txt
```

Undo a commit safely:

```bash
git revert <commit-id>
```

`revert` creates a new commit that reverses the old commit.

Reset:

```bash
git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1
```

Easy idea:

```text
soft   → Keep changes staged
mixed  → Keep changes unstaged
hard   → Remove changes
```

Be careful with `--hard`.

---

## 12. Git Stash

Temporarily save unfinished changes.

```bash
git stash
```

See stashes:

```bash
git stash list
```

Bring changes back:

```bash
git stash pop
```

> **Stash = Temporarily keep unfinished work for later.**

---

## 13. Git Tags

Tags mark versions/releases.

```bash
git tag v1.0
git push --tags
```

Example:

```text
v1.0
v2.0
v2.1
```

> **Tag = Mark a specific version.**

---

## 14. Most Important Commands

```bash
git status
git add .
git commit -m "message"
git push
git pull
git fetch
git diff
git log --oneline
git branch
git switch
git merge
git stash
git tag
```

---

## 15. Real-Time Git Workflow

Suppose you changed `server.cpp`:

```bash
git status
git diff
git add server.cpp
git diff --staged
git commit -m "Update server"
git push origin main
```

If another developer pushed changes:

```bash
git fetch
```

Or download and integrate them:

```bash
git pull
```

---

# 🧠 Easy Revision

```text
Git        → Version control tool
GitHub     → Online Git repository platform
git init   → Start Git
git clone  → Download repository
git status → Check changes
git diff   → See changes
git add    → Stage changes
git commit → Save changes locally
git push   → Send changes to GitHub
git fetch  → Download/check remote changes
git pull   → Download + integrate remote changes
git branch → Create/manage branches
git merge  → Combine branches
git stash  → Temporarily save work
git tag    → Mark a version
```

## ⭐ Remember

```text
EDIT
 ↓
git status
 ↓
git diff
 ↓
git add
 ↓
git commit
 ↓
git push
 ↓
GitHub
```
