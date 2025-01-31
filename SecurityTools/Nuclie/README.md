# Nuclie

## 1. **Basic Website Scan**

	The basic command for scanning a URL is:


	nuclei -u <URL>


	Example:

	nuclei -u https://example.com

	This will scan the target URL using all available templates and default settings.

## 2. **Using a Specific Template**

	Nuclie supports templates for different types of vulnerabilities (like XSS, SQL injection, etc.). You can use a specific template by specifying the `-t` flag.


	nuclei -u <URL> -t <template_path>


	Example:

	nuclei -u https://example.com -t cves/2021/CVE-2021-12345.yaml

	This command runs the scan using the `CVE-2021-12345` template.

	You can also scan with a specific template directory:

	nuclei -u https://example.com -t /path/to/custom/templates/


## 3. **Listing Available Templates**

	To see all the available templates, you can list them using:


	nuclei -tl


	This will show all the template files available in the default templates directory or a custom directory if specified.

## 4. **Scan Multiple URLs**

	You can scan multiple URLs at once by specifying a file containing the URLs.


	nuclei -l urls.txt


	Example `urls.txt`:

	https://example.com
	https://testsite.com


## 5. **Scan with Custom Templates**

	If you have custom templates, you can pass them to Nuclie using the `-t` flag.


	nuclei -u https://example.com -t /path/to/your/custom/templates/


## 6. **Scan for Specific Vulnerabilities (Severity Filter)**

	You can specify the severity level of vulnerabilities you want to check for:


	nuclei -u <URL> -severity critical,high


	Example:

	nuclei -u https://example.com -severity high,critical

	This command will filter results to show only **critical** and **high** severity vulnerabilities.

## 7. **Scan with Multiple Templates**

	To scan using multiple templates, you can provide a comma-separated list of templates:


	nuclei -u https://example.com -t xss,sql-injection


	Or, use an entire folder of templates:


	nuclei -u https://example.com -t /path/to/templates/


## 8. **Scan with a Specific Number of Concurrent Requests**

	Nuclie allows you to control the number of concurrent requests during the scan using the `-c` flag:


	nuclei -u <URL> -c 50


	Example:

	nuclei -u https://example.com -c 100

	This will set the concurrency to **100** requests.

## 9. **Setting Timeout for Requests**

	You can set the timeout for HTTP requests using the `-timeout` flag:


	nuclei -u <URL> -timeout 30


	This command sets a timeout of 30 seconds for each HTTP request.

## 10. **Output Results to a File**

	To save the scan results to a file, use the `-o` flag:


	nuclei -u https://example.com -o output.txt


	Example:

	nuclei -u https://example.com -o scan_results.txt

	This will store the results in the file `scan_results.txt`.

## 11. **Running a Scan in Quiet Mode**

	To suppress output to the terminal and only save the results to a file, you can use the `-quiet` flag:


	nuclei -u https://example.com -o output.txt -quiet


## 12. **Using a Proxy for Scanning**

	You can route the traffic through a proxy by using the `-proxy` flag:


	nuclei -u https://example.com -proxy http://127.0.0.1:8080


	This command will route the scan traffic through a local proxy (`http://127.0.0.1:8080`).

## 13. **Scan with a Specific HTTP Method**

	You can specify a custom HTTP method (e.g., `POST`, `PUT`) using the `-method` flag:


	nuclei -u https://example.com -method POST


## 14. **Scan for Specific Header**

	To check for a specific HTTP header, use the `-header` flag:


	nuclei -u https://example.com -header "X-Api-Key: my-api-key"


	This will add the custom header to each request during the scan.

## 15. **Run Nuclie in Debug Mode**

	For troubleshooting and more detailed output, you can run Nuclie in **debug mode**:


	nuclei -u https://example.com -debug


	This will provide more verbose output for debugging purposes.

## 16. **Check for Vulnerabilities in a Specific Path**

	You can scan specific paths on the target URL:


	nuclei -u https://example.com/admin


	This will scan the `/admin` path of the specified URL.

## 17. **Help Command**

	If you need help or want to see all available options, use the help flag:


	nuclei -h


## Conclusion

	Nuclie is a powerful tool for scanning websites and APIs for vulnerabilities, 
	and it provides many command-line options to tailor the scan to your needs. 
	You can customize the scan by specifying templates, concurrency, severity filters, headers, and more. 
	Use the above commands to get started with vulnerability scanning using Nuclie.