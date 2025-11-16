# OpenShift

## Prerequisites
Ensure your system meets these requirements.

- OS: Ubuntu 22.04 or newer  
- CPU: 4 cores minimum  
- RAM: 9 GB (16 GB recommended)  
- Disk space: 35–50 GB  
- Virtualization support (Intel VT-x or AMD-V) enabled in BIOS  
- sudo privileges  



## Step 1: Install Dependencies

```bash
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients virt-manager virtiofsd -y
```

- Verify virtualization capabilities:

```bash
sudo apt install cpu-checker -y
kvm-ok
```

If you see “**KVM acceleration can be used**,” proceed.

- Add your user to the `libvirt` group:

```bash
sudo usermod -aG libvirt $USER
newgrp libvirt
```



## Step 2: Download OpenShift Local (CRC)

1. Visit **https://console.redhat.com/openshift/create/local** and:
   - Sign in with a Red Hat account  
   - Download the **OpenShift Local (CRC)** Linux archive  
   - Download the **pull secret**

2. Extract and move the binary:

```bash
tar -xvf crc-linux-amd64.tar.xz
sudo mv crc-linux-* /usr/local/bin/crc
```

Check installation:

```bash
crc version
```

## Step 3: Set up the Cluster

Run the initial configuration setup:

```bash
crc setup
```

Then start the cluster using your pull secret (replace the file path as needed):

```bash
crc start -p ~/Downloads/pull-secret.txt
```

This takes ~10 minutes to complete depending on system speed.



## Step 4: Access OpenShift

After installation, CRC will output cluster details, including:
- API URL  
- Web Console URL  
- Default credentials (`kubeadmin` user).[3]

You can access the OpenShift dashboard via:

```bash
crc console
```

This opens the web UI in your default browser.


## Step 5: Verify with CLI

Install the OpenShift client (`oc`) if not automatically included:

```bash
crc oc-env
eval $(crc oc-env)
oc whoami
oc status
```

You should see output identifying you as `developer` or `kubeadmin`.

***

### Optional: Cleanup or Restart Commands

- Stop the cluster:  
  ```bash
  crc stop
  ```
- Delete the cluster:  
  ```bash
  crc delete
  ```
- Restart:  
  ```bash
  crc start
  ```

