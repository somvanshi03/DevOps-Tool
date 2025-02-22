# CentOS Upgrade

## Steps to Upgrade from CentOS 8 to CentOS 9 Stream

	1. **Backup Your Data**: Before starting the upgrade process, ensure that you have a complete backup of your important data and configurations.

	2. **Update CentOS 8**: Make sure your CentOS 8 system is fully updated.
	   
	   sudo dnf update
	   sudo dnf upgrade
	   

	3. **Install the ELevate Tool**: The ELevate tool is used to facilitate the upgrade process.
	   
	   sudo dnf install -y https://repo.almalinux.org/elevate/8/elevate-release-latest.el8.x86_64.rpm
	   

	4. **Run the ELevate Upgrade**: Use the ELevate tool to perform the upgrade.
	   
	   sudo elevate
	  

	5. **Follow the Prompts**: The ELevate tool will guide you through the upgrade process. Follow the prompts and instructions provided.

	6. **Reboot the System**: After the upgrade process is complete, reboot your system.
	   
	   sudo reboot
	   

	7. **Verify the Upgrade**: After rebooting, verify that you are now running CentOS 9 Stream.
	   
	   cat /etc/os-release
	  

## Post-Upgrade Steps

	- **Check for Deprecated Packages**: After the upgrade, check for any deprecated or removed packages and update your configurations accordingly.
	- **Reinstall Third-Party Software**: If you have third-party software installed, you may need to reinstall or reconfigure it.
	- **Review System Logs**: Check system logs for any errors or warnings that may need your attention.

## Important Notes

	- **CentOS 9 Stream**: Remember that CentOS 9 Stream is a rolling release, which means it will receive continuous updates. Make sure to regularly update your system.
	- **Consider Alternatives**: If you are looking for a stable release, consider alternatives like AlmaLinux or Rocky Linux, which are designed to be drop-in replacements for CentOS.

	Always refer to the official documentation and community resources for the most accurate and detailed instructions tailored to your specific environment.