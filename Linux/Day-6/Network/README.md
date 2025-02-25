# Network 

## Example 1: Setting Up Networking with a Static IP Address

## 1. **Identify Network Interface**

	First, you need to identify the network interface you want to configure. You can use the `ip` command:

	
	ip link show
	

	This will list all network interfaces. Look for an interface like `eth0`, `ens33`, or `wlan0`.

## 2. **Edit Network Configuration

	The method to configure the network will depend on your Linux distribution.

	**For Ubuntu/Debian:**

	Edit the `/etc/network/interfaces` file:

	
	sudo vi /etc/network/interfaces
	

	Add the following configuration (replace `eth0` with your interface name and adjust the IP addresses as needed):

	```plaintext
	auto eth0
	iface eth0 inet static
		address 192.168.1.100
		netmask 255.255.255.0
		gateway 192.168.1.1
		dns-nameservers 8.8.8.8 8.8.4.4
	```

	**For CentOS/RHEL:**

	Edit the configuration file for your interface, typically located in `/etc/sysconfig/network-scripts/`. For example, if your interface is `eth0`, edit the file:

	
	sudo nano /etc/sysconfig/network-scripts/ifcfg-eth0
	

	Add or modify the following lines:

	```plaintext
	DEVICE=eth0
	BOOTPROTO=static
	ONBOOT=yes
	IPADDR=192.168.1.100
	NETMASK=255.255.255.0
	GATEWAY=192.168.1.1
	DNS1=8.8.8.8
	DNS2=8.8.4.4
	```

## 3. **Restart Networking Service**

	After editing the configuration file, restart the networking service to apply the changes.

	**For Ubuntu/Debian:**

	
	sudo systemctl restart networking
	

	**For CentOS/RHEL:**

	
	sudo systemctl restart network
	

## 4. **Verify Configuration**

	You can verify that the configuration has been applied correctly using:

	
	ip addr show eth0


	You should see the static IP address you configured.

 Example 2: Setting Up Networking with DHCP

	If you want to configure your network interface to obtain an IP address automatically via DHCP, the process is similar but simpler.

## 1. **Edit Network Configuration**

	**For Ubuntu/Debian:**

	Edit the `/etc/network/interfaces` file:

	
	sudo nano /etc/network/interfaces
	

	Add the following configuration:

	```plaintext
	auto eth0
	iface eth0 inet dhcp
	```

	**For CentOS/RHEL:**

	Edit the configuration file for your interface:

	
	sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0
	

	Add or modify the following lines:

	```plaintext
	DEVICE=eth0
	BOOTPROTO=dhcp
	ONBOOT=yes
	```

## 2. **Restart Networking Service**

	Restart the networking service as shown in the previous example.

## 3. **Verify Configuration**

	Check the assigned IP address:

	
	ip addr show eth0
	

	### Example 3: Using `nmcli` for Network Management (CentOS/RHEL)

	If you are using a system with NetworkManager, you can use the `nmcli` command to manage network connections.

## 1. **List Available Connections**

	
	nmcli connection show
	

## 2. **Add a New Connection with Static IP**


	nmcli connection add type ethernet ifname eth0 con-name my-connection ip4 192.168.1.100/24 gw4 192.168.1.1
	nmcli connection modify my-connection ipv4.dns "8.8.8.8 8.8.4.4"
	nmcli connection up my-connection
	

## 3. **Add a New Connection with DHCP**

	
	nmcli connection add type ethernet ifname eth0 con-name my-dhcp-connection
	nmcli connection up my-dhcp-connection
	

## Example 4: Using Graphical Tools (GUI)

	If you are using a desktop environment, you can often configure networking through a graphical interface:

	1. **Open Network Settings**: Look for "Network" or "Network Settings" in your system settings.
	2. **Select the Network Interface**: Choose the interface you want to configure (e.g., Wired or