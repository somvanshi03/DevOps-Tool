# 🚀 **Kubernetes Advanced Interview Questions (Expert Level)**

---

# 🔷 **1. Kubernetes Architecture & API Internals**

1. Walk through what happens inside Kubernetes when a Pod is created — API → etcd → scheduler → kubelet → CNI.
2. How does Kubernetes guarantee desired state reconciliation?
3. Explain the architecture and flow of the **control plane** in HA mode.
4. How does Kubernetes handle multi-version API support and deprecations?
5. What is the role of **informers**, **listers**, and **controllers** in Kubernetes?
6. Why is Kubernetes considered an eventually consistent system?

---

# 🔷 **2. Scheduling (Deep Level)**

1. How does the scheduler perform filtering and scoring?
2. Explain custom scheduler plugins (Filter, Score, Bind, Reserve).
3. How does topology-aware scheduling work?
4. Explain pod disruption budgets (PDB) + eviction flow at scheduler level.
5. What happens if all nodes meet requirements for a pod?
6. What happens when Pod can’t be scheduled even though nodes have enough resources?

---

# 🔷 **3. Networking (Expert Level)**

1. Describe in detail how a Pod gets its IP address.
2. How do CNI plugins implement overlay, routing, NAT, and network policies?
3. Compare Calico eBPF mode vs IPTables mode.
4. How do Services work internally?

   * kube-proxy: iptables vs IPVS
   * endpoint slices
   * connection tracking
5. What are the limitations of Kubernetes DNS?
6. Explain how cross-cluster service discovery can be achieved.

---

# 🔷 **4. Storage (CSI, PVC, Stateful Workloads)**

1. How does the CSI architecture work (sidecars, controller, node plugin)?
2. Explain volumeBindingMode: Immediate vs WaitForFirstConsumer.
3. How does Kubernetes handle dynamic provisioning in multi-zone clusters?
4. Explain StatefulSet guarantees: identity, persistent storage, ordering.
5. What is the difference between ephemeral volumes, emptyDir, CSI ephemeral, and configMap projected volumes?

---

# 🔷 **5. Ingress & Gateway API**

1. Explain how an Ingress controller works internally (Nginx/HAProxy/Envoy).
2. Difference between Ingress vs Gateway API—why Gateway API is replacing Ingress.
3. How is multi-tenant ingress achieved?
4. What are path-based and host-based routing challenges?

---

# 🔷 **6. Kubernetes Security (RBAC, Secrets, Admission, Network)**

1. Difference between **Webhook Admission Controllers**: Mutating vs Validating.
2. How does Kubernetes encrypt Secrets at rest?
3. Explain Kubernetes' built-in Pod Security Admission (PSA) levels: privileged, baseline, restricted.
4. How to enforce policies using OPA Gatekeeper or Kyverno?
5. What is a ServiceAccount token projected volume?
6. How do Kubernetes NetworkPolicies technically block traffic?

---

# 🔷 **7. Deployment Strategies & Workload Management**

1. Explain advanced Deployment strategies (Canary, Blue-Green, A/B, Shadow traffic).
2. What is the difference between Deployment, DaemonSet, StatefulSet, Job, CronJob?
3. How does Kubernetes update a Deployment internally (ReplicaSets, rollout history)?
4. How to ensure zero downtime deployments?
5. How do Pod priority and preemption work?

---

# 🔷 **8. Auto-Scaling (HPA, VPA, CA)**

1. Explain how HPA metrics API works internally.
2. What are the limitations of HPA?
3. How does VPA determine recommendations?
4. How does Cluster Autoscaler decide to scale node groups?
5. What happens if HPA and VPA run together on same workload?

---

# 🔷 **9. Observability (Logging, Metrics, Tracing)**

1. How does Kubernetes expose metrics (cAdvisor, kubelet, kube-state-metrics)?
2. What is the difference between cAdvisor metrics vs kube-state-metrics?
3. Explain how Prometheus Operator works (CRDs, ServiceMonitors).
4. How do you debug:

   * Pod stuck in **CrashLoopBackOff**
   * Pod stuck in **ImagePullBackOff**
   * Pod stuck in **ContainerCreating**
5. Advanced troubleshooting using `kubectl debug --image=`.

---

# 🔷 **10. Multi-Cluster, Hybrid, & Federation**

1. How does Kubernetes Cluster Federation (KubeFed) work?
2. How do you distribute services across multi-cluster (GSLB, mesh, gateway API)?
3. How do you achieve cross-region failover?
4. What is the difference between multi-tenancy and multi-cluster architecture?
5. How do you replicate secrets/config across clusters (ExternalSecrets, Vault)?

---

# 🔷 **11. ETCD – The Brain of Kubernetes**

1. How does etcd store and retrieve data?
2. Explain watch events and why they’re important for Kubernetes.
3. What happens if etcd loses quorum?
4. How do you backup and restore etcd safely?
5. How do you tune etcd performance for large clusters?

---

# 🔷 **12. Containers & Runtime Internals**

1. Difference between Docker, containerd, CRI-O.
2. Explain Pod Sandbox concept.
3. How does kubelet use CRI to create containers?
4. How does Kubernetes decide when to garbage-collect images and containers?
5. Impact of container runtime on networking and storage.

---

# 🔷 **13. Kubernetes at Enterprise Scale**

1. How do you design a multi-team, multi-namespace cluster governance model?
2. What is the best way to isolate dev/test/prod?
3. How to implement GitOps for Kubernetes?
4. How do you secure cluster credentials for CI/CD pipelines?
5. Best practices for scaling clusters to 200+ nodes and 10,000+ Pods.

---

# 🔷 **14. Real-World Scenario-Based Questions**

1. A node is constantly going **NotReady** — how do you debug?
2. HPA is not scaling even though CPU is high — reasons?
3. Pods can't communicate across namespaces — root causes?
4. Pod stuck on “Terminating” forever — how to fix safely?
5. Deployment stuck due to a bad rollout — recovery steps?
6. Cluster Autoscaler scaled down the wrong nodes — how do you prevent this?
7. DNS queries inside Pods are slow — how to troubleshoot?
8. Kubelet is consuming 100% CPU — what are the reasons?
9. PVC stuck in Pending — how to root cause?
10. Application works on Docker but fails in Kubernetes — debugging steps?

