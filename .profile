alias c="clear"
alias vim='nvim'
alias vi='nvim'
alias ls='ls --color=auto'
alias k='kubectl'
alias h='helm'
alias kctx='kubectx'
alias kns='kubens'

[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

export EDITOR="nvim"
export SHELL="zsh"

export GOPATH="$HOME/.go"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:/opt/android-sdk/platform-tools"
export PATH="$PATH:/opt/android-sdk/build-tools"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
export KUBECONFIG="$HOME/.kube/config"


# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

