#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Sahil Gautam | Reg: 24BSA10184
# Course: Open Source Software
# Purpose: Audit permissions and disk usage of key system directories

# --- Array of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share")

echo "=============================================="
echo " DISK AND PERMISSION AUDIT REPORT"
echo " Date: $(date '+%Y-%m-%d %H:%M')"
echo "=============================================="
printf "%-20s %-25s %-8s\n" "Directory" "Permissions/Owner" "Size"
echo "----------------------------------------------"

# --- Loop through each directory and report its details ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions and owner using awk on ls output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Get human-readable size, suppress errors for restricted dirs
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-25s %-8s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        printf "%-20s %-25s\n" "$DIR" "[ does not exist ]"
    fi
done

echo ""
echo "--- Git-Specific Directory Check ---"

# --- Check Git's important configuration locations ---
GIT_DIRS=("/usr/bin/git" "/usr/lib/git-core" "/etc/gitconfig" "$HOME/.gitconfig")

for GDIR in "${GIT_DIRS[@]}"; do
    if [ -e "$GDIR" ]; then
        PERMS=$(ls -ld "$GDIR" | awk '{print $1, $3}')
        echo "FOUND    : $GDIR"
        echo "           Permissions: $PERMS"
    else
        echo "NOT FOUND: $GDIR (may not be configured)"
    fi
done

echo "=============================================="
