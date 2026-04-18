# 🔐 DevSecOps Pipeline — `lailaelamiri/mydevsecopsapp`

A full DevSecOps CI/CD pipeline built with GitHub Actions, covering 8 security projects from code scanning to runtime monitoring.

---

## 🗺️ Projects Overview

| # | Project | Tool(s) | What it does |
|---|---|---|---|
| 1 | Secure CI/CD | flake8 + Bandit | Code linting + static security analysis |
| 2 | Secrets Detection | Gitleaks | Scans git history for leaked secrets |
| 3 | Container Scanning | Docker + Trivy | Builds image and scans for CVEs |
| 4 | IaC Scanning | Terraform + tfsec | Scans infrastructure code for misconfigs |
| 5 | DAST | ZAP | Runs app and attacks it like a hacker |
| 6 | Secrets Management | GitHub Secrets | Injects secrets securely at runtime |
| 7 | Kubernetes Hardening | Trivy + Kubesec | Scans K8s manifests for security issues |
| 8 | Runtime Monitoring | Falco | Detects suspicious behavior in containers |

---

## 📁 Repo Structure

```
mydevsecopsapp/
├── app.py                  # Simple Python web server (port 8080)
├── secrets_demo.py         # Demonstrates secure secret loading
├── requirements.txt        # Python dependencies
├── Dockerfile              # Hardened Docker image
├── infra/
│   └── main.tf             # Terraform config (S3 + security group)
├── k8s/
│   └── deployment.yaml     # Hardened Kubernetes deployment
├── falco/
│   └── rules.yaml          # Falco runtime detection rules
└── .github/
    └── workflows/
        └── security.yml    # Main CI/CD pipeline
```

---

## ⚙️ Pipeline (`security.yml`)

### Tools & Steps

| Step | Tool | Purpose |
|---|---|---|
| Lint | flake8 | Enforce code style |
| SAST | Bandit | Find Python security issues |
| Secrets | Gitleaks | Detect hardcoded secrets |
| Build | Docker | Build container image |
| CVE Scan | Trivy | Scan image for vulnerabilities |
| Config Scan | Trivy | Scan Dockerfile + IaC + K8s configs |
| DAST | ZAP | Live vulnerability scanning |
| Secrets Demo | GitHub Secrets | Secure env var injection |
| K8s Scan | Trivy + Kubesec | Kubernetes hardening check |
| Runtime Rules | Falco | Validate threat detection rules |

---

## 🛡️ Security Fixes Applied

### Terraform (`infra/main.tf`)
- ✅ S3 public access blocked (4 settings)
- ✅ S3 encryption with KMS + key rotation enabled
- ✅ S3 versioning + logging enabled
- ✅ Security group restricted to HTTPS on private network only

### Kubernetes (`k8s/deployment.yaml`)
- ✅ Non-root user (UID 10001)
- ✅ Read-only root filesystem
- ✅ All capabilities dropped
- ✅ Seccomp profile set to RuntimeDefault
- ✅ CPU/memory limits and requests defined
- ✅ Custom namespace (not default)

### Dockerfile
- ✅ Non-root user
- ✅ Minimal base image (`python:3.11-slim-bookworm`)
- ✅ pip + setuptools removed after install

---

## 🚀 How to Run

Push to `master` branch — the pipeline triggers automatically.

```bash
git add .
git commit -m "your message"
git push origin master
```

Then check the **Actions** tab on GitHub.

---

## 📊 Results

| Tool | Result |
|---|---|
| flake8 | ✅ 0 errors |
| Bandit | ✅ 0 high issues |
| Gitleaks | ✅ No leaks found |
| Trivy CVE | ✅ No critical/high (unfixed) |
| Trivy Config | ✅ 0 misconfigurations |
| tfsec | ✅ 0 problems |
| ZAP | ✅ 0 failures, 5 warnings |
| Kubesec | ✅ Score 11/11 |
| Falco | ✅ Rules validated |
