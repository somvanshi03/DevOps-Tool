# ✅ **1. Generate StatefulSet YAML using oc command**

OpenShift does **not** have a direct `oc create statefulset` command.
So we create a sample YAML using Kubernetes syntax:

```sh
oc create deployment temp --image=nginx --dry-run=client -o yaml > temp.yaml
```

Then convert manually to StatefulSet format (or use the full YAML below).

---

# ✅ **2. FULL StatefulSet YAML with ALL PARAMETERS (Production Ready)**

Includes:

✔ metadata
✔ replicas
✔ updateStrategy
✔ serviceName
✔ pod management policy
✔ containers
✔ probes
✔ PVC template
✔ volumes
✔ env variables
✔ affinity / tolerations
✔ serviceAccount
✔ imagePullSecrets
✔ nodeSelector
✔ resource limits

---

# **📌 StatefulSet YAML (Complete Example)**

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: my-statefulset
  namespace: devca
  labels:
    app: mydb
  annotations:
    description: "Full parameter StatefulSet example in OpenShift"

spec:
  # Required for StatefulSets
  serviceName: "my-statefulset-headless"

  replicas: 3
  podManagementPolicy: Parallel

  updateStrategy:
    type: RollingUpdate

  selector:
    matchLabels:
      app: mydb

  template:
    metadata:
      labels:
        app: mydb
        env: dev

    spec:
      serviceAccountName: default

      nodeSelector:
        node-role.kubernetes.io/worker: "true"

      tolerations:
        - key: "dedicated"
          operator: "Equal"
          value: "db"
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
        - name: db-container
          image: mysql:8.0
          imagePullPolicy: IfNotPresent

          ports:
            - name: mysql
              containerPort: 3306

          env:
            - name: MYSQL_ROOT_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: mysql-secret
                  key: root_password

            - name: ENV
              value: "dev"

          resources:
            requests:
              cpu: "250m"
              memory: "512Mi"
            limits:
              cpu: "500m"
              memory: "1Gi"

          volumeMounts:
            - name: db-data
              mountPath: /var/lib/mysql

            - name: config-volume
              mountPath: /etc/config

          livenessProbe:
            tcpSocket:
              port: 3306
            initialDelaySeconds: 30
            periodSeconds: 10

          readinessProbe:
            exec:
              command: ["mysqladmin", "ping", "-h", "127.0.0.1"]
            initialDelaySeconds: 10
            periodSeconds: 10

      volumes:
        - name: config-volume
          configMap:
            name: mysql-config
            optional: true

  # Persistent Volume for each replica
  volumeClaimTemplates:
    - metadata:
        name: db-data
      spec:
        accessModes: ["ReadWriteOnce"]
        storageClassName: gp2
        resources:
          requests:
            storage: 5Gi
```

---

# ✅ **3. Create a Headless Service (Required for StatefulSet)**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-statefulset-headless
  namespace: devca
spec:
  clusterIP: None
  selector:
    app: mydb
  ports:
    - port: 3306
      name: mysql
```

Apply:

```sh
oc apply -f headless-service.yaml
```

---

# ✅ **4. Apply StatefulSet**

```sh
oc apply -f my-statefulset.yaml
```

---

# ✅ **5. Verify StatefulSet**

### List StatefulSets

```sh
oc get statefulsets
```

### Describe

```sh
oc describe statefulset my-statefulset
```

### List pods with ordinal names

```sh
oc get pods -l app=mydb -o wide
```

You will see:

```
my-statefulset-0
my-statefulset-1
my-statefulset-2
```

---

# ✅ **6. Scale StatefulSet**

```sh
oc scale statefulset/my-statefulset --replicas=5
```

---

# ✅ **7. Restart / Rollout**

```sh
oc rollout restart statefulset/my-statefulset
oc rollout status statefulset/my-statefulset
```

