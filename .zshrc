#            _              
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           
# -----------------------------------------------------
# ML4W zshrc loader
# -----------------------------------------------------

# DON'T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/zshrc 
# or by creating a folder ~/.config/zshrc/custom
# with copies of files from ~/.config/zshrc 
# -----------------------------------------------------

for f in ~/.config/zshrc/*; do 
    if [ ! -d $f ] ;then
        c=`echo $f | sed -e "s=.config/zshrc=.config/zshrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done

# Flutter Setup By AR Rahman(Heartless)
export PATH="$PATH:$HOME/Android/flutter/bin"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_TOOLS="$HOME/Android/Sdk/cmdline-tools/latest"
export ANDROID_PLATFORM_TOOLS="$HOME/Android/Sdk/platform-tools"
PATH="$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS"
# Chrome Setup
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

