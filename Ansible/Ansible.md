# Ansible:


	## 1.Install Ansible on Ubuntu:


		sudo apt update  -y
		sudo apt install software-properties-common -y 
		sudo apt-add-repository ppa:ansible/ansible
		sudo apt install python -y 
		sudo apt install python3 -y 
		sudo apt update -y
		sudo apt install ansible -y

	## Passwordless authentication.

		ssh-keygen
		cat .ssh/id_rsa.pub
		and paste it in to target machine in below file.
		vi .ssh/authorized_keys


	## Add target machine in hostfile.

		vi /etc/ansible/hosts
		[app]
		IP_Address

		ansible all --list-hosts

	## Adhoc Commands:


	### Ping Module.

		ansible-doc ping 
		ansible -m ping app

	### Command Module:


		ansible-doc command
		ansible app -m command -a "uptime"
		ansible app -m command -a "df -hT"
		ansible app -m command -a "who -b"
		ansible app -m command -a "df -hT"
		ansible app -m command -a "ls -l /"

	if you need to provide password. then use -k or --ask-password

		ansible app -m command -a "uptime" -k
		ansible app -m command -a "df -hT" -k
		ansible app -m command -a "who -b" -k
		ansible app -m command -a "df -hT" -k

		ansible app -m command -a "uptime" --ask-pass
		ansible app -m command -a "df -hT" --ask-pass
		ansible app -m command -a "who -b" --ask-pass
		ansible app -m command -a "df -hT" --ask-pass


	### Raw Module:

		ansible-doc raw
		We can use multiple command in single line.

		ansible app -m command -a "date;uptime;ls -l;who -b"
		ansible app -m raw -a "date;uptime;ls -l;who -b"

	###  Copy Module: File

		ansible-doc copy

		ansible app -m copy -a "src=/etc/passwd dest=/tmp/ owner=root group=root mode=777"
		ansible app -m command -a "ls /tmp"

	### Copy Module: Dir:


		ansible app -m copy -a "src=/etc dest=/tmp owner=root group=root mode=777"
		ansible app -m command -a "ls /tmp"

	### Copy Module with Backup:


		ansible app -m copy -a "src=/root/file1 backup=yes dest=/tmp"

	### Copy Module: source & target on target machine


		ansible app -m copy -a "src=/tmp/file1 remote_src=yes dest=/root owner=root group=root mode=777"

	### Copy Module:  Content

		ansible app -m copy -a content= "Welcome to ansible" "dest=/tmp/file1" backup=yes

	### Fetch Module:

		Ansible-doc fetch

		ansible app -m fetch -a "src=/tmp/file1 dest=/tmp"

	### File Module: Directory

		Ansible-doc file

		ansible app -m file -a "path=/tmp/dir101 state=directory owner=root group=root mode=777"
		ansible app -m command -a "ls -l /tmp"

	### File Module: File


		Ansible-doc file
		ansible app -m file -a "path=/tmp/file101 state=touch owner=root group=root mode=777"
		ansible app -m command -a "ls -l /tmp"

	### Shell Module:


		Ansible-doc shell
		ansible app -m shell -a "sh /root/workerdir/file.sh"


	### Package Module:


		Ansible-doc package

		ansible app -m package -a "name=httpd state=present"
		ansible app -m package -a "name=httpd state=installed"
		ansible app -m package -a "name=httpd state=latest"
		ansible app -m package -a "name=samba state=latest use=yum"

	###  Remove Package:


		Ansible-doc package
		ansible app -m package -a "name=httpd state=absent"
		ansible app -m package -a "name=httpd state=removed"


	### Service Module:


		ansible-doc service
		ansible app -m service -a "name=httpd state=started"
		ansible app -m service -a "name=httpd state=restarted"
		ansible app -m service -a "name=httpd state=reloaded"
		ansible app -m service -a "name=httpd state=started enabled=yes"

	### Group Module:


		ansible-doc group
		ansible app -m group -a "name=mridul state=present"


	### User Module:




4.18 AWS Module:
--------------------

ansible-doc aws_s3

- name: Simple PUT operation
  amazon.aws.s3_object:
    bucket: mybucket
    object: /my/desired/key.txt
    src: /usr/local/myfile.txt
    mode: put
- name: Create an empty bucket
  amazon.aws.s3_object:
    bucket: mybucket
    mode: create
    permission: public-read
- name: Delete a bucket and all contents
  amazon.aws.s3_object:
    bucket: mybucket
    mode: delete
- name: Delete an object from a bucket
  amazon.aws.s3_object:
    bucket: mybucket
    object: /my/desired/key.txt
    mode: delobj
- name: Copy an object already stored in another bucket
  amazon.aws.s3_object:
    bucket: mybucket
    object: /my/desired/key.txt
    mode: copy
    copy_src:
        bucket: srcbucket
        object: /source/key.txt


4.19 Azure Module:
----------------------

ansible-doc azure_rm_storageaccount

- name: create an account
      azure_rm_storageaccount:
        resource_group: myResourceGroup
        name: clh0002
        type: Standard_RAGRS
        tags:
          testing: testing
          delete: on-exit

- name: Create an account with kind of FileStorage
      azure_rm_storageaccount:
        resource_group: myResourceGroup
        name: c1h0002
        type: Premium_LRS
        kind: FileStorage
        tags:
          testing: testing





=========================

Ansible PlayBook:
-------------------

import_tasks:

vi play1.yaml
- name: Demo Playbook
  hosts: app
  tasks:
    - import_tasks: task.yaml

vi task.yaml
- name: Copy command
  copy:
    src: /etc/passwd
    dest: /tmp
    owner: root
    group: root
    mode: 777
	
ansible-playbook play1.yaml
-------------------------------

ansible-doc lineinfile
-----------------------






=============================
Ansible-Vault:
---------------

ansible-vault -h
ansible-vault encrypt play1.yaml
ansible-playbook play1.yaml  --ask-vault-pass
ansible-vault rekey play1.yaml
ansible-vault view play1.yaml
ansible-vault decrypt play1.yaml

==============================

Ansible-Varible:
-----------------

vi variable.yaml

- hosts: all
  vars:
    mydir: /tmp/dir101
    myfile: /etc/passwd
  tasks:
   - file:
      path: "{{ mydir }}"
      state: directory

ansible-playbook variable.yaml

- hosts: all
  vars:
    mydir: /tmp/dir101
    myfile: /etc/passwd
  tasks:
   - file:
      path: "{{ mydir }}"
      state: directory
   - copy:
      src: "{{ myfile }}"
      dest: "{{ mydir }}"
	 
ansible-playbook variable.yaml


- hosts: all
  vars:
    mydir: /tmp/dir101
    myfile: /etc/passwd
	mypkg: 
	   - httpd
	   - nfs-utils
	   - tree 
	   - samba
	   - ntpd
  tasks:
   - file:
      path: "{{ mydir }}"
      state: directory
   - copy:
      src: "{{ myfile }}"
      dest: "{{ mydir }}"
	- package:
	   name: "{{ mypkg }}"
	   state: latest

ansible-playbook variable.yaml

--------------------------------------

vi variable.yaml
- hosts: all
  vars_files:
    - /myvariables/var.yaml
  tasks:
   - file:
      path: "{{ mydir }}"
      state: directory
   - copy:
      src: "{{ myfile }}"
      dest: "{{ mydir }}"
	- package:
	   name: "{{ mypkg }}"
	   state: latest

vi var.yaml

mydir: /tmp/dir101
    myfile: /etc/passwd
	mypkg: 
	   - httpd
	   - nfs-utils
	   - tree 
	   - samba
	   - ntpd    

ansible-playbook variable.yaml
---------------------------------







==============================
Ansible	Facts:
---------------

ansible-doc setup
ansible app -m setup
ansible app -m setup -a 'filter=ansible_distribution'
ansible app -m setup -a 'filter=ansible_distribution_release'
ansible app -m setup -a 'filter=ansible_architecture'
ansible app -m setup -a 'filter=ansible_all_ipv4_addresses'
ansible app -m setup -a 'filter=ansible_os_family'
ansible app -m setup -a 'filter=macaddress'
ansible app -m setup -a 'filter=ansible_system'
ansible app -m setup -a 'filter=ansible_python_version'
ansible app -m setup -a 'filter=ansible_machine'
ansible app -m setup -a 'filter=ansible_memory_mb'
ansible app -m setup -a 'filter=ansible_kernel'
ansible app -m setup -a 'filter="hw_timestamp_filters'
ansible app -m setup -a 'filter=ansible_eth0'
ansible app -m setup -a 'filter=ansible_domain'
ansible app -m setup -a 'filter=ansible_dns'
ansible app -m setup -a 'filter=ansible_apparmor'
ansible app -m setup -a 'filter=ansible_bios_version'
ansible app -m setup -a 'filter=ansible_cmdline'


=========================================

