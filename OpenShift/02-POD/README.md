# ✅ **1. Create Pod in OpenShift using oc command (with parameters)**

### **Basic command**

```sh
oc run my-pod \
  --image=nginx:latest \
  --restart=Never \
  --port=80 \
  --labels="app=myapp,env=dev" \
  --env="ENV=dev" \
  --env="VERSION=1.0" \
  --requests='cpu=100m,memory=128Mi' \
  --limits='cpu=200m,memory=256Mi' \
  --dry-run=client -o yaml > my-pod.yaml
```

This command **generates pod YAML** with all parameters, but does NOT create it until you run:

```sh
oc apply -f my-pod.yaml
```

---

# ✅ **2. Full Pod YAML with all parameters**

Below is **full production-style Pod YAML** including:

✔ metadata
✔ labels & annotations
✔ containers
✔ ports
✔ env variables
✔ resource limits
✔ volume mounts
✔ livenessProbe / readinessProbe
✔ securityContext
✔ imagePullPolicy
✔ serviceAccount
✔ nodeSelector
✔ tolerations
✔ affinity

---

## **Complete Pod YAML – FULL parameters**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
  namespace: devca
  labels:
    app: myapp
    env: dev
  annotations:
    description: "Full parameter pod example in OpenShift"

spec:
  restartPolicy: Never
  serviceAccountName: default

  nodeSelector:
    node-role.kubernetes.io/worker: "true"

  tolerations:
    - key: "dedicated"
      operator: "Equal"
      value: "dev"
      effect: "NoSchedule"

  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: kubernetes.io/hostname
                operator: In
                values:
                  - worker-1.example.com

  containers:
    - name: nginx-container
      image: nginx:latest
      imagePullPolicy: IfNotPresent

      ports:
        - containerPort: 80
          protocol: TCP

      env:
        - name: ENV
          value: "dev"
        - name: VERSION
          value: "1.0"

      resources:
        requests:
          cpu: "100m"
          memory: "128Mi"
        limits:
          cpu: "200m"
          memory: "256Mi"

      volumeMounts:
        - name: config-volume
          mountPath: /etc/config

      livenessProbe:
        httpGet:
          path: /
          port: 80
        initialDelaySeconds: 10
        periodSeconds: 10

      readinessProbe:
        httpGet:
          path: /
          port: 80
        initialDelaySeconds: 5
        periodSeconds: 5

  volumes:
    - name: config-volume
      configMap:
        name: my-configmap
```

---

# ✅ **3. Apply pod in OpenShift**

```sh
oc apply -f my-pod.yaml
```

Verify:

```sh
oc get pods
oc describe pod my-pod
oc logs my-pod
```

---

# ✅ **4. Quick create without YAML**

### **Simple pod**

```sh
oc run mypod --image=nginx --restart=Never
```


