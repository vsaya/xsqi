#!/bin/zsh
# ----++ XSM ++----
#  xsaya's .zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# paths
export PATH=$PATH:$HOME/.local/bin/:$HOME/.local/share/go/bin/:$HOME/core/own/lv/
export GOPATH=~/.local/share/go
# library paths to link with:
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:

# opts & history
setopt auto_cd
setopt interactivecomments
HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=1000
# share history across all open zsh instances
setopt SHARE_HISTORY
export HISTCONTROL=$HISTCONTROL:ignoredups
# set Vi mode
set -o vi
# Remove mode switching delay.
KEYTIMEOUT=5
# set completion to smart case
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

# default programs & options
export BROWSER=qutebrowser
export VISUAL=vim
export EDITOR=$VISUAL
export CM_SELECTIONS="clipboard"
export CM_LAUNCHER="rofi"
export CM_OUTPUT_CLIP=0
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=148:ln=32:bn=32:se=36'
export FZF_DEFAULT_OPTS='--bind=ctrl-k:down,ctrl-l:up --walker-skip=.git,node_modules --color pointer:40,marker:40'

# xsm specific exports 
export XSM_CORE="$HOME/core"
export XSM_DOTS="$HOME/dotfiles"

# xsm specific setup
if [[ -d "$XSM_CORE" ]]; then
    source $XSM_CORE/x/xai/ai-init
    source $XSM_CORE/x/drawer/.xsm-env
    alias notepad='${EDITOR} $XSM_CORE/x/notes/notepad.md'
    # core xpaths
    alias -g xcor="$XSM_CORE"
    alias -g xown="$XSM_CORE/own/"
    alias -g ximg="$XSM_CORE/images/"
    alias -g xwal="$XSM_CORE/images/wallpapers/"
    alias -g xnot="$XSM_CORE/x/notes/"
    alias -g xinq="$XSM_CORE/inquiry/"
fi
if [[ -d "$XSM_DOTS/.stow-local-ignore/scripts" ]]; then
    source ~/.xsaya-lists
    source ~/.xsm-functions
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-modules/xsm-module-sources
    # source load anim script
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-flashy-load/flashy-loading
    #source plugins
    source $XSM_DOTS/.stow-local-ignore/scripts/zsh-plugins/globalias.plugin.zsh
    source $XSM_DOTS/.stow-local-ignore/scripts/zsh-plugins/syntax-highlighting/zsh-syntax-highlighting.zsh

    # show special XSM welcome text art if welcomeMessage is set
    [[ $welcomeMessage ]] && clear && cat $HOME/dotfiles/.stow-local-ignore/text-art/xsm-grass && unset welcomeMessage

    # xsm specific scripts
    # scripts deprecated in favor of simple functions
    #alias -g xin="bash $HOME/dotfiles/.stow-local-ignore/scripts/xsm-init"
    #alias -g xsc="clear; cat ~/dotfiles/.stow-local-ignore/text-art/xsaya-scratch"
    #alias -g xwm="$XSM_DOTS/.stow-local-ignore/scripts/xsm-welcome"
    alias -g xsm="bash $XSM_DOTS/eww/.config/eww/xsaya-start-menu/launch-start-menu"
    alias -g xsv="xmodmap $XSM_DOTS/.stow-local-ignore/scripts/layout-sv"
    alias n="$XSM_DOTS/.stow-local-ignore/scripts/open-feeds"
    alias sn="$XSM_DOTS/.stow-local-ignore/scripts/open-s-feeds"

    # dotfile xpaths 
    alias -g xdot="~/dotfiles/"
    alias -g xstow="~/dotfiles/.stow-local-ignore/"
    alias -g xscr="~/dotfiles/.stow-local-ignore/scripts/"
    alias -g xsb="~/aur/sb"
fi

if [[ -d "/usr/share/fzf" ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

# initialize the completion system
autoload -Uz compinit && compinit

#source ~/.xpaths
#source ~/.saia-plain-aliases
#source ~/dotfiles/.stow-local-ignore/scripts/dl-scripts/git-prompt.sh # useless when using starship?
#source $HOME/core/own/ka-spark/ka-spark
# source ~/dotfiles/.stow-local-ignore/scripts/bash-modules/prompt-module

# lf exit on current dir
lfcd () {
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# make sure cursor changes to indicate mode
# Change cursor shape for different vi modes.
function zle-keymap-select {
if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'underline' ]]; then
    echo -ne '\e[3 q'
fi
}
zle -N zle-keymap-select

_fix_cursor() {
   echo -ne '\e[3 q'
}
precmd_functions+=(_fix_cursor)


# xsm aliases
# general purpose / functional changes
alias -g ...='../../'
alias -g ....='../../../'
alias -g mv="mv -vi"
alias -g cp="cp -vi"
alias cl="xclip -r -selection clipboard /tmp/capture-line;cat /tmp/capture-line"
alias -g mail="aerc && echo -e -n \"\x1b[\x33 q\" # changes to blinking underline"

# cursor codes
alias -g cbl='echo -ne "\e[1 q"'
alias -g cun='echo -ne "\e[3 q"'
alias -g cgr='echo -ne "\e]12;#1eba3c\x7"'
alias -g cwh='echo -ne "\e]12;white\x7"'

# shortened commands
alias lf="lfub"
alias pc="printcolors"
alias pad='${EDITOR} /tmp/xsm-sp.md'
alias pa="pacman"
alias sp="sudo pacman"
alias -g ez="exec zsh"
alias -g scon="systemctl"
alias -g bcon="bluetoothctl"
alias -g er="2> /dev/null"
alias -g err="> /dev/null 2>&1 &"
alias tsm="transmission-remote"
alias tsd="transmission-daemon"
alias tsw="$BROWSER 'http://localhost:9091/transmission/web/' &"
alias wtsm="watch -n5 'transmission-remote -l'"
alias -g gs="git status"
alias -g gd="git diff"
alias -g ga="git add"
alias -g gc="git commit" 
alias -g gp="git push"
alias -g ca="--color=always"
alias -g G=" | grep -i ca"
alias -g E=" | less"
alias -g L=" | wc -l"
alias -g C=" | xclip -selection clipboard"
alias -g sd="shutdown"
alias -g "ｊ　"="j"
alias lw="xw view"
alias def="dict -d gcide"
alias devq="tmux kill-server"
alias -g xrate="xset r rate 200 30"
alias -g xsn="tmux-sessionizer"
alias x="exit"

# general xpaths
alias -g xv="~/v/"
alias -g xmus="~/v/audio/music/"
alias -g xdl="~/dl/"
alias -g xbac="/mnt/backup/"
alias -g xmx="/mnt/mx/"
alias -g xmy="/mnt/my/"
alias -g xmz="/mnt/mz/"


# rewrite this to function
alias food="cat ~/core/x/lists/food-menu-list"
alias dish="shuf -n 1 $HOME/core/x/lists/food-menu-list"

# TODO: get good screensaver (not resource intensive, not cmatrix) 
alias aw="dunstctl set-paused true && /home/xsaya/dotfiles/.stow-local-ignore/scripts/away-display && dunstctl set-paused false"
alias awx="i3-msg bar mode hide > /dev/null 2>&1 && tmux set-option -g status off && dunstctl set-paused true && /home/xsaya/dotfiles/.stow-local-ignore/scripts/away-display && dunstctl set-paused false && i3-msg bar mode dock > /dev/null 2>&1 && tmux set-option -g status on"
alias snow="xsnow -nouseroot -ssnowdepth 100 -notrees &"

# TODO: There must be a better nf by now
alias nf="clear;neofetch --cpu_temp off --disable theme icons disk locale users public_ip local_ip --disk-subtitle name --underline off --shell_path off --color_blocks off --separator ':' --underline_char '_ _ _' --uptime_shorthand tiny --memory_percent on --bold on --disk_display infobar --memory_display off --bar_char '@' '-' --cpu_display infobar --bar_colors 7 7 --ascii $HOME/dotfiles/.stow-local-ignore/text-art/xsaya-nf-art --ascii_bold off --colors 14 7 7 7 7 7 | column -t -s ':'"


# automatically expand aliases that match the expression
globalias() {
    if [[ $LBUFFER =~ '^.*[x].*$' ]]; then
        zle _expand_alias && xdotool key BackSpace
        # zle expand-word
    else
        zle _expand_alias 
    fi
    zle self-insert
}
zle -N globalias
bindkey " " globalias

#bindings (zsh uses bindkey)
# bindkey -s '^p' 'x^M' # nnn
zle -N _xcmdQc
bindkey '^p' _xcmdQc
zle -N _xcmdSync
bindkey '^y' _xcmdSync
zle -N _xcmdMount
bindkey '^n' _xcmdMount
# bindkey -s '^l' 'pwd^M'
# bindkey -s '^l' '..^M'
zle -N _xu
bindkey '^l' _xu
# zle -N _xup
# bindkey '^y' _xup
# bindkey -s '^k' 'clear; ls -l^M'
# bindkey -s '^k' xd^M
# bindkey -s '^j' 'clear; tree -L 2^M'
# zle -N _insertWidget
# bindkey '^j' _insertWidget
#zle -N _insertBookmark
#bindkey '^j' _insertBookmark
zle -N _getRecentPaths
bindkey '^a' _getRecentPaths
zle -N _xd
bindkey '^k' _xd
stty stop undef
stty start undef
zle -N _xdw
bindkey '^s' _xdw
zle -N _insertHome
bindkey '^j' _insertHome
# bindkey '^p' xd
# lf
bindkey -s '^o' 'lfcd^M'

# use v in vi mode to edit command in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#rebind vi mode keys
bindkey -a j backward-char
bindkey -a '\ö' forward-char
bindkey -a k down-history
bindkey -a l up-history
#disable software flow control(XON/XOFF) 
# stty -ixon
stty werase ^H 2>/dev/null

# xsm shell splash
# if cached:
#cat "$HOME/.local/state/startup-msg/msg"
clear
kernel=$(uname -r)
if command -v pacman > /dev/null 2>&1; then
    packages="$(pacman -Q | wc -l)"
else
    packages="?"
fi
printf " ----++ XSM ++----  󰣇  %s @%s\n         A    %s  p             %s\n"\
 $kernel $HOST $packages $SHELL
# deprecated
# ~/dotfiles/.stow-local-ignore/scripts/terminal-startup-msg


# dev functions ---------------------------------
ls() {
    command ls --color=auto -F $@
}

mkf() {
    touch $@
}

v() {
    ${EDITOR} $@
}

vs() {
    file="$1"
    if [[ -e "$file" ]]; then
        fullPath=$(realpath "$file")
        echo "+1 e: $fullPath"
        tmux send-keys -t 1 ":e $fullPath" C-m
    else
        echo "file doesn't exist."
    fi
}

z() {
    __zoxide_z $@
}

zi() {
    __zoxide_zi $@
}

zat() {
    zathura "$@"
}

printcolors() {
    for o in {0..255}; do print -Pn "%K{$o}  %k%F{$o}${(l:3::0:)o}%f " ${${(M)$((o%6)):#3}:+$'\n'}; done
}

fd() {
    command fd -H "$@"
}

gpat() {
    git config --global credential.helper "cache --timeout=604800"
    if [[ -z "$GH_TOKEN" ]]; then
        if [[ ! -d '/tmp/xi' ]]; then
            pushd /tmp/
            git clone 'https://github.com/vsaya/xi.git'
            popd
        fi
        gpg -d '/tmp/xi/xsm-e5qu31fh28if3g7nzmjhf.gpg' | tr -d "\n" | xclip -selection clipboard
        printf "GH PAT copied to clipboard for 1 minute\n"
        ( sleep 60s ; printf "NULL" | xclip -selection clipboard ) &
    else
        printf "%s" "$GH_TOKEN" | xclip -selection clipboard
        printf "GH PAT already exists as GH_TOKEN\n\nCopied to clipboard for 1 minute\n"
        ( sleep 60s ; printf "NULL" | xclip -selection clipboard ) &
    fi
}

xsc() {
    clear
    cat << 'EOF'
----++  XSC  ++---- 
        ; ; 
         .
EOF
}

xe() {
    if [[ -f "$XSM_CORE/x/notes/xdo.md" ]]; then
        $EDITOR "$XSM_CORE/x/notes/xdo.md"
    else
        echo "xdo.md file does not exist on this system"
        "$EDITOR"
    fi
}

xwm() {
    if command -v cal > /dev/null 2>&1; then
        days=7
        today=$(date +%d)
        printf "\n"
        cal -m | head -n2 
        cal -m | tail -n+2 | tr "\n" "%" | sed -E 's/\s([0-9])(\s|%)/0\1\2/g' | tr "%" "\n" | grep -A 1 "$today" | sed -E "s/\s($today)/\*\1/;s/0/ /g;s/\*\s/ \*/g"
    printf "\n"
    fi
    if command -v calcurse > /dev/null 2>&1; then
        calcurse -d ${days}
    fi

    printf "\n\n\nТерпение и труд всё перетрут.\n"
}

xin() {
    if command -v xdo-renew; then
        xdo-renew
    fi

    tmux new-session -d \; rename-window scratch \; send-keys 'xsc' C-m \;
    tmux new-session \; rename-window mx \; new-window \; rename-window mvim\; send-keys 'xe' C-m \; \
    send-keys -t mx "tmux select-window -t mx" C-m \; \
    send-keys -t mx "xwm" C-m \;
}

# set brightness of the ACPI
br(){
echo $1 > /sys/class/backlight/amdgpu_bl1/brightness
}

# archive extraction
# usage: ex <file>
ex () {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
# dev functions --------------------------------- END


# lf icons
export LF_ICONS="tw=z:st=z:ow=z:dt=z:di=z:fi= :ln=@:or=-:ex=x:*.md=m:*.go=g:*.py=Y:*.db=D:*.json=J:*.c=P:*.css=#:*.html=<:*.toml=c:*.yml=c:*.yaml=c:*.conf=c:*.cfg=c:*.jpg=M:*.jpeg=M:*.mjpg=M:*.mjpeg=M:*.gif=M:*.bmp=M:*.pbm=M:*.pgm=M:*.ppm=M:*.tga=M:*.xbm=M:*.xpm=M:*.tif=M:*.tiff=M:*.png=M:*.svg=M:*.svgz=M:*.mng=M:*.pcx=M:*.mov=M:*.mpg=M:*.mpeg=M:*.m2v=M:*.mkv=M:*.webm=M:*.ogm=M:*.mp4=M:*.m4v=M:*.mp4v=M:*.vob=M:*.qt=M:*.nuv=M:*.wmv=M:*.asf=M:*.rm=M:*.rmvb=M:*.flc=M:*.avi=M:*.fli=M:*.flv=M:*.gl=M:*.dl=M:*.xcf=M:*.xwd=M:*.yuv=M:*.cgm=M:*.emf=M:*.ogv=M:*.ogx=M:*.aac=M:*.au=M:*.flac=M:*.m4a=M:*.mid=M:*.midi=M:*.mka=M:*.mp3=M:*.mpc=M:*.ogg=M:*.ra=M:*.wav=M:*.oga=M:*.opus=M:*.spx=M:*.xspf=M:*.tar=A:*.tgz=A:*.arc=A:*.arj=A:*.taz=A:*.lha=A:*.lz4=A:*.lzh=A:*.lzma=A:*.tlz=A:*.txz=A:*.tzo=A:*.t7z=A:*.zip=A:*.z=A:*.dz=A:*.gz=A:*.lrz=A:*.lz=A:*.lzo=A:*.xz=A:*.zst=A:*.tzst=A:*.bz2=A:*.bz=A:*.tbz=A:*.tbz2=A:*.tz=A:*.deb=A:*.rpm=A:*.jar=A:*.war=A:*.ear=A:*.sar=A:*.rar=A:*.alz=A:*.ace=A:*.zoo=A:*.cpio=A:*.7z=A:*.rz=A:*.cab=A:*.wim=A:*.swm=A:*.dwm=A:*.esd=A:"

if command -v zoxide > /dev/null 2>&1; then
    # zoxide with --no-cmd option to disable builtin aliases 
    # #(these things happen in functions instead for elegancy of no expansion
    eval "$(zoxide init --no-cmd zsh)"
fi

if command -v starship > /dev/null 2>&1; then
    # starship
    eval "$(starship init zsh)"
fi
