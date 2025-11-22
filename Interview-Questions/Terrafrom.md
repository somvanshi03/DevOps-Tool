# 🚀 **Terraform Advanced Interview Questions**

---

# 🔷 **1. Terraform Core & Architecture**

1. Explain Terraform architecture: **Core**, **Providers**, **Provisioners**.
2. How does Terraform manage dependency graphs (DAG)?
3. What is the Terraform refresh mechanism, and how does it work?
4. Difference between **terraform plan**, **apply**, **target**, and **refresh**.
5. What happens internally when you run `terraform plan`?
6. What is **Terraform graph** and how do you debug resource dependencies?
7. How does Terraform handle parallelism during deployment?

---

# 🔷 **2. State Management (Critical Topic)**

1. Why is Terraform state required?
2. What’s inside the `terraform.tfstate` file?
3. How does `terraform state rm` differ from `state rm`?
4. What are **state locking mechanisms** (S3 + DynamoDB, GCS, Consul, TFE)?
5. How do you resolve a **terraform state lock timeout**?
6. How to perform **state file recovery** if state got corrupted?
7. Difference between **local**, **remote**, and **enhanced remote** backends.
8. How does state work when multiple teams manage same infrastructure?

---

# 🔷 **3. Backends & Workspaces**

1. What is a **backend**, and what does it control?
2. Difference between **S3 backend** vs **Terraform Cloud backend**.
3. Explain **workspaces** deeply — and when NOT to use them.
4. How do you isolate environments — workspaces vs multiple state files vs folder separation?
5. How does backend migration work (`terraform init -migrate-state`)?
6. What happens to state when you change backends?

---

# 🔷 **4. Modules & Reusability**

1. Difference between **module**, **provider**, **registry module**, **repository module**.
2. How do you version modules in Git?
3. What is `for_each` vs `count` module instantiation?
4. How to build a **module with input validation** (`validation` block).
5. How do you write a module that supports multiple cloud providers?
6. What are **module composition patterns** (Root → Child → Submodules)?
7. What is **terragrunt**, and why use it instead of pure Terraform modules?

---

# 🔷 **5. Providers (Deep Level)**

1. What is a provider? How does it authenticate?
2. Provider version constraints (`>=`, `~>`, `=`).
3. How do you use multiple providers for multiple regions?
4. What is `alias` for a provider?
5. How does provider caching work?
6. What happens when provider schema changes?
7. How to use **custom providers** or build your own provider?

---

# 🔷 **6. Terraform Language (HCL2) Advanced Concepts**

1. Difference between **local values**, **variables**, and **outputs**.
2. Explain dynamic blocks with real-world usage (`dynamic` keyword).
3. Deep difference between `for_each` & `count`.
4. Use cases for `for`, `for_object`, and `toset`, `tomap`.
5. How does `depends_on` work at module vs resource level?
6. Conditional expressions with ternary vs `can()` & `try()` functions.
7. How to merge multiple maps/lists elegantly.

---

# 🔷 **7. Lifecycle Management**

1. When to use `create_before_destroy` vs `prevent_destroy`.
2. Terraform lifecycle block: `ignore_changes`, `replace_triggered_by`.
3. What is the danger of using `terraform apply -target`?
4. Explain **resource taint** and use cases.
5. What is drift detection? How does Terraform detect drift?
6. Why does Terraform sometimes recreate resources unexpectedly?

---

# 🔷 **8. Security & Secrets Management**

1. How do you store secrets securely in Terraform?
2. Why should you never store secrets in state?
3. How do Vault and Terraform integrate?
4. Difference between Vault **dynamic secrets** vs **static secrets**?
5. How do you restrict sensitive outputs (`sensitive = true`)?
6. How do you secure `.tfstate` files in shared repos?

---

# 🔷 **9. Performance, Optimization & Large-Scale Infrastructure**

1. How to reduce Terraform plan/apply time?
2. How to split Terraform stacks for a huge infrastructure?
3. How do you handle slow providers (AWS, Azure throttling)?
4. How do you test Terraform modules at scale?
5. How do you enable caching for Terraform in CI/CD?
6. What is the impact of `parallelism` flag?
7. What is Terraform CDK (CDKTF)?

---

# 🔷 **10. CI/CD Integration (GitHub Actions, GitLab, Jenkins)**

1. How do you implement GitOps with Terraform?
2. How do you automate `terraform fmt`, `validate`, `plan`, `apply`?
3. How do you run Terraform securely in Jenkins/GitLab?
4. How do you store Terraform logs/artifacts in CI?
5. How do you isolate plan vs apply in different pipeline stages?

---

# 🔷 **11. Terraform Cloud & Enterprise (TFE)**

1. Difference between Terraform Open Source vs Cloud vs Enterprise.
2. What is a **Sentinel policy**?
3. How do you enforce policies (cost, naming, resource types)?
4. How do you use Terraform remote execution mode?
5. How does private module registry work?
6. What are TFE workspaces vs CLI workspaces?
7. Explain Run Tasks (e.g., Wiz, Prisma, Aqua, Snyk integrations).

---

# 🔷 **12. Real-World Production Scenarios**

### ⚡ Scenario-Based Questions (commonly asked)

1. Your state file got corrupted — how do you recover?
2. You accidentally deleted infrastructure manually — what does Terraform do?
3. You need blue-green deployment using Terraform — how?
4. Terraform wants to recreate an RDS instance — how do you avoid downtime?
5. You want multiple dev teams to share modules but isolate states — architecture?
6. How do you manage Terraform for multi-cloud environments?
7. You need to implement cost controls — how with Terraform?

---

# 🔥 BONUS: **Terraform Code Challenges**

1. Write a module that deploys identical infrastructure across 3 regions using `for_each`.
2. Create a dynamic block that generates 10 IAM policies based on a list.
3. Create Terraform that provisions VM + registers it in LB + outputs IP.
4. Write Terraform to detect drift without applying changes.

