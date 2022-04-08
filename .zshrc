export _JAVA_AWT_WM_NONREPARENTING=1
export LIBVA_DRIVER_NAME=radeonsi
#export MOZ_DISABLE_RDD_SANDBOX=1
#export MOZ_ENABLE_WAYLAND=1
export LIBSEAT_BACKEND=logind

autoload -U colors && colors
PS1="%B%{$fg[cyan]%}[%{$fg[red]%}%n%{$fg[cyan]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[cyan]%}]%{$reset_color%}$%b "
stty stop undef
setopt interactive_comments

if command -v go &> /dev/null
then
    export GOPATH=$(go env GOPATH)

    # Add $GOPATH/bin to $PATH if not already there
    case ":$PATH:" in
        *:$GOPATH/bin:*) ;;
        *) export PATH=$PATH:$GOPATH/bin ;;
    esac
fi

alias ls="ls --color=auto"

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/mcli mcli
