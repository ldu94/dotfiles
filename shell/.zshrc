
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/li/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/li/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/li/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/li/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


HIST_STAMPS="yyyy-mm-dd"
# https://gist.github.com/matthewmccullough/787142
HISTSIZE=10000000 # How many lines of history to keep in memory
SAVEHIST=10000000 # Number of history entries to save to disk
HISTFILE=~/.zsh_history     # Where to save history to disk
setopt appendhistory     # Append history to the history file (no overwriting)
setopt sharehistory      # Share history across terminals
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed
setopt extendedhistory   # Save each command's timestamp and duration as:  `: <began>:<duration>;<command>`
alias history="history 1"  # Show all history
setopt interactive_comments  # Comments using '#' works on command line
PROMPT='%(?.%F{green}√.%F{red}%?)%f %F{blue}%m%f %B%F{240}%1~%f%b %F{yellow}%#%f '
autoload -U compinit && compinit  # Start up completion system
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case-insentive matching for completion
zstyle ':completion:*' menu select  # Press tab to highlight next match.
if [[ $OSTYPE =~ ^darwin ]]; then
      # Mac uses $LSCOLORS, but linux and zsh use $LS_COLORS
      export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"
fi
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # Use LS_COLORS for suggestions
autoload -Uz bashcompinit && bashcompinit
autoload -U select-word-style
select-word-style bash
export VISUAL=vim
export EDITOR=$VISUAL
# source ~/.shell/aliases.sh
 source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
 source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
PATH=$PATH:~/.local/bin
# C-U to delete until beginning of line
bindkey -e  # emacs keybindings for terminal navigation
# bindkey -v  # vim keybindings
bindkey \^U backward-kill-line
# fzf - note that this must be done after `bindkey -e`
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
if [ -f ~/.zshrc_local_after ]; then
      source ~/.zshrc_local_after
fi
# Make use of utilities installed into default user python venv
# PATH=~/.venv/bin:$PATH

