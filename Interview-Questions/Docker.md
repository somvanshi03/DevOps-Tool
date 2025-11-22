# 🚀 **Docker Advanced Interview Questions**

---

# 🔷 **1. Docker Architecture & Internals**

1. Explain Docker architecture: **Docker daemon**, **containerd**, **runc**, **namespaces**, **cgroups**.
2. How does Docker manage isolation using namespaces?
3. Explain how container images are stored (UnionFS, OverlayFS, AUFS, Btrfs).
4. What is the Docker Engine lifecycle when creating a container?
5. Difference between Docker Daemon, Docker CLI, and Docker API.
6. How do you inspect container events (`docker events`) and what can they tell you?
7. How does Docker support rootless mode?

---

# 🔷 **2. Docker Images (Deep Dive)**

1. What happens internally during `docker build`?
2. How do Docker layers work? Why are they important?
3. How do you reduce image size effectively?
4. Difference between **entrypoint** and **cmd** — deep explanation.
5. How does Docker cache affect build performance?
6. Explain multi-stage builds and real use cases.
7. How does Docker handle image versioning and tagging?
8. What are image digests and why are they safer than tags?

---

# 🔷 **3. Docker Containers (Runtime Deep Dive)**

1. Steps Docker takes to start a container (namespaces → cgroups → filesystem → network → runtime).
2. How does Docker handle container logs?
3. How to debug a container stuck in CrashLoop?
4. How do you troubleshoot high CPU/memory inside a container?
5. What is the difference between `docker exec` vs `docker attach`?
6. How to limit container resources?
7. How lifecycle hooks work (`HEALTHCHECK`).

---

# 🔷 **4. Docker Networking (Advanced)**

1. Explain all Docker network drivers: **bridge**, **host**, **overlay**, **macvlan**, **none**.
2. Explain how Docker overlay networks work in Swarm.
3. Difference between Container-to-Container (C2C) vs Host networking.
4. How does DNS resolution work inside Docker?
5. What is the role of Docker embedded DNS server?
6. How to connect containers across multiple hosts without Swarm?
7. Why is `--network=host` dangerous?

---

# 🔷 **5. Docker Storage & Volumes**

1. Difference between **volume**, **bind mount**, **tmpfs**.
2. What is the Docker volume lifecycle?
3. Can Docker volumes be shared across containers? How?
4. How Docker interacts with filesystem drivers (overlay2, AUFS).
5. How to back up and restore Docker volumes?
6. How to mount external storage (NFS, EFS, CephFS) into Docker?

---

# 🔷 **6. Docker Security (Critical in Interviews)**

1. Why running containers as root is dangerous?
2. How does Docker restrict system calls (seccomp)?
3. What is AppArmor/SELinux in Docker security?
4. Explain capabilities and how to drop them.
5. How to prevent privilege escalation inside a container?
6. How to scan images for vulnerabilities (Trivy, Clair, Snyk, Anchore)?
7. How to enforce image signing with Docker Content Trust (DCT)?

---

# 🔷 **7. Docker Registries & Distribution**

1. What is the difference between Docker Hub, ECR, GCR, ACR, JFrog Docker Registry?
2. How does Docker registry work internally?
3. Explain image push/pull process with layers.
4. How do you set up a private registry with authentication?
5. What is a registry manifest?
6. Difference between manifest list and multi-arch images.
7. How to restrict access to specific images in private registry?

---

# 🔷 **8. Docker Compose & Orchestration**

1. How does Docker Compose manage multi-container communication?
2. What is the difference between `docker-compose` v2 and v3?
3. How do you override Compose files (`docker-compose -f override.yml`)?
4. How do you use `depends_on`, `healthcheck`, and service startup ordering?
5. How do you scale services in Docker Compose?
6. Explain the difference between Docker Compose vs Kubernetes.

---

# 🔷 **9. Docker Swarm (Advanced Concepts)**

1. How does Swarm handle leader election (Raft)?
2. Explain Swarm service vs container.
3. How does Swarm handle secrets?
4. How is Swarm overlay networking implemented?
5. Why is Swarm not used in production anymore compared to Kubernetes?

---

# 🔷 **10. CI/CD + Docker**

1. How do you optimize Docker builds in CI (cache, multi-stage, buildkit)?
2. What are BuildKit advantages (parallel builds, better caching, secrets)?
3. How do you securely pass secrets during Docker build?
4. How to push Docker image with Jenkins/GitLab/GitHub Actions?
5. How do you scan Docker images in pipeline?

---

# 🔷 **11. Docker Performance Tuning**

1. How do you limit CPU, memory, blkio, pids?
2. How do you profile container performance?
3. Why do long-running containers slow down filesystem?
4. What is the impact of overlay2 on performance?
5. How do you tune network for high throughput containers?

---

# 🔷 **12. Production Troubleshooting Scenarios**

These are frequently asked in senior-level interviews:

### 🔥 Scenario 1: Container high CPU usage — how do you debug?

### 🔥 Scenario 2: Image size is 2GB — optimize it.

### 🔥 Scenario 3: Docker container cannot reach internet — root cause?

### 🔥 Scenario 4: Application works locally but fails inside container — how to debug?

### 🔥 Scenario 5: Container restarting multiple times — how to troubleshoot?

### 🔥 Scenario 6: Docker build extremely slow — how to fix?

### 🔥 Scenario 7: Registry push failed with layer mismatch — solution?

---

# 🔥 BONUS: **Hands-on Advanced Questions**

1. Write a multi-stage Dockerfile to compile Go/Java/.NET and create a small runtime image.
2. Build a container with non-root user and restricted capabilities.
3. Deploy a Docker app with custom network + volume + healthcheck.
4. Create a private Docker registry with TLS and authentication.
5. Debug a broken container using `docker inspect`, `logs`, `exec`, and `events`.

