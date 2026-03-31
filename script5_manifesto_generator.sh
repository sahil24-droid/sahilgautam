#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Sahil Gautam | Reg: 24BSA10184
# Course: Open Source Software
# Purpose: Generate a personalised open-source philosophy statement

# --- Alias concept demonstration (aliases improve workflow transparency) ---
# alias gs='git status'                      # Short alias for git status
# alias gl='git log --oneline --graph'       # Visual git log
# alias gp='git push'                        # Quick push alias
# These aliases embody open-source philosophy: sharing shortcuts with your team

echo "=============================================="
echo " OPEN SOURCE MANIFESTO GENERATOR"
echo "=============================================="
echo "Answer three questions to generate your manifesto."
echo ""

# --- Collect user input with read ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Collect metadata ---
DATE=$(date '+%d %B %Y')
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"

# --- Generate the manifesto by concatenating strings ---
MANIFESTO="Open Source Manifesto
Generated on $DATE by $AUTHOR (Sahil Gautam | 24BSA10184)
============================================

Every day, I rely on $TOOL — a tool that someone built, shared, and
trusted the world to use and improve. That act of sharing is what
'$FREEDOM' means to me: not just the absence of cost, but the presence
of trust between creator and community.

I believe that knowledge grows when it is shared. I believe that the
tools we build should outlast our involvement with them. That is why
I would build $BUILD and release it freely — so that someone I will
never meet can use it, improve it, and pass it forward.

Open source is not charity. It is a deliberate choice to make the
world's technical foundation stronger, more transparent, and more
accountable to everyone who depends on it.

This is my commitment to that foundation.

-- Sahil Gautam| $DATE"

# --- Write manifesto to output file using > (overwrite) ---
echo "$MANIFESTO" > "$OUTPUT"

echo ""
echo "=============================================="
echo "Manifesto saved to: $OUTPUT"
echo "=============================================="
echo ""

# --- Display the generated manifesto using cat ---
cat "$OUTPUT"
