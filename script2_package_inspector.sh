#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Sahil Gautam | Reg: 24BSA10184
# Course: Open Source Software
# Usage: ./script2_package_inspector.sh [packagename]
# Purpose: Check if a FOSS package is installed and display its info

PACKAGE=${1:-git}  # Default to 'git' if no argument given

echo "=============================================="
echo " FOSS Package Inspector: $PACKAGE"
echo "=============================================="

# --- Detect package manager and check if installed ---
if command -v rpm &>/dev/null; then
    # RPM-based system (Fedora, RHEL, CentOS)
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "STATUS: $PACKAGE is INSTALLED (RPM system)"
        echo ""
        rpm -qi "$PACKAGE" | grep -E "^Name|^Version|^License|^Summary|^URL"
    else
        echo "STATUS: $PACKAGE is NOT installed."
        echo "Install with: sudo dnf install $PACKAGE"
    fi
elif command -v dpkg &>/dev/null; then
    # DEB-based system (Debian, Ubuntu)
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "STATUS: $PACKAGE is INSTALLED (DEB system)"
        echo ""
        dpkg -s "$PACKAGE" | grep -E "^Package|^Version|^Maintainer|^Description"
    else
        echo "STATUS: $PACKAGE is NOT installed."
        echo "Install with: sudo apt install $PACKAGE"
    fi
else
    echo "Could not detect package manager."
fi

echo ""
echo "--- Philosophy Note ---"

# --- Case statement: print a philosophy note for known packages ---
case "$PACKAGE" in
    git)
        echo "Git: Born from the failure of proprietary tools."
        echo "Linus built it in 10 days because BitKeeper left the kernel without a VCS."
        echo "License: GPL v2 — ensuring it can never be taken proprietary."
        ;;
    httpd|apache2)
        echo "Apache: The web server that built the open internet."
        echo "It powered the dot-com era and still runs ~30% of the world's websites."
        ;;
    mysql|mariadb)
        echo "MySQL: Open source at the heart of millions of applications."
        echo "A dual-license model story — acquired by Oracle, forked as MariaDB."
        ;;
    python3|python)
        echo "Python: A language shaped entirely by its community."
        echo "The PSF license allows almost unrestricted use — maximum adoption."
        ;;
    vlc)
        echo "VLC: Built by students in Paris who wanted to stream video."
        echo "LGPL licensed — plays anything, runs everywhere, costs nothing."
        ;;
    firefox)
        echo "Firefox: A nonprofit fighting for an open web."
        echo "MPL 2.0 — Mozilla's answer to browser monopoly."
        ;;
    *)
        echo "$PACKAGE: An open-source tool contributing to the commons."
        echo "Check its license at: https://choosealicense.com"
        ;;
esac

echo "=============================================="
