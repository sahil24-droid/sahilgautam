#!/bin/bash
# Script 1: System Identity Report
# Author: Sahil Gautam | Reg: 24BSA10184
# Course: Open Source Software
# Purpose: Display key system information as a welcome/audit screen

# --- Student and project variables ---
STUDENT_NAME="Sahil Gautam"
REG_NUMBER="24BSA10184"
SOFTWARE_CHOICE="Git"
SOFTWARE_LICENSE="GNU General Public License v2 (GPL v2)"

# --- Collect system information using command substitution ---
KERNEL=$(uname -r)                      # Kernel version
USER_NAME=$(whoami)                     # Current logged-in user
HOME_DIR=$HOME                          # Home directory from environment
UPTIME=$(uptime -p)                     # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')   # Formatted date
CURRENT_TIME=$(date '+%H:%M:%S')       # Current time
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d'=' -f2 | tr -d '"')

# --- Display the identity report ---
echo "=============================================="
echo "   OPEN SOURCE AUDIT — SYSTEM IDENTITY"
echo "=============================================="
echo "Student  : $STUDENT_NAME ($REG_NUMBER)"
echo "Software : $SOFTWARE_CHOICE"
echo "----------------------------------------------"
echo "Distro   : $DISTRO"
echo "Kernel   : $KERNEL"
echo "User     : $USER_NAME"
echo "Home Dir : $HOME_DIR"
echo "Uptime   : $UPTIME"
echo "Date     : $CURRENT_DATE"
echo "Time     : $CURRENT_TIME"
echo "----------------------------------------------"
echo "OS License: Linux kernel is covered under"
echo "            $SOFTWARE_LICENSE"
echo "=============================================="
echo "Git version: $(git --version 2>/dev/null || echo 'Git not installed')"
echo "=============================================="
