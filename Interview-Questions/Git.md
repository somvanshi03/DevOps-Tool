# 🚀 **Git Advanced Interview Questions**

---

# 🔷 **1. Git Internals & Architecture**

1. Explain how Git stores data internally (blobs, trees, commits, refs, objects).
2. What is the difference between Git **index**, **working directory**, and **object database**?
3. How does Git content-addressable storage work (SHA-1/SHA-256)?
4. What is `git hash-object` and `git cat-file` used for?
5. What are Git plumbing vs porcelain commands?
6. Explain Git packfiles, garbage collection, and how `git gc` works.
7. What is the **HEAD**, detached HEAD state, and how does Git track it?

---

# 🔷 **2. Branching, Merging & Rebasing (Deep Concepts)**

1. Difference between **merge**, **rebase**, and **merge --squash**?
2. When should you *never* use rebase?
3. How does rebase rewrite commit history internally?
4. What is an **octopus merge**?
5. What is the difference between 3-way merge and fast-forward merge?
6. How to handle complex merge conflicts with multiple files?
7. What is recursive vs resolve merge strategy?

---

# 🔷 **3. Cherry-pick, Revert & Reset**

1. Difference between **cherry-pick** and **rebase**.
2. How to revert a merge commit safely?
3. Difference between `git reset --soft`, `--mixed`, `--hard`.
4. What is an orphan branch?
5. What happens when you `git reset` a commit that is already pushed?

---

# 🔷 **4. Git Hooks & Automation**

1. What are server-side vs client-side hooks?
2. Use cases for `pre-commit`, `pre-receive`, `update`, `pre-rebase` hooks.
3. How to enforce commit message standards using hooks?
4. How to implement security scans or linting with hooks?

---

# 🔷 **5. Git Submodules & Monorepos**

1. What is a Git submodule and why is it complicated?
2. Difference between submodule vs subtree.
3. How to update submodules across multiple developers without conflicts?
4. How to handle CI/CD when using submodules?
5. How to manage monorepos using sparse checkout?

---

# 🔷 **6. Git Workflows (Enterprise Usage)**

1. Explain GitFlow, GitHub Flow, Trunk-based Development — differences & use cases.
2. What branching strategy is best for microservices environments?
3. How to enforce protected branches and PR policies?
4. How to create release branches and hotfix strategy?
5. What is PR squash merging and why use it?

---

# 🔷 **7. Git Optimization & Performance**

1. Why large repositories become slow and how to optimize them?
2. What is shallow clone and when to use it?
3. How to fix slow `git status` on huge repos?
4. How to clean large files from Git history? (`git filter-branch`, `bfg`, `filter-repo`)
5. How do packfiles improve performance?

---

# 🔷 **8. Git Security**

1. How to remove accidentally committed secrets from Git history?
2. How does Git sign commits using GPG or SSH?
3. How to enforce signed commits in CI/CD?
4. How to audit Git repository for suspicious activities?

---

# 🔷 **9. Git in CI/CD & Automation**

1. How do Git shallow clones help in Jenkins/GitHub Actions?
2. How do you trigger pipelines via webhooks?
3. How do you version artifacts using Git tags in CI/CD?
4. Difference between `git describe` vs tags vs semantic versioning.
5. How to detect changed files between commits in CI/CD?

---

# 🔷 **10. Real-World Advanced Scenarios**

### 🔥 **Scenario 1**

You rebased a branch that was already pushed. What is the safest recovery?

### 🔥 **Scenario 2**

Two developers pushed changes to the same branch — multiple merge conflicts. How do you fix cleanly?

### 🔥 **Scenario 3**

You committed a secret key and pushed it. What steps do you take immediately?

### 🔥 **Scenario 4**

You need to revert a feature merge from `main` but keep other commits. What to do?

### 🔥 **Scenario 5**

A repo is 5GB because of old binary files. How do you clean and shrink it?

### 🔥 **Scenario 6**

Developer accidentally deleted a branch — how to recover in Git?

### 🔥 **Scenario 7**

You need to create a hotfix from an old tag — what is the correct branching strategy?

### 🔥 **Scenario 8**

You want to squash 10 commits but keep commit authors intact. How?


