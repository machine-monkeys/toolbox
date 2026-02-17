#!/usr/bin/env bash

BIN="$HOME/.local/bin/"

if [[ -d "/srv/www" ]]; then
    mkdir -p /srv/www/man
    mkdir -p /srv/www/css
    mkdir -p /srv/www/man/{A..Z}
    cp style.css /srv/www/css/style.css
    echo "Directories setup under /srv/www"
fi

# python man2html.py
mkdir -p "$BIN"
cp man2html.py "$BIN/man2html"
chmod +x "$BIN/man2html"
echo "Copied man2html to ~/.local/bin/"
