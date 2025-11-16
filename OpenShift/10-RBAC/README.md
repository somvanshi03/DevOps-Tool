# 🚀 **1. WHAT IS INCLUDED IN OPENSHIFT RBAC?**

### **RBAC Components**

| Component               | Scope     | Purpose                          |
| ----------------------- | --------- | -------------------------------- |
| **Role**                | Namespace | Permissions within a namespace   |
| **RoleBinding**         | Namespace | Bind Role → User/SA/Group        |
| **ClusterRole**         | Cluster   | Permissions across cluster       |
| **ClusterRoleBinding**  | Cluster   | Bind ClusterRole → User/SA/Group |
| **ServiceAccount (SA)** | Namespace | Identity used by pods            |

---

# ----------------------------------------------------

# ✅ **2. CREATE SERVICEACCOUNT**

```sh
oc create sa my-serviceaccount -n devca
```

YAML:

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-serviceaccount
  namespace: devca
```

---

# ----------------------------------------------------

# 🎯 **3. CREATE ROLE (NAMESPACED RBAC) — Full Parameters**

### **A. Create Role using oc command**

```sh
oc create role my-role \
  --verb=get,list,watch,create,update,delete \
  --resource=pods,deployments,secrets,configmaps \
  -n devca
```

### **B. FULL Role YAML**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: my-role
  namespace: devca
  labels:
    app: myapp
  annotations:
    description: "Full Role Example"
rules:
  - apiGroups: [""]
    resources: ["pods", "pods/log", "services", "configmaps"]
    verbs: ["get", "list", "watch", "create", "update", "delete"]

  - apiGroups: ["apps"]
    resources: ["deployments", "daemonsets", "replicasets"]
    verbs: ["get", "list", "create", "update"]

  - apiGroups: ["batch"]
    resources: ["jobs", "cronjobs"]
    verbs: ["get", "list", "create"]
```

---

# ----------------------------------------------------

# 🎯 **4. CREATE ROLEBINDING (Bind Role → User/SA)**

### **A. Using oc command**

Bind Role `my-role` to ServiceAccount `my-serviceaccount`:

```sh
oc create rolebinding my-rolebinding \
  --role=my-role \
  --serviceaccount=devca:my-serviceaccount \
  -n devca
```

### **B. Full RoleBinding YAML**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: my-rolebinding
  namespace: devca
  annotations:
    description: "Bind Role to ServiceAccount"
subjects:
  - kind: ServiceAccount
    name: my-serviceaccount
    namespace: devca
roleRef:
  kind: Role
  name: my-role
  apiGroup: rbac.authorization.k8s.io
```

---

# ----------------------------------------------------

# 🚀 **5. CREATE CLUSTERROLE — Full Parameters**

A ClusterRole is **cluster-wide**.

### **A. Create via oc**

```sh
oc create clusterrole my-cluster-role \
  --verb=get,list,watch \
  --resource=nodes,pods,persistentvolumes
```

### **B. Full ClusterRole YAML**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: my-cluster-role
  labels:
    owner: platform-team
rules:
  - apiGroups: [""]
    resources: ["nodes", "pods", "persistentvolumes"]
    verbs: ["get", "list", "watch"]

  - apiGroups: ["storage.k8s.io"]
    resources: ["storageclasses"]
    verbs: ["get", "list"]

  - apiGroups: ["apps"]
    resources: ["deployments", "daemonsets"]
    verbs: ["get", "list", "watch"]
```

---

# ----------------------------------------------------

# 🚀 **6. CREATE CLUSTERROLEBINDING (ClusterRole → SA/User)**

### **A. Using oc command**

```sh
oc create clusterrolebinding my-crb \
  --clusterrole=my-cluster-role \
  --serviceaccount=devca:my-serviceaccount
```

### **B. Full ClusterRoleBinding YAML**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: my-crb
  annotations:
    description: "Bind ClusterRole to SA"
subjects:
  - kind: ServiceAccount
    name: my-serviceaccount
    namespace: devca
roleRef:
  kind: ClusterRole
  name: my-cluster-role
  apiGroup: rbac.authorization.k8s.io
```

---

# ----------------------------------------------------

# 🧪 **7. Verify RBAC**

### List roles:

```sh
oc get roles -n devca
```

### List clusterroles:

```sh
oc get clusterroles
```

### Verify rolebinding:

```sh
oc get rolebinding -n devca
oc describe rolebinding my-rolebinding -n devca
```

### Verify clusterrolebinding:

```sh
oc get clusterrolebindings
oc describe clusterrolebinding my-crb
```

### Check which permissions a user/SA has:

```sh
oc auth can-i get pods --as=system:serviceaccount:devca:my-serviceaccount
```

---

# ----------------------------------------------------

# 🔥 **8. Example: Complete RBAC for a Deployment’s ServiceAccount**

This is often needed in OpenShift.

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: app-sa
  namespace: devca
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: app-role
  namespace: devca
rules:
  - apiGroups: [""]
    resources: ["pods", "services", "configmaps"]
    verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: app-rolebinding
  namespace: devca
subjects:
  - kind: ServiceAccount
    name: app-sa
    namespace: devca
roleRef:
  kind: Role
  name: app-role
  apiGroup: rbac.authorization.k8s.io
```

