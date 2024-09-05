#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 
# -----------------------------------------------------
# ML4W bashrc loader
# -----------------------------------------------------

# DON'T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/bashrc 
# or by creating a folder ~/.config/zshrc/custom
# with copies of files from ~/.config/zshrc 
# -----------------------------------------------------

for f in ~/.config/bashrc/*; do 
    if [ ! -d $f ] ;then
        c=`echo $f | sed -e "s=.config/bashrc=.config/bashrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done

# Flutter Setup By AR Rahman(Heartless)
export PATH="/home/wrp/Android/flutter/bin:$PATH"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_TOOLS="$HOME/Android/Sdk/cmdline-tools/latest"
export ANDROID_PLATFORM_TOOLS="$HOME/Android/Sdk/platform-tools"
PATH="$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS"
# Chrome Setup
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
