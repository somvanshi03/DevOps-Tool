# Integrate ArgoCD with Bitbucket Pipeline 
```t
**Step 1: Create SSH Keys or App Passwords**

- **SSH Keys**: 
  - Generate a public/private key pair using `ssh-keygen`.
  - Add the public key to your Bitbucket repository under *Repository Settings -> Access Keys*.
  - Place the private key in ArgoCD by navigating to *Settings -> Repositories* and clicking on *Connect Repo using SSH*.

- **App Passwords**:
  - Log in to Bitbucket and go to *Personal Settings -> App Passwords*.
  - Create a new app password with the necessary permissions (read/write).
  - Use this app password when connecting ArgoCD to your Bitbucket repository.

  
**Step 2: Configure Bitbucket Pipeline**

- Create a `bitbucket-pipelines.yml` file in your Bitbucket repository.
- Define the pipeline steps to build your application, push the Docker image to a container registry (like GCR), and update the Kubernetes manifests in your ArgoCD repository.
```
```yaml
options:
  docker: true
pipelines:
  branches:
    master:
      - step:
          name: "Build and Deploy"
          image: google/cloud-sdk:alpine
          script:
            - timestamp=$(date +%Y%m%d%H%M%S)
            - gcloud auth activate-service-account $SERVICE_ACC_EMAIL --key-file serviceacc.json
            - gcloud config set project $PROJECT_ID
            - gcloud auth configure-docker
            - docker build -t gcr.io/$PROJECT_ID/$REPOSITORY:$timestamp .
            - docker push gcr.io/$PROJECT_ID/$REPOSITORY:$timestamp
            - git clone git@bitbucket.org:yourusername/argocd-manifest-repo.git
            - cd argocd-manifest-repo
            - sed -i "s+image:.*+image: gcr.io/$PROJECT_ID/$REPOSITORY:$timestamp+" deployment.yaml
            - git add .
            - git commit -m "Update image to $timestamp"
            - git push
```

```t  
**Step 3: Set Up ArgoCD Application**

- In the ArgoCD UI, navigate to *Settings -> Repositories* and add your Bitbucket repository.
- Create a new application in ArgoCD:
  - Specify the repository, path to the Kubernetes manifests, and the target cluster and namespace.
  - Choose the sync policy (manual or auto). For auto-sync, ArgoCD will automatically deploy changes when they are pushed to the repository.

  
**Step 4: Monitor and Sync Changes**

- If using manual sync, you will need to click the sync button in the ArgoCD UI to deploy the latest changes.
- For auto-sync, ensure that your pipeline updates the manifests correctly, and ArgoCD will handle the deployment automatically.

  
**Conclusion**

Integrating ArgoCD with Bitbucket Pipeline streamlines your CI/CD process, allowing for automated deployments based on changes in your code repository. By following these steps, you can ensure that your applications are deployed consistently and efficiently.
```