# ----++ XSM ++----
#  xsaya's .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# paths
export PATH=$PATH:$HOME/.local/bin/:$HOME/.local/share/go/bin/:$HOME/core/own/lv/
export GOPATH=~/.local/share/go
# library paths to link with:
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:

# opts & history
HISTFILE=~/.bash-history
HISTSIZE=10000
SAVEHIST=1000
# share history across all open zsh instances
shopt -s histappend
export HISTCONTROL=$HISTCONTROL:ignoredups
export PROMPT_COMMAND="history -a; history -n"
# set Vi mode
set -o vi
# Remove mode switching delay.
KEYTIMEOUT=5

# default programs & options
export BROWSER=qutebrowser
export VISUAL=vim
export EDITOR=$VISUAL
export CM_SELECTIONS="clipboard"
export CM_LAUNCHER="rofi"
export CM_OUTPUT_CLIP=0
export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=148:ln=32:bn=32:se=36'
#export FZF_DEFAULT_OPTS='--bind=ctrl-k:down,ctrl-l:up --walker-skip=.git,node_modules --color pointer:40,marker:40'
export FZF_DEFAULT_OPTS='--bind=ctrl-k:down,ctrl-l:up --color pointer:40,marker:40'

# xsm specific exports 
export XSM_CORE="$HOME/core"
export XSM_DOTS="$HOME/dotfiles"

# xsm specific setup
if [[ -d "$XSM_CORE" ]]; then
    source $XSM_CORE/x/xai/ai-init
    source $XSM_CORE/x/drawer/.xsm-env
    alias notepad='${EDITOR} $XSM_CORE/x/notes/notepad.md'
    # core xpaths
    alias xcor="z $XSM_CORE"
    alias xown="z $XSM_CORE/own/"
    alias ximg="z $XSM_CORE/images/"
    alias xwal="z $XSM_CORE/images/wallpapers/"
    alias xnot="z $XSM_CORE/x/notes/"
    alias xinq="z $XSM_CORE/inquiry/"
fi
if [[ -d "$XSM_DOTS/.stow-local-ignore/scripts" ]]; then
    source ~/.xsaya-lists
    source ~/.xsm-functions
    # explicitly source modules for .bashrc
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-modules/aa-module
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-modules/sy-module
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-modules/oo-module
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-modules/ii-module
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-modules/bb-module
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-modules/ww-module
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-modules/hh-module
    # source load anim script
    source $XSM_DOTS/.stow-local-ignore/scripts/bash-flashy-load/flashy-loading

    # show special XSM welcome text art if welcomeMessage is set
    [[ $welcomeMessage ]] && clear && cat $HOME/dotfiles/.stow-local-ignore/text-art/xsm-grass && unset welcomeMessage

    # xsm specific scripts
    # scripts deprecated in favor of simple functions
    #alias xin="bash $HOME/dotfiles/.stow-local-ignore/scripts/xsm-init"
    #alias xsc="clear; cat ~/dotfiles/.stow-local-ignore/text-art/xsaya-scratch"
    #alias xwm="$XSM_DOTS/.stow-local-ignore/scripts/xsm-welcome"
    alias xsm="bash $XSM_DOTS/eww/.config/eww/xsaya-start-menu/launch-start-menu"
    alias xsv="xmodmap $XSM_DOTS/.stow-local-ignore/scripts/layout-sv"
    alias n="$XSM_DOTS/.stow-local-ignore/scripts/open-feeds"
    alias sn="$XSM_DOTS/.stow-local-ignore/scripts/open-s-feeds"

    # dotfile xpaths 
    alias xdot="z ~/dotfiles/"
    alias xstow="z ~/dotfiles/.stow-local-ignore/"
    alias xscr="z ~/dotfiles/.stow-local-ignore/scripts/"
    alias xsb="z ~/aur/sb"
fi

if [[ -d "/usr/share/fzf" ]]; then
    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
fi

# initialize the completion system 
# look into bash's completion options

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
# this would have to be implemented differently
# in bash
#function zle-keymap-select {
#if [[ ${KEYMAP} == vicmd ]] ||
#    [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#
#elif [[ ${KEYMAP} == main ]] ||
#    [[ ${KEYMAP} == viins ]] ||
#    [[ ${KEYMAP} = '' ]] ||
#    [[ $1 = 'underline' ]]; then
#    echo -ne '\e[3 q'
#fi
#}
#zle -N zle-keymap-select

_fix_cursor() {
   echo -ne '\e[3 q'
}
precmd_functions+=(_fix_cursor)


# xsm aliases
# general purpose / functional changes
alias ...='z ../../'
alias ....='z ../../../'
alias mv="mv -vi"
alias cp="cp -vi"
alias cl="xclip -r -selection clipboard /tmp/capture-line;cat /tmp/capture-line"
alias mail="aerc && echo -e -n \"\x1b[\x33 q\" # changes to blinking underline"

# cursor codes
alias cbl='echo -ne "\e[1 q"'
alias cun='echo -ne "\e[3 q"'
alias cgr='echo -ne "\e]12;#1eba3c\x7"'
alias cwh='echo -ne "\e]12;white\x7"'

# shortened commands
alias lf="lfub"
alias pc="printcolors"
alias pad='${EDITOR} /tmp/xsm-sp.md'
alias pa="pacman"
alias sp="sudo pacman"
alias mkf="touch"
alias ez="exec bash"
alias scon="systemctl"
alias bcon="bluetoothctl"
alias er="2> /dev/null"
alias err="> /dev/null 2>&1 &"
alias tsm="transmission-remote"
alias tsd="transmission-daemon"
alias tsw="$BROWSER 'http://localhost:9091/transmission/web/' &"
alias wtsm="watch -n5 'transmission-remote -l'"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit" 
alias gp="git push"
alias ca="--color=always"
alias G=" | grep -i ca"
alias E=" | less"
alias L=" | wc -l"
alias C=" | xclip -selection clipboard"
alias sd="shutdown"
alias "ｊ　"="j"
alias lw="xw view"
alias def="dict -d gcide"
alias devq="tmux kill-server"
alias xrate="xset r rate 200 30"
alias xsn="tmux-sessionizer"
alias x="exit"

# general xpaths
alias xv="z ~/v/"
alias xmus="z ~/v/audio/music/"
alias xdl="z ~/dl/"
alias xbac="z /mnt/backup/"
alias xmx="z /mnt/mx/"
alias xmy="z /mnt/my/"
alias xmz="z /mnt/mz/"


# rewrite this to function
alias food="cat ~/core/x/lists/food-menu-list"
alias dish="shuf -n 1 $HOME/core/x/lists/food-menu-list"

# TODO: get good screensaver (not resource intensive, not cmatrix) 
alias aw="dunstctl set-paused true && /home/xsaya/dotfiles/.stow-local-ignore/scripts/away-display && dunstctl set-paused false"
alias awx="i3-msg bar mode hide > /dev/null 2>&1 && tmux set-option -g status off && dunstctl set-paused true && /home/xsaya/dotfiles/.stow-local-ignore/scripts/away-display && dunstctl set-paused false && i3-msg bar mode dock > /dev/null 2>&1 && tmux set-option -g status on"
alias snow="xsnow -nouseroot -ssnowdepth 100 -notrees &"

# TODO: There must be a better nf by now
alias nf="clear;neofetch --cpu_temp off --disable theme icons disk locale users public_ip local_ip --disk-subtitle name --underline off --shell_path off --color_blocks off --separator ':' --underline_char '_ _ _' --uptime_shorthand tiny --memory_percent on --bold on --disk_display infobar --memory_display off --bar_char '@' '-' --cpu_display infobar --bar_colors 7 7 --ascii $HOME/dotfiles/.stow-local-ignore/text-art/xsaya-nf-art --ascii_bold off --colors 14 7 7 7 7 7 | column -t -s ':'"


#bindings (bash uses bind, zsh uses bindkey)
bind '"\C-o":"lfcd\n"'
bind '"\C-l":"pwd\n"'
# bind '"\C-p":"lfcd\C-m"'
# disable software flow control(XON/XOFF)
stty -ixon
# enable ctrl+backspace deletion
stty werase ^H 2>/dev/null

# use v in vi mode to edit command in vim
bind -m vi-command '"\cv": vi-edit-command'

#rebind vi mode keys
bind '"\ej": backward-char'
bind '"\e\ö": forward-char'
bind '"\ek": down-history'
bind '"\el": up-history'

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
printf " ----++ XSM ++----  󰣇  %s @%s\n         A    %s  p             /bin/%s\n\n" $kernel $HOSTNAME $packages $0
# deprecated
# ~/dotfiles/.stow-local-ignore/scripts/terminal-startup-msg


# dev functions ---------------------------------
ls() {
    command ls --color=auto -F $@
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

hex() {
    perl -e 'foreach $a(@ARGV){print "\e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
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

printShortDir() {
echo "$(pwd  | awk -F'/' '{OFS="/"; for (i = 0; i <= NF; i++) { if (i > NF-3 && i != NF) { printf "%s/", substr($i, 0, 1) } else if (i == NF) { printf "%s/", $i} }}' | sed -E 's|^|../|;s|..///|/|;s|/+|/|g')"
}
# Get Git branch of current directory
git_branch () {
    if git rev-parse --git-dir >/dev/null 2>&1
        then echo -e "" $(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    else
        echo ""
    fi
}

# dev functions --------------------------------- END


# lf icons
export LF_ICONS="tw=z:st=z:ow=z:dt=z:di=z:fi= :ln=@:or=-:ex=x:*.md=m:*.go=g:*.py=Y:*.db=D:*.json=J:*.c=P:*.css=#:*.html=<:*.toml=c:*.yml=c:*.yaml=c:*.conf=c:*.cfg=c:*.jpg=M:*.jpeg=M:*.mjpg=M:*.mjpeg=M:*.gif=M:*.bmp=M:*.pbm=M:*.pgm=M:*.ppm=M:*.tga=M:*.xbm=M:*.xpm=M:*.tif=M:*.tiff=M:*.png=M:*.svg=M:*.svgz=M:*.mng=M:*.pcx=M:*.mov=M:*.mpg=M:*.mpeg=M:*.m2v=M:*.mkv=M:*.webm=M:*.ogm=M:*.mp4=M:*.m4v=M:*.mp4v=M:*.vob=M:*.qt=M:*.nuv=M:*.wmv=M:*.asf=M:*.rm=M:*.rmvb=M:*.flc=M:*.avi=M:*.fli=M:*.flv=M:*.gl=M:*.dl=M:*.xcf=M:*.xwd=M:*.yuv=M:*.cgm=M:*.emf=M:*.ogv=M:*.ogx=M:*.aac=M:*.au=M:*.flac=M:*.m4a=M:*.mid=M:*.midi=M:*.mka=M:*.mp3=M:*.mpc=M:*.ogg=M:*.ra=M:*.wav=M:*.oga=M:*.opus=M:*.spx=M:*.xspf=M:*.tar=A:*.tgz=A:*.arc=A:*.arj=A:*.taz=A:*.lha=A:*.lz4=A:*.lzh=A:*.lzma=A:*.tlz=A:*.txz=A:*.tzo=A:*.t7z=A:*.zip=A:*.z=A:*.dz=A:*.gz=A:*.lrz=A:*.lz=A:*.lzo=A:*.xz=A:*.zst=A:*.tzst=A:*.bz2=A:*.bz=A:*.tbz=A:*.tbz2=A:*.tz=A:*.deb=A:*.rpm=A:*.jar=A:*.war=A:*.ear=A:*.sar=A:*.rar=A:*.alz=A:*.ace=A:*.zoo=A:*.cpio=A:*.7z=A:*.rz=A:*.cab=A:*.wim=A:*.swm=A:*.dwm=A:*.esd=A:"

LS_COLORS='rs=0:di=01;37:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;33:*#=00;33:*.bak=00;33:*.crdownload=00;31:*.dpkg-dist=00;31:*.dpkg-new=00;31:*.dpkg-old=00;31:*.dpkg-tmp=00;31:*.old=00;31:*.orig=00;31:*.part=00;31:*.rej=00;31:*.rpmnew=00;31:*.rpmorig=00;31:*.rpmsave=00;31:*.swp=00;31:*.tmp=00;31:*.ucf-dist=00;31:*.ucf-new=00;31:*.ucf-old=00;31:';
export LS_COLORS

if command -v zoxide > /dev/null 2>&1; then
    # zoxide with --no-cmd option to disable builtin aliases 
    # #(these things happen in functions instead for elegancy of no expansion
    eval "$(zoxide init --no-cmd bash)"
fi

if command -v starship > /dev/null 2>&1; then
    # Get the status code from the last command executed
    STATUS=$?

    # Get the number of jobs running.
    NUM_JOBS=$(jobs -p | wc -l)

    # Set the prompt to the output of `starship prompt`
    PS1="$(starship prompt --status=$STATUS --jobs=$NUM_JOBS)"
    # starship
    eval "$(starship init $0)"
else
    PS1="\$(git_branch) \$(printShortDir) xsqi >>> "

fi
