# Basic Commands 

## Basic Cluster Info

```bash
oc cluster-info
```

Displays the API server and web console URLs for the cluster.[3][7]

```bash
oc status
```

Shows a current summary of the cluster’s health — which project you’re in, the number of running pods, and any warnings.[7][3]


## Node and Pod Status

```bash
oc get nodes
```
Lists all nodes and their readiness state (`Ready`, `NotReady`, `SchedulingDisabled`, etc.).[6][3]

```bash
oc describe node <node-name>
```
Provides detailed node information including allocated resources, labels, and conditions.[7]

```bash
oc get pods -A | grep -v -e Running -e Completed
```
Quickly identifies non-running pods across all namespaces.[3]


## Cluster Operators and Components

```bash
oc get co
```
Lists all OpenShift cluster operators and their statuses (`Available`, `Degraded`, `Progressing`).[3][7]

```bash
oc get clusterversion
```
Shows the current OpenShift version and update status.[5][3]

```bash
oc adm upgrade status
```
Displays detailed upgrade progress and any issues during cluster updates (enable with `export OC_ENABLE_CMD_UPGRADE_STATUS=true`).[5]


## Resource Health and Metrics

```bash
oc adm top nodes
oc adm top pods
```
Shows live CPU and memory usage for nodes and pods (requires Metrics server).[6][3]

```bash
oc get pv
oc get pvc
```
Lists persistent volumes and claims — useful for checking storage resource health.[6]


## Event and Diagnostic Commands

```bash
oc get events -A | tail
```
Prints the latest cluster events across namespaces.

```bash
oc adm must-gather
```
Collects diagnostic information for troubleshooting cluster issues.[7]

***

## Summary Table

| Purpose            | Command                 | Description  |
|--------------------|-------------------------|--------------|
| Basic Info         | `oc cluster-info`       | Show API & console URLs [3] |
| Health Summary     | `oc status`             | Overview of cluster health [3] |
| Node State         | `oc get nodes`          | Check node readiness [3] |
| Cluster Operators  | `oc get co`             | Operator availability and degradations [3] |
| Cluster Version    | `oc get clusterversion` | View OpenShift version status [5] |
| Resource Stats     | `oc adm top nodes/pods` | CPU/memory usage [3] |
| Diagnostics        | `oc adm must-gather`    | Debug and collect logs [7] |

