# 🚀 **Prometheus & Grafana – Advanced Interview Questions**

---

# 🔷 **1. Prometheus Architecture & Internals**

1. Explain Prometheus architecture: TSDB, WAL, Scrape Manager, Storage Engine.
2. How does Prometheus store time-series internally?
3. What is the role of **Write-Ahead Log (WAL)**?
4. Explain the lifecycle of a metric sample from scrape → ingestion → TSDB.
5. How does Prometheus handle high-cardinality metrics?
6. Explain chunk encoding (XOR compression) and why it matters for performance.
7. What happens during a Prometheus restart? How does WAL replay work?
8. How does Prometheus avoid duplicate time-series?
9. How does Prometheus handle clock drift between nodes?

---

# 🔷 **2. PromQL Deep Dive**

1. Difference between **instant vector** and **range vector**.
2. Explain how PromQL handles subqueries (`metric[5m:30s]`).
3. What is the difference between **rate()**, **irate()**, **increase()**, and **resets()**?
4. How does **offset** work in PromQL?
5. How to detect **counter resets**?
6. Explain label matching: `=`, `!=`, `=~`, `!~`.
7. What causes “vector matching errors”?
8. Explain `group_left`, `group_right`.
9. How do you write queries to detect anomalies or spikes?

---

# 🔷 **3. Prometheus Performance & Scaling**

1. How do you scale Prometheus horizontally?
2. Difference between **federation**, **sharding**, and **remote_write storage**.
3. How to reduce load on Prometheus during scrapes?
4. How do you optimize scrape intervals for high-volume workloads?
5. What is the role of **Prometheus Operator** for running Prometheus at scale?
6. How to tune Prometheus for 1M+ active series?
7. Explain remote storage backends (Mimir, Thanos, Cortex, VictoriaMetrics).
8. What are “HA pairs” of Prometheus and how is deduping achieved?

---

# 🔷 **4. Prometheus Exporters (Deep Understanding)**

1. How do exporters expose metrics (text exposition format)?
2. Why is Node Exporter stateless and pull-based?
3. Difference between Pushgateway and Prometheus scraping.
4. When should we NOT use Pushgateway?
5. Explain kube-state-metrics architecture & why it’s not a scraper.
6. How to write a custom exporter using Python/Go?
7. Why does high-cardinality appear in exporters (common mistakes)?

---

# 🔷 **5. Alerts & Alertmanager**

1. Explain the flow: Rule Manager → Alert → AlertManager → Receiver.
2. What is **grouping** and **inhibition** in AlertManager?
3. How does AlertManager deduplicate alerts in an HA setup?
4. How to implement silence rules?
5. How to ensure that alerts fire only after sustained failures (for stability)?
6. Difference between recording rules vs alert rules.
7. How to implement multi-tenant alert routing?
8. How to visualize alerts in Grafana?

---

# 🔷 **6. Grafana Advanced Concepts**

1. Difference between Grafana OSS vs Grafana Enterprise.
2. How does Grafana store dashboards (database, provisioning, GitOps)?
3. What are **datasource plugins** and how do you write a custom one?
4. How does Grafana handle authentication (OAuth, SSO, LDAP)?
5. What is Grafana’s transformation system and when to use it?
6. Explain time-shifted queries in Grafana panels.
7. What is **Grafana Live**, and how does streaming work?
8. Difference between **dashboard variables** and **template variables**.
9. How does Grafana caching work?

---

# 🔷 **7. Loki / Tempo / Mimir (Modern Observability Stack)**

1. Explain Loki architecture: ingester, querier, distributor, storage.
2. How does Loki store logs differently from Elasticsearch?
3. What is LogQL? How does LogQL differ from PromQL?
4. How does Tempo collect and store traces without indexing?
5. How does Grafana Mimir scale long-term metrics storage?
6. Compare Thanos vs Mimir vs Cortex.
7. How do Tempo & Prometheus integrate using exemplars?

---

# 🔷 **8. Kubernetes + Prometheus + Grafana**

1. How does Prometheus Operator work?
2. Difference between ServiceMonitor vs PodMonitor vs Probe.
3. How to scrape metrics from K8S API servers securely?
4. How does kubelet expose metrics (`/metrics/cadvisor`, `/metrics/resource`)?
5. How do you monitor:

   * kube-proxy
   * etcd
   * scheduler
   * controller-manager
6. How to detect node-level resource saturation?
7. How to run Prometheus + Grafana multi-cluster setup?

---

# 🔷 **9. Security (Prometheus & Grafana)**

1. Prometheus lacks authentication — how do you secure it?
2. How to restrict queries in Grafana (permissions & query policies)?
3. How to hide sensitive labels from end-users?
4. How to secure Prometheus endpoints with MTLS?
5. How do you secure credentials in Prometheus configs (basic auth, bearer token, Kubernetes secret)?

---

# 🔷 **10. Real-World Production Scenarios**

### 🔥 Scenario 1

Prometheus TSDB memory usage is 10 GB and keeps growing — what’s the root cause?

### 🔥 Scenario 2

Grafana dashboards load very slowly — how to optimize?

### 🔥 Scenario 3

You see **high-cardinality explosion** due to labels — how do you detect and fix?

### 🔥 Scenario 4

Prometheus is missing scrapes randomly — what are possible reasons?

### 🔥 Scenario 5

Alert fired but no incident happened — how to troubleshoot false positives?

### 🔥 Scenario 6

You want centralized metrics from 10 clusters — which architecture do you choose?

### 🔥 Scenario 7

Memory leak inside exporter causes time-series explosion — how to mitigate?

### 🔥 Scenario 8

How do you troubleshoot gaps in Grafana graphs?

---

# 🔥 Bonus: Hands-on PromQL Challenges

1. Query to detect CPU throttling across namespaces.
2. Query to detect container restarts >5 in last 10 mins.
3. Query for 95th percentile latency from histogram buckets.
4. Query to detect memory leak patterns.
5. Query to find Pods with no recent traffic.

