# OSS Audit — Git
### Open Source Software Course | Capstone Project

| Field | Details |
|-------|---------|
| **Student Name** | Sahil Gautam |
| **Registration Number** | 24BSA10184 |
| **Software Audited** | Git (Version Control System) |
| **License** | GNU General Public License v2 (GPL v2) |
| **Course** | Open Source Software (NGMC) |

---

## About This Project

This repository contains the shell scripts for the Open Source Audit capstone project. The audit examines **Git** — its origin story, GPL v2 license, Linux footprint, FOSS ecosystem, and a critical comparison against proprietary alternatives (Perforce Helix Core).

---

## Scripts Overview

| Script | File | What It Does |
|--------|------|-------------|
| 1 | `script1_system_identity.sh` | Displays Linux system info — kernel, user, uptime, distro, date |
| 2 | `script2_package_inspector.sh` | Checks if a FOSS package is installed, shows version + philosophy note |
| 3 | `script3_disk_auditor.sh` | Audits permissions and disk usage of key system directories |
| 4 | `script4_log_analyzer.sh` | Reads a log file, counts keyword matches, shows last 5 matches |
| 5 | `script5_manifesto_generator.sh` | Interactively generates a personalised open-source manifesto |

---

## How to Run Each Script on Linux

### Step 1 — Make scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Script 1 — System Identity Report
```bash
./script1_system_identity.sh
```

### Script 2 — FOSS Package Inspector
```bash
# Check if git is installed (default)
./script2_package_inspector.sh

# Check a specific package
./script2_package_inspector.sh git
./script2_package_inspector.sh python3
```

### Script 3 — Disk and Permission Auditor
```bash
./script3_disk_auditor.sh
```

### Script 4 — Log File Analyzer
```bash
# Basic usage
./script4_log_analyzer.sh /var/log/syslog

# With custom keyword
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/syslog warning
```

### Script 5 — Manifesto Generator
```bash
./script5_manifesto_generator.sh
# Then answer the 3 interactive questions
```

---

## Dependencies

All scripts use standard Linux tools — no extra installation needed:
- `bash` (version 4+)
- `git` — install with `sudo apt install git` or `sudo dnf install git`
- `coreutils` (uname, whoami, date, du, ls) — pre-installed on all Linux systems
- `grep`, `awk`, `cut` — pre-installed on all Linux systems

---

## Running on Linux (No Linux on Your PC?)

Use **JSLinux** (free, runs in browser): [https://bellard.org/jslinux](https://bellard.org/jslinux)  
Or use **GitHub Codespaces** (free): Open this repo on GitHub → click green Code button → Codespaces → New codespace

---

*All scripts are commented and written in Bash. Tested on Ubuntu 22.04 and Fedora 38.*
