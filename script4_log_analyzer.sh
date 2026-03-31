#!/bin/bash
# Script 4: Log File Analyzer
# Author: Sahil Gautam | Reg: 24BSA10184
# Course: Open Source Software
# Usage: ./script4_log_analyzer.sh /var/log/syslog [keyword]
# Purpose: Count keyword occurrences in a log file and show matches

LOGFILE=$1            # First argument: path to log file
KEYWORD=${2:-"error"} # Second argument: keyword (defaults to 'error')
COUNT=0               # Counter variable initialised to zero

# --- Validate that a log file was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: File '$LOGFILE' is empty. Nothing to analyse."
    exit 0
fi

echo "=============================================="
echo " LOG FILE ANALYZER"
echo " File   : $LOGFILE"
echo " Keyword: $KEYWORD"
echo "=============================================="

# --- Read the file line by line and count keyword matches ---
while IFS= read -r LINE; do
    # Case-insensitive match using grep -i
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))  # Increment counter
    fi
done < "$LOGFILE"

echo "Result  : '$KEYWORD' found $COUNT time(s)"
echo ""

# --- Show the last 5 matching lines for context ---
if [ $COUNT -gt 0 ]; then
    echo "Last 5 matching lines:"
    echo "----------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
else
    echo "No matches found for '$KEYWORD' in this log file."
fi

echo "=============================================="
