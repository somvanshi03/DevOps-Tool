# 🚀 **1. CREATE CONFIGMAP IN OPENSHIFT WITH ALL PARAMETERS**

## ✅ **A. Create ConfigMap using oc commands**

### **1. From literal values**

```sh
oc create configmap my-config \
  --from-literal=APP_ENV=dev \
  --from-literal=APP_VERSION=1.0 \
  -n devca
```

### **2. From a file**

```sh
oc create configmap my-config \
  --from-file=config.yaml=/tmp/app/config.yaml
```

### **3. From a directory**

```sh
oc create configmap my-config \
  --from-file=/etc/myconfig/
```

### **4. Generate YAML without creating (dry-run)**

```sh
oc create configmap my-config \
  --from-literal=APP_ENV=dev \
  --dry-run=client -o yaml > configmap.yaml
```

### **5. Apply YAML**

```sh
oc apply -f configmap.yaml
```

---

## ✅ **B. Full ConfigMap YAML with ALL parameters**

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
  namespace: devca
  labels:
    app: myapp
  annotations:
    description: "Full parameter ConfigMap example"
data:
  APP_ENV: "dev"
  APP_VERSION: "1.0"
  database.properties: |
    db.url=jdbc:mysql://mysql:3306/mydb
    db.user=root
```

---

## ✅ **C. Use ConfigMap — mount or environment variables**

### **1. As environment variables**

```yaml
envFrom:
  - configMapRef:
      name: my-config
```

### **2. As mounted files**

```yaml
volumeMounts:
  - name: config-vol
    mountPath: /etc/config

volumes:
  - name: config-vol
    configMap:
      name: my-config
```

---

# 🛡️ **2. CREATE SECRETS IN OPENSHIFT WITH ALL PARAMETERS**

Secrets require values to be **base64 encoded** when using YAML.

---

# 🔐 **Secret Types in OpenShift**

| Type                               | Purpose                   |
| ---------------------------------- | ------------------------- |
| **Opaque**                         | Default key/value secrets |
| **kubernetes.io/dockerconfigjson** | Image pull secret         |
| **kubernetes.io/tls**              | TLS private key + cert    |
| **kubernetes.io/basic-auth**       | Username/password         |
| **kubernetes.io/ssh-auth**         | SSH key                   |

---

# 🔐 **A. Create Opaque Secret using oc command**

### **1. From literal values**

```sh
oc create secret generic my-secret \
  --from-literal=username=admin \
  --from-literal=password=Passw0rd! \
  -n devca
```

### **2. From file**

```sh
oc create secret generic my-secret \
  --from-file=username=/tmp/user.txt \
  --from-file=password=/tmp/pass.txt
```

### **3. Generate YAML (dry-run)**

```sh
oc create secret generic my-secret \
  --from-literal=username=admin \
  --dry-run=client -o yaml > secret.yaml
```

---

# 🔐 **B. FULL Secret YAML (Opaque) – All Parameters**

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
  namespace: devca
  labels:
    app: myapp
  annotations:
    description: "Full parameter secret example"
type: Opaque
data:
  username: YWRtaW4=        # base64(admin)
  password: UGFzc3cwcmQh    # base64(Passw0rd!)
```

To encode base64 manually:

```sh
echo -n "admin" | base64
```

---

# 🔐 **C. Create TLS Secret**

```sh
oc create secret tls my-tls-secret \
  --cert=cert.crt \
  --key=cert.key
```

### YAML

```yaml
type: kubernetes.io/tls
```

---

# 🔐 **D. Create Docker Registry Secret (ImagePullSecret)**

```sh
oc create secret docker-registry regcred \
  --docker-server=registry.example.com \
  --docker-username=myuser \
  --docker-password=mypass \
  --docker-email=mail@example.com
```

Attach to ServiceAccount:

```sh
oc secrets link default regcred --for=pull
```

---

# 🔐 **E. Create Basic Auth Secret**

```sh
oc create secret generic my-basic-auth \
  --type=kubernetes.io/basic-auth \
  --from-literal=username=admin \
  --from-literal=password=Password123
```

---

# 🔐 **F. Use Secret in Deployment**

### **1. As environment variables**

```yaml
envFrom:
  - secretRef:
      name: my-secret
```

or

```yaml
env:
  - name: DB_USERNAME
    valueFrom:
      secretKeyRef:
        name: my-secret
        key: username
  - name: DB_PASSWORD
    valueFrom:
      secretKeyRef:
        name: my-secret
        key: password
```

### **2. As mounted files**

```yaml
volumeMounts:
  - name: secret-vol
    mountPath: /etc/secret

volumes:
  - name: secret-vol
    secret:
      secretName: my-secret
```

---

# 🧪 **3. Verify Secrets and ConfigMaps**

### **List**

```sh
oc get secrets
oc get configmaps
```

### **Describe**

```sh
oc describe secret my-secret
oc describe configmap my-config
```

### **Decode Secret**

```sh
oc get secret my-secret -o jsonpath='{.data.username}' | base64 -d
```

