### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/.config/emacs/bin $HOME/Applications /var/lib/flatpak/exports/bin/ $fish_user_paths

#fish_config theme save "Catppuccin Latte"
#fish_config theme save "Catppuccin Frappe"
#fish_config theme save "Catppuccin Macchiato"
#fish_config theme save "Catppuccin Mocha"

# The next line updates PATH for the Google Cloud SDK.
if test -f '/opt/google-cloud-sdk/path.fish.inc'
    source '/opt/google-cloud-sdk/path.fish.inc'
end

# The next line enables shell command completion for gcloud.
if test -f '/opt/google-cloud-sdk/completion.fish.inc'
    source '/opt/google-cloud-sdk/completion.fish.inc'
end

###### SETTING THE STARSHIP PROMPT #####
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_git no
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv no
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone America/Los_Angeles
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
## END OF STARSHIP PROMPT

### EXPORT ###
set fish_greeting # Supresses fish's intro message
set TERM xterm-256color # Sets the terminal type
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# Golang 
set -Ux GOPATH $HOME/go
set -Ux GOBIN $GOPATH/bin
set -Ux PATH $GOBIN:$PATH

### SET MANPAGER
### Uncomment only one of these!

### "nvim" as manpager
set -x MANPAGER "nvim +Man!"

### "less" as manpager
# set -x MANPAGER "less"

### Set Cursor insert


### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
if status is-interactive
    set fish_cursor_default beam blink
    set fish_cursor_insert line blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual block

    function fish_user_key_bindings
        fish_default_key_bindings -M insert
        fish_vi_key_bindings --no-erase insert
    end
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### FUNCTIONS ###

# Funções para o migrate
function migrate-up
    migrate -path=./migrations -database "postgresql://postgres:postgres@localhost:5432/db_pedidos?sslmode=disable" up
end

function migrate-down
    migrate -path=./migrations -database "postgresql://postgres:postgres@localhost:5432/db_pedidos?sslmode=disable" down
end

function migrate-status
    migrate -path=./migrations -database "postgresql://postgres:postgres@localhost:5432/db_pedidos?sslmode=disable" version
end

function migrate-create
    read -l -P "Nome da migration: " name
    migrate create -ext sql -dir migrations -seq $name
end

function ccm 
  git diff | cody chat --stdin -m 'Write a commit message for this diff'
end

#Converter mkv para mp4
function mkv_to_mp4
    for i in *.mkv
        ffmpeg -i "$i" (string replace -r '\.mkv$' '.mp4' "$i")
    end
end

# Função para o yt-dlp 
function youtube_download
    set id $argv[1]
    set type ""
    set title ""

    # Verifica se é uma playlist
    if string match -q "*list=*" $id
        set type playlist
        # Extrai o título da playlist
        set title (yt-dlp --get-title --playlist-items 1 $id | string replace -r '[^\w\s]' '_' | string replace -r '\s+' '_')
        ydlmp3 -o "~/Músicas/Playlists/$title/%(title)s.%(ext)s" $id
    else
        set type video
        ydlmp4 -o "~/Vídeos/YouTube/%(title)s.%(ext)s" $id
    end

    echo "Download concluído: $type - $title"
end

#  Criar uma nova sessão tmux.
function tnew
    set -l session_name $argv[1]
    set -l session_dir $argv[2]
    set -l session_window_name $argv[3]

    # Set default values if not provided
    test -z "$session_name" && set session_name new
    test -z "$session_dir" && set session_dir "$HOME/Dev"
    test -z "$session_window_name" && set session_window_name main

    tmux new-session \
        -d \
        -s $session_name \
        -c $session_dir \
        -n $session_window_name
end
# Copiar para o servidor
function copy_to_server
    set source_path $argv[1]
    set content_type $argv[2]
    set server_user wander
    set server_ip "192.168.1.106"
    set server_path ""

    if test "$content_type" = filmes
        set server_path /mnt/videos/filmes/
    else if test "$content_type" = series
        set server_path /mnt/videos/series/
    else
        echo "Tipo de conteúdo inválido. Escolha 'filmes' ou 'series'."
        return 1
    end

    rsync -avzh --progress "$source_path" "$server_user@$server_ip:$server_path"
end

# Functions needed for !! and !$
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

# The bindings for !! and !$
if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end

# Function for org-agenda
function org-search -d "send a search string to org-mode"
    set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        (mapcar #'org-link-display-format \
        (org-ql-query \
        :select #'org-get-heading \
        :from  (org-agenda-files) \
        :where (org-ql--query-string-to-sexp \"$argv\"))) \
        \"
    \"))")
    printf $output
end

# Copiar aruivos de forma progressiva...
function copy_with_pv
    if test (count $argv) -ne 2
        echo "Uso: copy_with_pv <origem> <destino>"
        return 1
    end

    set origem $argv[1]
    set destino $argv[2]

    # Verifica se o destino é um diretório
    if not test -d "$destino"
        echo "Erro: $destino não é um diretório válido"
        return 1
    end

    # Se origem for um diretório, use tar e pv
    if test -d "$origem"
        tar cf - -C (dirname "$origem") (basename "$origem") | pv | tar xf - -C "$destino"
    else
        # Se origem for um arquivo, use pv diretamente
        pv "$origem" >"$destino"/(basename "$origem")
    end
end

### Função para criar ambiente em GOlang.!!
function mkdirgo
    if test (count $argv) -eq 0
        echo "Por favor, forneça um nome para a pasta."
        return 1
    end

    set dirname $argv[1]
    mkdir -p $dirname
    and cd $dirname
    and go mod init github.com/wanderlei2583/$dirname
    and echo "package main

import \"fmt\"

func main() {
    fmt.Println(\"Hello, World!\")
}" >main.go
    and echo "Pasta '$dirname' criada e ambiente Go inicializado."
end

function rename_series
    set season $argv[1]
    set ext $argv[2]
    find . -type f -name "*.$ext" | sort | awk -v season="$season" -v ext="$ext" '{ printf "mv \"%s\" S%02dE%02d.%s\n", $0, season, NR, ext }' | bash
end

function tnew
    # Define argumentos com valores padrão usando set -q para verificar se existem
    set -q argv[1]; and set session_name $argv[1]; or set session_name "new"
    set -q argv[2]; and set session_dir $argv[2]; or set session_dir "~/"
    set -q argv[3]; and set window_name $argv[3]; or set window_name "main"

    tmux new-session \
        -d \
        -s $session_name \
        -c $session_dir \
        -n $window_name
end

### END OF FUNCTIONS ###


### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
alias vim='nvim'
alias emacs="emacsclient -c -a 'emacs'"
alias em='/usr/bin/emacs -nw'
alias rem="killall emacs || echo 'Emacs server not running'; /usr/bin/emacs --daemon" # Kill Emacs and restart daemon..

# Changing "ls" to "eza"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first' # all files and dirs
alias ll='eza -l --color=always --group-directories-first' # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'
alias l.='eza -al --color=always --group-directories-first ../' # ls on the PARENT directory
alias l..='eza -al --color=always --group-directories-first ../../' # ls on directory 2 levels up
alias l...='eza -al --color=always --group-directories-first ../../../' # ls on directory 3 levels up

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# adding flags
alias df='df -h' # human-readable sizes
alias free='free -m' # show sizes in MB
alias grep='grep --color=auto' # colorize output (good for log files)

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

#yt-dlp aliases
alias ydl='yt-dlp'
alias ydlmp3='yt-dlp -S abr -f ba'
alias ydlmp4='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'
alias ydlmkv='yt-dlp -f "bestvideo[ext=mkv]+bestaudio[ext=mka]/best[ext=mkv]/best"'

# download youtube video
alias ytdv="python3 ~/scripts/python/youtubeDown.py"

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# change your default USER shell
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Log out and log back in for change to take effect.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Log out and log back in for change to take effect.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Log out and log back in for change to take effect.'"

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# termbin
alias tb="nc termbin.com 9999"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Mocp must be launched with bash instead of Fish!
alias mocp="bash -c mocp"

# ALias pessoal
alias f=fish
alias e='exit'
alias c='clear'
alias v='nvim'
alias efis='v ~/.config/fish/config.fish'
alias av='source env/bin/activate.fish'
#alias rsync='rsync --progress'
alias rsync='rsync --info=progress2'

alias env='python3 -m venv env'

### RANDOM COLOR SCRIPT ###
# Get this script from my GitLab: gitlab.com/dwt1/shell-color-scripts
# Or install it from the Arch User Repository: shell-color-scripts
colorscript random

# Config zoxide
zoxide init fish | source

#HomeBrew

### SETTING THE STARSHIP PROMPT ###
starship init fish | source

