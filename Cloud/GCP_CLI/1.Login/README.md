# Authenticating to Google Cloud

Run the following to authenticate your local CLI session with your user credentials:

```bash
gcloud auth login
```

If you need to use a service account instead, activate it with:

```bash
gcloud auth activate-service-account --key-file=/path/to/key.json
```


---

# Setting the Default Project

First, view all projects you can access:

```bash
gcloud projects list
```  
Then set your working project by its ID:

```bash
gcloud config set project PROJECT_ID
```  



---

# Listing Compute Engine VMs

To list every VM instance in the active project and default region/zone:

```bash
gcloud compute instances list
```


---

# Listing GKE Clusters

To see all Kubernetes Engine clusters across zones and regions in your project:

```bash
gcloud container clusters list
```


---

# Connecting to a GKE Cluster

Retrieve credentials so that `kubectl` can talk to your cluster:

```bash
gcloud container clusters get-credentials CLUSTER_NAME \
    --zone ZONE \
    --project PROJECT_ID
```  
This updates your local kubeconfig with the cluster endpoint and auth tokens.  

Verify the connection:

```bash
kubectl get nodes
```


---




## Direct Command to Scale All Deployments

Use the built-in `kubectl scale` command with the `--all` flag and specify your namespace:

```bash
kubectl scale deployment --all --replicas=1 -n <your-namespace>
```

Replace `<your-namespace>` with the name of the target namespace.



---

## Alternative: Using a Loop

If you want more control or need to filter deployments by label, you can iterate over each deployment:

```bash
for deploy in $(kubectl get deployments -n <your-namespace> -o name); do
  kubectl scale $deploy --replicas=1 -n <your-namespace>
done
```



---

## Patch All Deployments

You can also use `kubectl patch` to set replicas in one go:

```bash
kubectl -n <your-namespace> patch deployment --all \
  --type='json' \
  -p='[{"op":"replace","path":"/spec/replicas","value":1}]'
```



---

## Verification

After scaling, confirm the change:

```bash
kubectl get deployments -n <your-namespace> \
  -o custom-columns=NAME:.metadata.name,REPLICAS:.status.replicas
```



---

