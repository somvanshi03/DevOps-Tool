# GCP Monitoring:
```
# GCP Monitoring
1. Cloud Monitoring
2. Managed Service for prometheus
3. Cloud Trace
4. Cloud Profiler
5. Service Monitoring
6. Uptime check
7. Cloud Logging
8. Log Analytics
9. Cloud audit logs
```
## Cloud Monitoring

```
1. Charts and Dashboard
2. Alerts and Notifications
3. SLO Monitoring and Uptimes checks
```
	
```
# Application Monitoring
1. Application Uptime checks
2. Current Connections
3. Accepted Connections
4. Request Rate

# VM Instance Monitoring
1.High CPU Utilization
2. High Memory Utilization
3. High Disk Utilization
4. Host Error log deducted

# Notifications
1. Send Notifications(email) when there is an issue
```

## Uptime Lab

```
1. Setup VM
2. Install Apache sample page
3. Go to Monitoring section
4. Uptime checks
5. Create Uptime checks
6. Try to shutdown VM and check if we get email or not.
```

## Synthetic Monitoring
```
# Synthetic Monitoring

# Comparing GCP Synthetic Templates vs. Broken-Link Checker

When you create a synthetic monitor in Google Cloud Console, you can choose between  
– a **generic** template,  
– a **Mocha** template, or  
– a **broken-link checker** template. Each template targets a different testing style and use case.

---

## 1. Generic Synthetic Template

- **Handler & SDK**  
  Uses `runSyntheticHandler` from `@google-cloud/synthetics-sdk-api`. You write a small Node.js function that makes HTTP calls (via `axios` or Puppeteer/Selenium) and uses Node’s `assert` library to indicate pass/fail.  
- **Use cases**  
  Simple availability checks (ping a URL), performance measurements, or custom end-to-end flows.  
- **Instrumentation**  
  Auto-collects OpenTelemetry traces and Winston logs when you call `instantiateAutoInstrumentation()` before any other code.

---

## 2. Mocha Synthetic Template

- **Handler & Framework**  
  Uses `GcmSynthetics.runMochaHandler(...)` from `@google-cloud/synthetics-sdk-mocha`. You author one or more `.spec.js` files and write tests in Mocha/Chai style.  
- **Test runner behavior**  
  Supports Mocha flags (for example, `--bail` to stop on first failure) and full suite lifecycle (hooks, retries, timeouts).  
- **UI integration**  
  When you pick “Mocha” in the console, Cloud Monitoring injects sample code for a Mocha test suite and spins up the Cloud Function for you.

---

## 3. Broken-Link Checker Template

- **Preconfigured Cloud Run function**  
  Based on the `broken-links-ok` template. No custom code required—just specify options.  
- **Default behavior**  
  1. Scrapes `<a href>` elements on your origin URI (by default the first 10 links).  
  2. Sends one HTTP request per link.  
  3. Verifies each returns status 200.  
  4. Records latency, status, and (optionally) screenshots.  
- **Configurable options**  
  You can tune maximum links tested, per-link timeout (default 30 s), retry count, CSS selectors to wait for, and screenshot settings.

---

## Feature Comparison

| Feature               | Generic Synthetic            | Mocha Synthetic             | Broken-Link Checker          |
|-----------------------|-------------------------------|------------------------------|------------------------------|
| Template name         | generic-synthetic             | mocha-url-ok                 | broken-links-ok              |
| Handler               | `runSyntheticHandler`         | `runMochaHandler`            | Internal checker logic       |
| Test style            | Inline Node.js + `assert`     | Mocha/Chai test suites       | Config-driven HTTP checks    |
| Ideal for             | Custom scripts & flows        | End-to-end or API test suites| Verifying hyperlink health   |
| Code required?        | Yes                           | Yes (test files)             | No (just options)            |
| Key options           | Full control over code        | Mocha flags (`bail`, etc.)   | Origin URI, max links, timeout, retries, selector, screenshots |
| Tracing & logging     | OpenTelemetry + Winston logs  | OpenTelemetry + Winston logs | Built-in logs & screenshots  |

---

Next time you need a quick HTTP check or a complex test suite, pick the **generic** or **Mocha** template. If your goal is purely “find broken links on my page,” the **broken-link checker** gives you that out of the box—no code required.
```


