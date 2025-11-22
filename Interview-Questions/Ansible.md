# 🚀 **Ansible Advanced Interview Questions (Real-World + Enterprise Focus)**

---

## 🔷 **1. Architecture & Core Concepts**

1. Explain how Ansible’s execution engine works internally (Strategy plugins, TaskQueueManager, Worker threads).
2. What is the difference between a **module**, **plugin**, and **role**?
3. How does Ansible handle **idempotency**?
4. What are **facts**, how are they collected, and how can you optimize fact gathering?
5. Explain the lifecycle of a **playbook run** (connection, fact gathering, task execution, cleanup).
6. How does Ansible ensure performance without agents?
7. Explain how **async & poll** work in long-running tasks.

---

## 🔷 **2. Inventory & Dynamic Inventory**

1. How does Ansible resolve host variables from multiple inventory sources?
2. What is **dynamic inventory**, and how does it differ from static inventory?
3. Explain how to build a custom dynamic inventory script.
4. What is the precedence order: `group_vars`, `host_vars`, inventory vars, play vars, extra vars?
5. How do you handle inventory for multi-cloud or 1000+ hosts?

---

## 🔷 **3. Playbooks, Roles, and Best Practices**

1. Difference between **import_playbook**, **include_tasks**, and **import_tasks**.
2. How do **Handlers** work? When are they triggered?
3. What is the difference between `when` vs `failed_when` vs `changed_when`?
4. Explain the **Ansible role directory structure** (meta, defaults, handlers, tasks, templates).
5. What are **lookup plugins** and when to use them?

---

## 🔷 **4. Ansible Performance & Scaling**

1. How do you tune Ansible performance for large infrastructure?
2. What is **forks**, and why adjusting it matters?
3. How does `serial` execution affect performance and reliability in rolling deployments?
4. How do you disable fact gathering and what are the impacts?
5. Why is SSH pipelining used, and how does it improve performance?

---

## 🔷 **5. Error Handling, Debugging & Flow Control**

1. Explain `block`, `rescue`, and `always` with real use cases.
2. How to retry tasks on failure (`retries`, `delay`, `until`).
3. How to ignore errors safely (`ignore_errors`, `failed_when`).
4. How to debug stuck playbooks (`-vvvv`, `--step`, `debug` module).
5. What are **strategy plugins** (linear, free, host_pinned)?

---

## 🔷 **6. Templating & Jinja2**

1. How do Jinja2 filters work? Provide examples (`default`, `map`, `regex_replace`, `json_query`).
2. Difference between `{{ }}` and `{% %}` in templates.
3. How to conditionally render entire blocks in Jinja2 templates?
4. How to loop over dictionary keys in templates?
5. How to use **jinja2 loops with conditionals** inside templates?

---

## 🔷 **7. Secrets, Vault & Security**

1. How does **Ansible Vault** work internally (AES encryption mechanism)?
2. Difference between encrypting **variables**, **files**, and **string-only** values.
3. How do vault IDs help in multi-team environments?
4. How do you combine Vault with a secret manager like HashiCorp Vault or AWS KMS?
5. How do you store and retrieve credentials safely in playbooks?

---

## 🔷 **8. Ansible Collections & Extensibility**

1. What are **collections** and why were they introduced?
2. How do you create a custom Ansible module (Python or PowerShell)?
3. Difference between action plugin and module.
4. How does Ansible internally load custom plugins?
5. What is the difference between **Ansible Galaxy**, **collections**, and **roles**?

---

## 🔷 **9. Ansible Tower / AWX / Automation Controller**

1. How does the Tower execution environment differ from CLI Ansible?
2. How does credential management work in Tower?
3. What is a **project**, **inventory**, **template**, and **workflow template** in Tower?
4. How does Tower handle concurrency and job isolation?
5. Explain RBAC and multi-tenant architecture in Automation Controller.
6. What are **execution environments** (EE) and why replacing custom venvs?
7. How does **instance groups** help in scaling execution?

---

## 🔷 **10. Real-World Production Scenarios**

1. How do you handle rolling deployment of a service with zero downtime?
2. How would you create an Ansible play that works across Linux & Windows?
3. How would you implement canary releases using Ansible?
4. How do you detect configuration drift using Ansible?
5. How to safely execute Ansible in a production environment with 500+ nodes?
6. How do you structure a large Ansible repository for multiple teams?
7. What is your approach to idempotency when building custom modules?

---

## 🔷 **11. YAML, Python, and Advanced Variable Handling**

1. What is the difference between **vars**, **set_fact**, and **register**?
2. How do you use `with_items`, `loop`, `dict2items`, and nested loops efficiently?
3. How to handle variable precedence in complex hierarchies?
4. Explain **hostvars**, **groups**, **vars_prompt**, **vars_files**.
5. What are **declarative variables** vs runtime-generated variables?

