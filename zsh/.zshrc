# use oh-my-posh
eval "$(oh-my-posh init zsh --config ~/github/oh-my-posh/new.omp.json)"

# path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="dst"

# settings
CASE_SENSITIVE="true"
zstyle ':omz:update' mode auto
HIST_STAMPS="mm/dd/yyyy"

# load plugins
plugins=(git flutter docker laravel npm pass colored-man-pages zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

# compilation
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
source $ZSH/oh-my-zsh.sh

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

LS_COLORS="$LS_COLORS:ow=00"

# dhortcuts
alias please='sudo'
alias doc='man'
alias grep='grep --color=auto'

# listing direktori(lsd)
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# editor and tools
alias v='nvim'
alias nsxiv='nsxiv -b'
alias df='dysk'
alias devinfo='neofetch | lolcat'

# paket and system
alias spu='sudo pacman -Syu'
alias clr='clear && printf "\e[3J"'
alias hc='history -c'

# wifi
alias wf='nmcli dev wifi'
alias ip='ip -c a'

# mounting
alias mdd='sudo mount /dev/sda1 /mnt/hdd'
alias umdd='sudo umount /mnt/hdd'

# systemd
alias sss='sudo systemctl status'
alias sstop='sudo systemctl stop'
alias ssr='sudo systemctl restart'
alias sse='sudo systemctl enable'
alias ssd='sudo systemctl disable'

# database
alias mysd='mariadb -u dev -p' 

# yt-dlp
alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --metadata-from-title "%(artist)s - %(title)s" --output "%(title)s.%(ext)s"'
alias ytmp4='yt-dlp -f "bv*+ba/b" --embed-thumbnail --add-metadata --merge-output-format mp4 -o "%(title)s.%(ext)s"'
alias ytpmp3='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --metadata-from-title "%(artist)s - %(title)s" --output "%(playlist_index)s - %(title)s.%(ext)s"'
alias ytpmp4='yt-dlp -f "bv*+ba/b" --embed-thumbnail --add-metadata --merge-output-format mp4 -o "%(playlist_index)s - %(title)s.%(ext)s"'

# Path
export ANDROID_HOME="$PATH/android/Sdk" # android sdk
export PATH="$PATH:$ANDROID_HOME/platform-tools" # android platform-tools
export PATH="$PATH:$ANDROID_HOME/tools" # android tools
export PATH="$PATH:$HOME/.local/bin" # my global shell script
export PATH="$PATH:$HOME/.tools/flutter/bin/" # flutter
export PATH=$PATH:/usr/local/go/bin # golang
export PATH="$PATH:$HOME/.local/bin/scripts" # flutter
export PATH="$HOME/.config/composer/vendor/bin:$PATH" # laravel-installer
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable" # google-chrome-stable

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun completions
[ -s "/home/dev/.bun/_bun" ] && source "/home/dev/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# autostart X at login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
