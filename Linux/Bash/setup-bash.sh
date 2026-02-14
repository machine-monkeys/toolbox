#!/usr/bin/env bash

BD="$HOME/.bashrc.d"
[[ -d "$BD" ]] || mkdir -p "$BD"
[[ -f "$BD/bash_prompt" ]] || cp ./files/bash_prompt "$BD/bash_prompt"

if ! grep -qxF "Source Bash Files" "$HOME/.bashrc"; then
cat >> "$HOME/.bashrc" <<'EOF'
# Source Bash Files
for f in "$HOME/.bashrc.d"/*; do
  [[ -f "$f" && -r "$f" ]] && source "$f"
done
EOF
fi

echo
echo -e "Bash environment setup."

