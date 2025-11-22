# 🚀 **Jenkins Advanced Interview Questions**

---

# 🔷 **1. Jenkins Architecture & Internals**

1. Explain Jenkins master–agent architecture. How does communication happen?
2. Difference between **JNLP**, **SSH**, and **Docker agents**?
3. How does Jenkins schedule builds internally?
4. What is an **executor**? What happens if all executors are busy?
5. How does Jenkins handle **workspace isolation** between parallel stages?
6. What happens if the Jenkins master/controller crashes mid-build?
7. Explain Jenkins' filesystem structure and how build data is stored.

---

# 🔷 **2. Jenkins Pipeline (Declarative & Scripted)**

1. Difference between Declarative and Scripted pipeline? When to use which?
2. How do `stash` & `unstash` work internally?
3. Explain `post`, `when`, `parallel`, and `matrix` pipelines.
4. What are **input steps**? Are they safe?
5. How does Jenkins maintain pipeline state across agent hops?
6. How do you share data between pipeline stages?
7. How to retry or re-run a failed stage?

---

# 🔷 **3. Jenkins Shared Libraries**

1. What is a Shared Library in Jenkins?
2. Difference between **vars/**, **src/**, and **resources/** directories?
3. How to pass parameters from Jenkinsfile to shared library?
4. How to debug a shared library?
5. How to version control shared libraries (branching, releases, etc.)?
6. How do you secure shared library code in large teams?
7. Can shared libraries perform parallel execution?

---

# 🔷 **4. Jenkins Security & Governance**

1. Difference between **Role-Based Strategy**, **Matrix Auth**, and **Project-based Security**?
2. How does Jenkins Vault/secret integration work (Cred. Binding Plugin)?
3. How do you protect secrets in Jenkins pipeline logs?
4. What is **CredentialProvider** API?
5. How do you secure Jenkinsfile from malicious Groovy code?
6. How do you restrict shell access for users running pipelines?
7. How do you implement multi-tenant isolation in Jenkins?

---

# 🔷 **5. Jenkins Performance, Scaling, and HA**

1. How do you scale Jenkins horizontally?
2. What are agent types: **Static**, **Ephemeral**, **Kubernetes**, **Docker**, **Cloud agents**?
3. How to reduce load on Jenkins master?
4. How to handle thousands of builds per day?
5. How to optimize pipeline speed (caching, shallow clones, parallel stages, shared workspaces)?
6. How do you migrate Jenkins safely to a new server?
7. Can Jenkins be made Highly Available? Explain approaches.

---

# 🔷 **6. Jenkins & Kubernetes / Cloud**

1. How does Jenkins Kubernetes Plugin work internally?
2. Explain PodTemplates, sidecar agents, and ephemeral build agents.
3. How do you pass Docker credentials into K8S agent pods?
4. How to persist workspace in ephemeral cloud agents?
5. How to build Docker images securely inside Kubernetes?

---

# 🔷 **7. Jenkinsfile Best Practices**

1. How to write idempotent pipelines?
2. How to avoid Groovy sandbox issues?
3. What is `options { durabilityHint 'PERFORMANCE_OPTIMIZED' }`?
4. How to lock resources using **lockable-resources plugin**?
5. How do you use environment blocks efficiently?

---

# 🔷 **8. Jenkins Plugin Development**

1. How to develop a Jenkins plugin using Java?
2. How does Jenkins use Stapler / Jelly views?
3. Explain Jenkins extension points.
4. How do plugin updates affect Jenkins stability?
5. What happens if a plugin introduces a classloader conflict?

---

# 🔷 **9. Jenkins Troubleshooting & Debugging**

1. Jenkins build is stuck — how do you debug?
2. Jenkins agents go offline often — root cause analysis steps?
3. Pipeline fails only on one agent — how to isolate issue?
4. Jenkins master high CPU — how to debug?
5. What are common causes of "Waiting for next executor"?
6. Jenkins workspace cleanup issues — how to fix?
7. Git checkout takes too long — how do you optimize?

---

# 🔷 **10. Jenkins + DevOps Integration**

1. How do you integrate Jenkins with GitHub/GitLab/Bitbucket webhooks?
2. How do you implement Blue-Green or Canary deployment using Jenkins?
3. How do you integrate Jenkins with SonarQube?
4. How to implement automated security scanning (SAST, DAST, container scanning)?
5. Jenkins + Helm + Kubernetes CD workflow — explain end to end.

---

# 🔥 **BONUS: Scenario-Based Advanced Questions**

These are common in senior DevOps interviews:

### **1. Jenkins job failing after 3 hours — how do you debug?**

### **2. Need to run 300 pipelines simultaneously — how do you architect it?**

### **3. Your shared library change broke all pipelines — what do you do?**

### **4. Need to migrate 400 jobs to Jenkinsfile — what strategy?**

### **5. Jenkins master using 90% CPU — what steps to analyze/fix?**

### **6. You must rotate all prod secrets — how to update Jenkins securely?**

### **7. You need cross-team governance — how do you enforce pipeline policies?**

