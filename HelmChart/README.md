# HelmChart

	Helm is a package manager for Kubernetes that uses a packaging format called **charts**. 
	
	Helm commands are used to install, manage, upgrade, and configure Kubernetes applications. 
	
	Below is a **comprehensive list of Helm CLI commands**, with **detailed explanations** for each.



## 📦 Helm Chart Commands (Detailed)

### ✅ 1. `helm install`

**Usage:** Install a chart into Kubernetes.


helm install <release_name> <chart> [flags]


* `release_name`: A unique name for the release.
* `chart`: The chart directory, URL, or chart name in a repo.
* `--values/-f`: Use a values file to override defaults.
* `--set`: Set values on the command line.

🔹 *Example:*


helm install myapp ./mychart -f custom-values.yaml




### 🔁 2. `helm upgrade`

**Usage:** Upgrade a release with a new chart or values.


helm upgrade <release_name> <chart> [flags]


* `--install`: Install if release doesn't exist.
* `--force`: Force resource updates through delete/recreate.
* `--reuse-values`: Reuse the last release's values.

🔹 *Example:*


helm upgrade myapp ./mychart --set image.tag=v2




### 🔄 3. `helm rollback`

**Usage:** Roll back a release to a previous revision.


helm rollback <release_name> [revision] [flags]


* `revision`: Optional. Defaults to previous release.

🔹 *Example:*


helm rollback myapp 2




### ❌ 4. `helm uninstall`

**Usage:** Uninstall a release.


helm uninstall <release_name> [flags]


* `--keep-history`: Retain release history after uninstall.

🔹 *Example:*


helm uninstall myapp




### 🔍 5. `helm list`

**Usage:** List releases.


helm list [flags]


* `--all`: Show all releases (including deleted).
* `--namespace`: Show releases in a specific namespace.

🔹 *Example:*


helm list --all-namespaces




### 🔎 6. `helm search`

Search for charts.

#### a) `helm search hub`

Search in the Helm Hub (Artifact Hub).


helm search hub <keyword>


#### b) `helm search repo`

Search charts in local repos.


helm search repo <chart_name>


🔹 *Example:*


helm search repo nginx




### 🛠️ 7. `helm repo`

Manage chart repositories.

#### a) `helm repo add`

Add a chart repo.


helm repo add <name> <url>


#### b) `helm repo update`

Update chart repo info.


helm repo update


#### c) `helm repo list`

List added repositories.


helm repo list


#### d) `helm repo remove`

Remove a repo.

helm repo remove <name>




### 🔧 8. `helm create`

Create a new chart scaffold.


helm create <chart_name>




### 📦 9. `helm package`

Package a chart into a `.tgz` archive.


helm package <chart_directory> [flags]




### 📂 10. `helm dependency`

Manage chart dependencies.

#### a) `helm dependency update`

Download charts listed in `Chart.yaml`.


helm dependency update <chart_dir>


#### b) `helm dependency build`

Build the charts from dependencies.

helm dependency build <chart_dir>



### 🧪 11. `helm test`

Run tests defined in the chart.


helm test <release_name>



### 🧾 12. `helm status`

Display the status of a release.


helm status <release_name>



### 📜 13. `helm get`

Get info about a release.

* `helm get values <release>` – View user-supplied values.
* `helm get manifest <release>` – Show rendered manifests.
* `helm get all <release>` – Show all release info.



### 🔄 14. `helm template`

Render chart templates locally (no cluster required).


helm template <name> <chart> [flags]




### 🔎 15. `helm lint`

Check chart for formatting and validity issues.


helm lint <chart_dir>




### 🗂️ 16. `helm show`

Show chart information.

* `helm show values <chart>`
* `helm show chart <chart>`
* `helm show readme <chart>`



### ⚙️ 17. `helm env`

Show Helm environment information.


helm env




### 🆘 18. `helm help`

Display help for any command.


helm help [command]



## 🔒 Helm Security & Authentication Related

* `--kubeconfig`: Use a specific kubeconfig file.
* `--namespace`: Scope to a namespace.
* `--debug`: Print debugging output.



## 🚀 Bonus: Useful Flags

| Flag           | Description                                 |
| -------------- | ------------------------------------------- |
| `--dry-run`    | Simulate an install/upgrade without changes |
| `--set`        | Override values via CLI                     |
| `--set-string` | Force string values                         |
| `--atomic`     | Rollback on failure                         |
| `--timeout`    | Set timeouts for operations                 |




