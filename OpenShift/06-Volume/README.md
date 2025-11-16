# ✅ **1. PersistentVolume (PV) — All Parameters**

### **PV YAML**

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-example
  labels:
    type: local
  annotations:
    description: "Full parameter PersistentVolume example"
spec:
  capacity:
    storage: 10Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: local-storage

  nodeAffinity:
    required:
      nodeSelectorTerms:
        - matchExpressions:
            - key: kubernetes.io/hostname
              operator: In
              values:
                - worker-1.example.com

  nfs:
    path: /mnt/data
    server: 192.168.1.10
```

### **Create PV**

```sh
oc apply -f pv.yaml
```

---

# ✅ **2. PersistentVolumeClaim (PVC) — All Parameters**

### **PVC YAML**

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-example
  namespace: devca
  annotations:
    description: "Full parameter PVC example"
spec:
  accessModes:
    - ReadWriteOnce
  volumeMode: Filesystem
  storageClassName: local-storage
  resources:
    requests:
      storage: 10Gi
  selector:
    matchLabels:
      type: local
```

### **Create PVC**

```sh
oc apply -f pvc.yaml
```

---

# ✅ **3. Using PVC Inside Pod/Deployment**

```yaml
volumes:
  - name: app-storage
    persistentVolumeClaim:
      claimName: pvc-example
```

```yaml
volumeMounts:
  - name: app-storage
    mountPath: /data
```

---

# ✅ **4. hostPath Volume (Node File/Dir Mount)**

### **YAML**

```yaml
volumes:
  - name: host-volume
    hostPath:
      path: /var/log/app
      type: DirectoryOrCreate
```

---

# ✅ **5. emptyDir Volume**

### **YAML**

```yaml
volumes:
  - name: temp-storage
    emptyDir:
      sizeLimit: 1Gi
```

---

# ✅ **6. ConfigMap Volume**

### **Volume**

```yaml
volumes:
  - name: config-volume
    configMap:
      name: my-configmap
```

### **Mount**

```yaml
volumeMounts:
  - name: config-volume
    mountPath: /etc/app-config
```

---

# ✅ **7. Secret Volume**

```yaml
volumes:
  - name: secret-volume
    secret:
      secretName: my-secret
```

```yaml
volumeMounts:
  - name: secret-volume
    mountPath: /etc/secret
    readOnly: true
```

---

# ✅ **8. NFS Volume**

```yaml
volumes:
  - name: nfs-volume
    nfs:
      server: 192.168.1.10
      path: /mnt/nfs
```

---

# ✅ **9. CSI Volume (for cloud storage)**

Example: AWS EBS CSI

```yaml
volumes:
  - name: ebs-volume
    persistentVolumeClaim:
      claimName: ebs-pvc
```

PVC:

```yaml
storageClassName: gp2-csi
```

---

# ✅ **10. Projected Volume (ConfigMap + Secret Combined)**

```yaml
volumes:
  - name: projected-volume
    projected:
      sources:
        - configMap:
            name: my-config
        - secret:
            name: my-secret
```

---

# ✅ **11. Complete Deployment Example With All Volumes**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: volume-demo
  namespace: devca
spec:
  replicas: 1
  selector:
    matchLabels:
      app: demo
  template:
    metadata:
      labels:
        app: demo
    spec:
      containers:
        - name: demo-container
          image: nginx
          volumeMounts:
            - name: pvc-vol
              mountPath: /data
            - name: host-vol
              mountPath: /var/log/host
            - name: cm-vol
              mountPath: /etc/config
            - name: secret-vol
              mountPath: /etc/secret
            - name: empty-vol
              mountPath: /tmp/cache

      volumes:
        - name: pvc-vol
          persistentVolumeClaim:
            claimName: pvc-example

        - name: host-vol
          hostPath:
            path: /var/log/demo
            type: DirectoryOrCreate

        - name: cm-vol
          configMap:
            name: my-configmap

        - name: secret-vol
          secret:
            secretName: my-secret

        - name: empty-vol
          emptyDir: {}
```

---

# 📌 **Useful oc Commands**

### List PVs

```sh
oc get pv
```

### List PVCs

```sh
oc get pvc -n devca
```

### Describe PVC

```sh
oc describe pvc pvc-example -n devca
```

### See which pod is using PVC

```sh
oc get pods -o wide | grep pvc
```

