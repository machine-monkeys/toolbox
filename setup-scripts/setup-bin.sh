#!/usr/bin/env bash

BIN="$HOME/.local/bin/"

# python man2html.py
mkdir -p "$BIN"
cp ../web/man2html.py "$BIN/man2html"
chmod +x "$BIN/man2html"
echo "Copied man2html to ~/.local/bin/"
