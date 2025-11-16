# namespace (Project)
# ✅ **1. Switch to the `devca` project (namespace)**

```bash
oc project devca
```

If the project does not exist, create it:

```bash
oc new-project devca
```

---

# ✅ **2. Create a Pod using YAML**

Create a file named **pod.yaml**:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: test-pod
  labels:
    app: test-pod
spec:
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - containerPort: 80
```

Apply it:

```bash
oc apply -f pod.yaml
```

---

# ✅ **3. Create a Pod directly from CLI**

You can also run a pod without YAML:

### **Using `oc run`:**

```bash
oc run test-pod --image=nginx --restart=Never -n devca
```

---

# ✅ **4. Verify Pod Status**

```bash
oc get pods -n devca
```

---

# Optional: Expose Pod (Service)

```bash
oc expose pod test-pod --port=80 -n devca
```

