# The prompt
#PROMPT='$(_user_host):$(_current_path)$(_return_status) '
PROMPT='$(_user_host) $(_current_path)$(git_prompt_info) $(_return_status) '

# The right-hand prompt
#RPROMPT='$(git_prompt_info)'

function _current_path() {
    echo "%{$fg[cyan]%}%c%{$reset_color%}"
}

function _return_status() {
#    echo "%(?:❯:%{$fg[red]%}❯%{$reset_color%})"
    echo "%(?:$:%{$fg[red]%}$%{$reset_color%})"
}

function _user_host() {
    echo "%{$fg[green]%}[%n@%m]%{$reset_color%}"
#    echo "%{$fg[green]%}❯❯❯"
#    echo "%{$fg[green]%}❯"
#    echo "%{$fg[green]%}>"
#    echo "%{$fg[green]%}#"

}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%] git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%})%{$fg[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%})"

