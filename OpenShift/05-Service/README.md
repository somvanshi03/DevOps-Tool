# ✅ **1. Create Service using oc command (basic)**

### **ClusterIP service**

```sh
oc expose pod my-pod --port=80 --target-port=8080 --name=my-service
```

### **NodePort service**

```sh
oc expose deployment my-deploy --type=NodePort --port=80 --target-port=8080 --name=my-nodeport-svc
```

### **LoadBalancer service**

```sh
oc expose deployment my-deploy --type=LoadBalancer --port=80 --target-port=8080 --name=my-lb-svc
```

### **Headless service**

```sh
oc create service clusterip my-headless-svc --cluster-ip=None --tcp=80:8080
```

---

# ✅ **2. FULL SERVICE YAML with ALL PARAMETERS (Production Ready)**

This includes:
✔ metadata
✔ annotations
✔ labels
✔ ports
✔ targetPorts
✔ nodePort (optional)
✔ sessionAffinity
✔ externalTrafficPolicy
✔ loadBalancerSourceRanges
✔ selectors
✔ clusterIP
✔ externalName
✔ headless mode

---

# 📌 **ClusterIP Service — Full YAML**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
  namespace: devca
  labels:
    app: myapp
    env: dev
  annotations:
    description: "Full parameter ClusterIP service example in OpenShift"

spec:
  type: ClusterIP
  clusterIP: 10.96.0.25     # Auto-assigned if not specified

  selector:
    app: myapp

  sessionAffinity: ClientIP
  sessionAffinityConfig:
    clientIP:
      timeoutSeconds: 10800

  ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: 8080
```

---

# 📌 **NodePort Service — Full YAML**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nodeport-service
  namespace: devca
spec:
  type: NodePort

  selector:
    app: myapp

  ports:
    - name: http
      port: 80
      targetPort: 8080
      nodePort: 30080   # NodePort range: 30000–32767
      protocol: TCP
```

---

# 📌 **LoadBalancer Service — Full YAML**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-lb-service
  namespace: devca
spec:
  type: LoadBalancer

  selector:
    app: myapp

  externalTrafficPolicy: Local
  loadBalancerSourceRanges:
    - 0.0.0.0/0

  ports:
    - name: http
      port: 80
      targetPort: 8080
      protocol: TCP
```

---

# 📌 **Headless Service (for StatefulSets)**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-headless-service
  namespace: devca
spec:
  clusterIP: None       # REQUIRED
  selector:
    app: mydb

  ports:
    - port: 3306
      targetPort: 3306
      protocol: TCP
```

---

# 📌 **ExternalName Service**

Useful to map to external DNS like `example.com`.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: external-svc
  namespace: devca
spec:
  type: ExternalName
  externalName: example.com
```

---

# ✅ **3. Commands to Apply & Verify**

### Apply service YAML

```sh
oc apply -f my-service.yaml
```

### List services

```sh
oc get svc
```

### Describe service

```sh
oc describe svc my-service
```

### Get service endpoints

```sh
oc get endpoints my-service
```

