#!/bin/bash
# ------------------------
# Ausgabe-Formatierung
# ------------------------
# Verwende \033 statt \e für bessere Portabilität
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
BOLD="\033[1m"
RESET="\033[0m"

ts() { date '+%Y-%m-%d %H:%M:%S'; }
# Nutze printf "%b" statt echo -e – portable und zuverlässig
info()  { printf "%b\n" "${BOLD}${BLUE}[INFO] $(ts)${RESET} $*"; }
step()  { printf "\n%b\n" "${YELLOW}---- ${BOLD}$*${RESET}${YELLOW} ----${RESET}"; }
success(){ printf "%b\n" "${GREEN}[ OK ] $(ts) ${RESET}${BOLD}$*${RESET}"; }
failure(){ printf "%b\n" "${RED}[ ERR ] $(ts) ${RESET}${BOLD}$*${RESET}"; }

# Track elapsed time with built-in SECONDS
START_TIME=$SECONDS

# Decorative header (printf statt echo -e)
printf "%b\n" "${BOLD}${BLUE}==============================================${RESET}"
printf "%b\n" "${BOLD}${BLUE}=     Hugo Build — Update & Create public/     =${RESET}"
printf "%b\n\n" "${BOLD}${BLUE}==============================================${RESET}"

info "Starte build.sh"

# STEP 1: git pull
step "1) Repository aktualisieren"
info "Ausführen: git pull"
STEP_START=$SECONDS
if git pull; then
    STEP_ELAPSED=$(( SECONDS - STEP_START ))
    success "Repository aktualisiert (Dauer: ${STEP_ELAPSED}s)"
else
    STEP_ELAPSED=$(( SECONDS - STEP_START ))
    failure "git pull schlug fehl — fahre fort (Fehlercode: $?) — Dauer: ${STEP_ELAPSED}s"
fi

# STEP 2: rm -rf public/
step "2) Altes public/ Verzeichnis entfernen"
info "Ausführen: rm -rf public/"
STEP_START=$SECONDS
if rm -rf public/; then
    STEP_ELAPSED=$(( SECONDS - STEP_START ))
    success "Altes public/ entfernt (falls vorhanden) (Dauer: ${STEP_ELAPSED}s)"
else
    STEP_ELAPSED=$(( SECONDS - STEP_START ))
    failure "Löschen von public/ schlug fehl oder Verzeichnis existierte nicht (Fehlercode: $?) — Dauer: ${STEP_ELAPSED}s"
fi

# STEP 3: hugo
step "3) Neue public/ Dateien erzeugen (hugo)"
info "Ausführen: hugo"
STEP_START=$SECONDS
if hugo; then
    STEP_ELAPSED=$(( SECONDS - STEP_START ))
    success "Hugo-Build erfolgreich (Dauer: ${STEP_ELAPSED}s)"
else
    STEP_ELAPSED=$(( SECONDS - STEP_START ))
    failure "Hugo-Build schlug fehl (Fehlercode: $?) — Dauer: ${STEP_ELAPSED}s"
fi

ELAPSED=$(( SECONDS - START_TIME ))

printf "%b\n" "\n${BOLD}Zusammenfassung:${RESET}"
printf "%b\n" "  Gesamtzeit: ${BOLD}${ELAPSED}s${RESET}"

printf "%b\n\n" "${GREEN}Fertig. Danke!${RESET}"
