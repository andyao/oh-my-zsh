# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$fg[yellow]%} %~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby=' $(rvm-prompt i v g)'
else
  if which rbenv &> /dev/null; then
    rvm_ruby=' $(rbenv version | sed -e "s/ (set.*$//")'
  fi
fi

local git_branch='$(git_prompt_info)$(git_prompt_ahead)'

PROMPT="
%{$fg[grey]%}╭─[%W %*${rvm_ruby}] in%{$reset_color%}${current_dir} ${git_branch}
%{$fg[grey]%}╰─%B$%b%{$reset_color%} "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[grey]%}on%{$reset_color%} %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""
