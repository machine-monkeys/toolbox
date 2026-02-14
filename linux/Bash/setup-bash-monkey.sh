#!/usr/bin/env bash

# Definitely not the best check. FIXME!
if ! grep -iqE 'source.*bash.*monkey' "$HOME/.bashrc"; then

cp ./files/bash_monkey "$HOME/.bash_monkey"

cat >> "$HOME/.bashrc" <<'EOF'
# Source Bash Monkey
if [[ -f "$HOME/.bash_monkey" ]]; then
  source "$HOME/.bash_monkey"
fi
EOF

echo -e "\n ## Bash Monkey Installed ##\n"    
cat<<'EOF'
            __,__
   .--.  .-"     "-.  .--.
  / .. \/  .-. .-.  \/ .. \
 | |  '|  /   Y   \  |'  | |
 | \   \  \ 0 | 0 /  /   / |
  \ '- ,\.-"`` ``"-./, -' /
   `'-' /_   ^ ^   _\ '-'`
       |  \._   _./  |
       \   \ `~` /   /
        '._ '-=-' _.'
           '~---~'
EOF
echo -e "\n ## Bash Monkey Installed ##\n"    

else

echo -e "\n #### Bash Monkey Already Installed! ####\n"              
cat<<'EOF'
                 __,__
        .--.  .-"     "-.  .--.
       / .. \/  .-. .-.  \/ .. \
      | |  '|  /   Y   \  |'  | |
      | \   \  \ 0 | 0 /  /   / |
       \ '- ,\.-"`` ``"-./, -' /
        `'-' /_   ^ ^   _\ '-'`
        .--'|  \._ _ _./  |'--.
      /`    \   \.-.  /   /    `\
     /       '._/  |-' _.'       \
    /          ;  /--~'   |       \
   /        .'\|.-\--.     \       \
  /   .'-. /.-.;\  |\|'~'-.|\       \
  \       `-./`|_\_/ `     `\'.      \
   '.      ;     ___)        '.`;    /
     '-.,_ ;     ___)          \/   /
      \   ``'------'\       \   `  /
       '.    \       '.      |   ;/_
     ___>     '.       \_ _ _/   ,  '--.
   .'   '.   .-~~~~~-. /     |--'`~~-.  \
  // / .---'/  .-~~-._/ / / /---..__.'  /
 ((_(_/    /  /      (_(_(_(---.__    .'
           | |     _              `~~`
           | |     \'.
            \ '....' |
             '.,___.'
EOF
echo -e "\n #### Bash Monkey Already Installed! ####\n"              

fi
