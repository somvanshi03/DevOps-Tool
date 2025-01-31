# Trivy Commands

## 1. Scan a Docker Image

	trivy image <image_name>

	Example:

	trivy image ubuntu:latest

	This command scans a Docker image for vulnerabilities.

## 2. Scan a File or Directory

	trivy fs <path>

	Example:

	trivy fs /path/to/directory

	This command scans the file system for vulnerabilities in the specified directory.

## 3. Scan a Git Repository

	trivy repo <repo_url>

	Example:

	trivy repo https://github.com/openjdk/jdk

	This scans a Git repository for vulnerabilities.

## 4. Display Only Critical Vulnerabilities

	trivy image --severity CRITICAL <image_name>

	Example:

	trivy image --severity CRITICAL ubuntu:latest

	This filters the results to show only critical vulnerabilities.

## 5. Scan for Vulnerabilities in a Specific Layer

	trivy image --vuln-type <vuln_type> <image_name>

	Example:

	trivy image --vuln-type os ubuntu:latest

	This will scan for vulnerabilities in the OS dependencies within the container image.

## 6. Scan for Vulnerabilities and Save Output in JSON Format

	trivy image -f json -o <output_file>.json <image_name>

	Example:

	trivy image -f json -o ubuntu_vulnerabilities.json ubuntu:latest

	This command saves the output in a JSON file.

## 7. Run Trivy in a Container

	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image <image_name>

	Example:

	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image ubuntu:latest

	This runs Trivy inside a Docker container to scan an image without installing it on your local machine.

## 8. Scan a Specific CVE

	trivy cve <cve_id>

	Example:

	trivy cve CVE-2020-12345

	This scans a specific CVE for details and related vulnerabilities.

## 9. Check for Updates

	trivy --update

	This updates the vulnerability database.

	## 10. Scan with Custom DB (Vulnerability Database)

	trivy image --db <db_file> <image_name>

	Example:

	trivy image --db custom-db.tar.gz ubuntu:latest




