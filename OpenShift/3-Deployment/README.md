# ✅ **1. Create Deployment using oc command (with parameters)**

### **Generate YAML (best practice)**

```sh
oc create deployment my-deployment \
  --image=nginx:latest \
  --replicas=3 \
  --dry-run=client -o yaml > my-deployment.yaml
```

Then edit the file to add full parameters (resources, probes, volumes, etc.)

Apply the file:

```sh
oc apply -f my-deployment.yaml
```

---

# ✅ **2. FULL Deployment YAML with All Important Parameters**

This example includes:

✔ metadata
✔ labels & annotations
✔ replicas
✔ strategy (RollingUpdate)
✔ container image
✔ ports
✔ env variables
✔ configMap/secret volume
✔ resource limits
✔ liveness & readiness probes
✔ serviceAccount
✔ affinity / nodeSelector / tolerations
✔ lifecycle hooks
✔ imagePullSecrets
✔ autoscaling-ready structure

---

# **📌 FULL Deployment YAML – Production Grade**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
  namespace: devca
  labels:
    app: myapp
    env: dev
  annotations:
    description: "Full parameter Deployment example in OpenShift"

spec:
  replicas: 3
  revisionHistoryLimit: 10

  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1

  selector:
    matchLabels:
      app: myapp

  template:
    metadata:
      labels:
        app: myapp
        env: dev

    spec:
      # Service Account
      serviceAccountName: default

      # Node selection
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

      imagePullSecrets:
        - name: regcred

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
              cpu: "200m"
              memory: "256Mi"
            limits:
              cpu: "500m"
              memory: "512Mi"

          volumeMounts:
            - name: config-volume
              mountPath: /etc/config

          livenessProbe:
            httpGet:
              path: /
              port: 80
            initialDelaySeconds: 15
            periodSeconds: 10

          readinessProbe:
            httpGet:
              path: /
              port: 80
            initialDelaySeconds: 5
            periodSeconds: 5

          lifecycle:
            preStop:
              exec:
                command: ["/bin/sh", "-c", "sleep 5"]

      volumes:
        - name: config-volume
          configMap:
            name: my-configmap
```

---

# ✅ **3. Commands to Apply, Verify, and Manage Deployment**

### Apply Deployment

```sh
oc apply -f my-deployment.yaml
```

### Get deployments

```sh
oc get deploy
```

### Describe deployment

```sh
oc describe deploy my-deployment
```

### Check rollout status

```sh
oc rollout status deployment/my-deployment
```

### Rollback (undo)

```sh
oc rollout undo deployment/my-deployment
```

### Scale deployment

```sh
oc scale deployment my-deployment --replicas=5
```

### View pods created by deployment

```sh
oc get pods -l app=myapp
```


