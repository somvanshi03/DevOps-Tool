# 🚀 **Deployment YAML with Node Affinity + Pod Affinity + ImagePullSecret + Secrets**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: secure-app
  namespace: devca
  labels:
    app: secure-app

spec:
  replicas: 3
  selector:
    matchLabels:
      app: secure-app

  template:
    metadata:
      labels:
        app: secure-app
        tier: backend

    spec:
      serviceAccountName: default

      # Image pull secret for secure registry
      imagePullSecrets:
        - name: regcred             # Your registry secret

      # ======================
      # Node Affinity
      # ======================
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  # Only schedule on worker nodes
                  - key: node-role.kubernetes.io/worker
                    operator: Exists
                  # Only schedule on specific zone
                  - key: topology.kubernetes.io/zone
                    operator: In
                    values:
                      - zone-a
                      - zone-b

        # ======================
        # Pod Affinity
        # ======================
        podAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            - labelSelector:
                matchExpressions:
                  - key: tier
                    operator: In
                    values:
                      - backend
              topologyKey: "kubernetes.io/hostname"

        # ======================
        # Pod Anti-Affinity
        # ======================
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
            - weight: 100
              podAffinityTerm:
                labelSelector:
                  matchExpressions:
                    - key: app
                      operator: In
                      values:
                        - secure-app
                topologyKey: "topology.kubernetes.io/zone"

      containers:
        - name: secure-container
          image: secure.registry.com/myteam/secure-app:1.0
          imagePullPolicy: Always

          ports:
            - containerPort: 8080

          # Load secret as environment variables
          env:
            - name: DB_USER
              valueFrom:
                secretKeyRef:
                  name: app-secret
                  key: username

            - name: DB_PASS
              valueFrom:
                secretKeyRef:
                  name: app-secret
                  key: password

          # Mount secret into container
          volumeMounts:
            - name: secret-volume
              mountPath: /etc/app/secret
              readOnly: true

      volumes:
        - name: secret-volume
          secret:
            secretName: app-secret
```

---

# 🔐 **Create Image Pull Secret (for secure Docker registry)**

```sh
oc create secret docker-registry regcred \
  --docker-server=secure.registry.com \
  --docker-username=youruser \
  --docker-password=yourpass \
  --docker-email=your@email.com \
  -n devca
```

Link it to ServiceAccount (optional but recommended):

```sh
oc secrets link default regcred --for=pull -n devca
```

---

# 🔐 **Create Application Secret (username/password)**

```sh
oc create secret generic app-secret \
  --from-literal=username=dbuser \
  --from-literal=password=dbpass123 \
  -n devca
```

---

# 🚀 **Apply Deployment**

```sh
oc apply -f secure-deployment.yaml
```

---

# 🔍 **Validate Deployment**

```sh
oc get pods -n devca
oc describe pod <pod-name>
```


