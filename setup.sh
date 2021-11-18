# Linux Update
apt update -y && apt upgrade -y;

# Linux Essential Setup
apt install -y locales sudo git htop nano curl;
locale-gen en_US.UTF-8;

# Node.js Setup
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -;
apt install -y nodejs yarn;

# ZSH Setup
apt install zsh -y;
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
yes n | sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)";
git clone https://github.com/denysdovhan/spaceship-prompt.git "/root/.oh-my-zsh/themes/spaceship-prompt" --depth=1;
ln -s "/root/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "/root/.oh-my-zsh/themes/spaceship.zsh-theme";
zsh;
awk '{sub(/robbyrussell/,"spaceship")}1' ~/.zshrc > ~/.temp;
mv ~/.temp ~/.zshrc;
echo -e "\n# Plugins\nzinit light zsh-users/zsh-autosuggestions\nzinit light zsh-users/zsh-completions\nzinit light zdharma/fast-syntax-highlighting\n\n# Theme\nLS_COLORS=\$LS_COLORS:'ow=01;34:' ; export LS_COLORS\n\nSPACESHIP_PROMPT_ORDER=(\n  user          # Username section\n  dir           # Current directory section\n  host          # Hostname section\n  git           # Git section (git_branch + git_status)\n  hg            # Mercurial section (hg_branch  + hg_status)\n  exec_time     # Execution time\n  line_sep      # Line break\n  vi_mode       # Vi-mode indicator\n  jobs          # Background jobs indicator\n  exit_code     # Exit code section\n  char          # Prompt character\n)\n\nSPACESHIP_USER_SHOW='always' # Shows System user name before directory name\n\nSPACESHIP_PROMPT_ADD_NEWLINE=false\n# SPACESHIP_PROMPT_SEPARATE_LINE=false # Make the prompt span across two lines\n# SPACESHIP_DIR_TRUNC=1 # Shows only the last directory folder name\n\nSPACESHIP_CHAR_SYMBOL='➜'\nSPACESHIP_CHAR_SUFFIX=' '\n\n# Hide % on start\nunsetopt PROMPT_SP\n" >>  ~/.zshrc;
echo -e "\nexec zsh" >> ~/.bashrc;

# Personal Configs
echo -e "\n# WSL fix terminal ctrl\nbindkey -e\nbindkey '^H' backward-kill-word # Control + backspace\nbindkey ';5C' forward-word # Control + arrows\nbindkey ';5D' backward-word\n\n# Linux aliases\nalias ws='cd /home/Workspaces'\nalias dot='setopt -s glob_dots'\nalias ll='ls -lah'\nalias ssh='ssh -o ServerAliveInterval=60'\nalias ssh-reset='ssh-keygen -R'\n" >> ~/.zshrc;

# Sugar Git Setup
bash <(curl -Ls raw.githubusercontent.com/mkuchak/sugar-git/main/setup);
git config --global core.editor "code --wait";
git config --global push.followTags true;

# GitHub CLI Setup
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update -y
apt install gh -y
