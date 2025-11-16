# ✅ **1. Create DaemonSet using `oc` command (generate YAML)**

```sh
oc create daemonset my-daemonset \
  --image=nginx:latest \
  --dry-run=client -o yaml > my-daemonset.yaml
```

Then edit the YAML and apply:

```sh
oc apply -f my-daemonset.yaml
```

---

# ✅ **2. FULL DaemonSet YAML with ALL Parameters (Production Ready)**

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: my-daemonset
  namespace: devca
  labels:
    app: my-daemon-app
  annotations:
    description: "Full parameter DaemonSet example in OpenShift"

spec:
  selector:
    matchLabels:
      app: my-daemon-app

  updateStrategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1

  template:
    metadata:
      labels:
        app: my-daemon-app
        env: dev

    spec:
      serviceAccountName: default

      nodeSelector:
        node-role.kubernetes.io/worker: "true"

      tolerations:
        - key: "node-role.kubernetes.io/master"
          operator: "Exists"
          effect: "NoSchedule"
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
                    operator: Exists

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
            - name: logs
              mountPath: /var/log/mylogs
            - name: host-time
              mountPath: /etc/localtime
              readOnly: true

          livenessProbe:
            httpGet:
              path: /
              port: 80
            initialDelaySeconds: 20
            periodSeconds: 10

          readinessProbe:
            httpGet:
              path: /
              port: 80
            initialDelaySeconds: 5
            periodSeconds: 5

      volumes:
        - name: logs
          hostPath:
            path: /var/log
            type: Directory

        - name: host-time
          hostPath:
            path: /etc/localtime
            type: File
```

---

# ✅ **3. Apply DaemonSet**

```sh
oc apply -f my-daemonset.yaml
```

---

# ✅ **4. Verify DaemonSet**

### List DaemonSets

```sh
oc get daemonsets
```

### Show details

```sh
oc describe daemonset my-daemonset
```

### Check pods created on all nodes

```sh
oc get pods -o wide | grep my-daemonset
```

---

# ✅ **5. Update DaemonSet (Rolling Update)**

```sh
oc rollout restart daemonset/my-daemonset
oc rollout status daemonset/my-daemonset
```

---

# 🔥 Want a custom DaemonSet created for your image, config, volumes, or node roles?

Share:

* DaemonSet Name
* Namespace
* Image
* NodeSelector (worker/master/gpu?)
* HostPath or ConfigMap/Secret volumes
* CPU/Memory
* Probes (yes/no)

I will generate a **perfect DaemonSet YAML** for your use case.
