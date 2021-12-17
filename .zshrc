# vim: set foldmethod=marker:

source .zsh-plugins/zsh-snap/znap.zsh
#### aliases {{{ ####
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias vim="nvim"
#### }}} ####

#### functions {{{ ####
# usage: add-vim-package user repo folder opt|start 
add-vim-package () {
  cd ~
  /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME\
      submodule add --name $2 git@github.com:$1/$2.git\
      .vim/pack/$3/$4/$2
  cd $OLDPWD
}

# usage: add-zsh-package user repo
add-zsh-package () {
  /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME\
      submodule add --name $2 git@github.com:$1/$2.git\
      ~/.zsh-plugins/$2
}

#### }}} ####

#### variables {{{ ####
BINDIRS=(
  /usr/local/bin
  /opt/homebrew/bin
  $HOME/.cargo/bin
)

for BINDIR in "${BINDIRS[@]}"
do
  export PATH=$BINDIR:$PATH
done

#### }}} ####

#### znap {{{ ####
znap source chrissicool/zsh-256color
znap source mafredri/zsh-async
znap source eendroroy/zed-zsh
znap source changyuheng/fz
znap source joshskidmore/zsh-fzf-history-search
znap source reegnz/jq-zsh-plugin
znap source zpm-zsh/ssh
znap source Aloxaf/fzf-tab

ZSH_AUTOSUGGEST_STRATEGY=( completion history )
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *|git *)"
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="git *"
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

znap source marlonrichert/zcolors
znap eval marlonrichert/zcolors "zcolors"

znap eval starship "starship init zsh"
znap eval brew-shellenv "brew shellenv"
znap prompt
#### }}} ####

