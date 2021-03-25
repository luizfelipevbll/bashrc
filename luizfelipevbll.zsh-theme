# luizfelipevbll.zsh-theme
# Inspired in brazillian Flag

function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

function current_time() {
   echo "%*"
}

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

function return_status() {
   echo "%(?..☠)"
}

local ruby_env='$(ruby_prompt_info)'
local git_info='$(git_prompt_info)'
local virtualenv_info='$(virtualenv_prompt_info)'
local prompt_char='$(prompt_char)'

main_color="${FG[002]}"
prompt_symbol=@
if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
	main_color="${FG[001]}"
	prompt_symbol=☠
fi

PROMPT="╭──%BΣ%b(%B${main_color}%n${FG[226]}$prompt_symbol${main_color}$(box_name)%f%b)─[${FG[239]}%B${FG[014]}%~%b]${git_info}${ruby_env}${virtualenv_info}
╰─$%{$reset_color%} "
RPROMPT="$(current_time)$(return_status)"

ZSH_THEME_GIT_PROMPT_PREFIX="─${FG[226]}♜("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=")♜%u${FG[001]}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN=")♜%u${FG[002]}✔"

ZSH_THEME_RUBY_PROMPT_PREFIX="  «venv: ${FG[214]}"
ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$reset_color%}»"

export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_VIRTUALENV_PREFIX="  «venv: ${FG[214]}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}»"
