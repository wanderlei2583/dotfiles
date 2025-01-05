# Load modular configuratio
for f in ~/.config/zshrc/*; do 
  if [[ ! -d $f ]]; then
    c=`echo $f | sed -e "s=.config/zshrc=.config/zshrc/custom="`
    [[ -f $c ]] && source $c || source $f 
  fi
done

# Habilitar complementações
autoload -Uz compinit
compinit

alias v=nvim
alias e=exit
alias c=clear
alias sns='sudo nixos-rebuild switch'
alias update='nix-channel --update'


# Prompt do Starship
eval "$(starship init zsh)"

# Prompt do zoxide
eval "$(zoxide init zsh)"
