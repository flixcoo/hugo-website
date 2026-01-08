#!/bin/bash
# build.sh - Update the repository and build the Hugo website
#
# Steps:
# 1) git pull
# 2) remove old public/ directory
# 3) run hugo to generate a new public/
#
# This script only improves console output (colors, timestamps, status messages)
# and does not change the actual commands or their order.

# ------------------------
# Output formatting
# ------------------------
# Use \033 instead of \e for better portability
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
BOLD="\033[1m"
RESET="\033[0m"

# Print helpers: ensure format string and arguments are passed separately
info()  { printf "%b\n" "${BOLD}${BLUE}[INFO] ${RESET} $*"; }
step()  { printf "\n%b\n" "${YELLOW}---- ${BOLD}$*${RESET}${YELLOW} ----${RESET}"; }
success(){ printf "%b\n" "${GREEN}[ OK ] ${RESET}${BOLD}$*${RESET}"; }
failure(){ printf "%b\n" "${RED}[ ERR ] ${RESET}${BOLD}$*${RESET}"; }

# Decorative header
printf "%b\n" "${BOLD}${BLUE}==============================================${RESET}"
printf "%b\n" "${BOLD}${BLUE}=     Hugo Build — Update & Create public/     =${RESET}"
printf "%b" "${BOLD}${BLUE}==============================================${RESET}"


# STEP 1: git pull
step "1) Update repository"
info "Running: git pull"
if git pull; then
    success "Repository updated"
else
    failure "git pull failed — continuing anyway (exit code: $?)"
fi

# STEP 2: rm -rf public/
step "2) Remove old public/ directory"
info "Running: rm -rf public/"
if rm -rf public/; then
    success "Old public/ removed (if present)"
else
    failure "Removing public/ failed or directory did not exist (exit code: $?)"
fi

# STEP 3: hugo
step "3) Generate new public/ files (hugo)"
info "Running: hugo"
if hugo; then
    success "Hugo build succeeded"
else
    failure "Hugo build failed (exit code: $?)"
fi

printf "%b\n" "${GREEN}Done. Thanks!${RESET}"
