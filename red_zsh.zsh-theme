# /////////////////////////////////////////////////////////////////////////////////////////
#
# Org rep: 		  https://github.com/sebastianpulido/oh-my-zsh
# OhMyZsh GIT: 	https://github.com/ohmyzsh/ohmyzsh/blob/d2725d44fce59ea7060b4d712c5739512a56882d/lib/git.zsh
#
# Copy from this folder: 	cp <path_to_file> ~/.oh-my-zsh/themes/
#
#/////////////////////////////////////////////////////////////////////////////////////////

#~~~~ UI "user@host" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local PR_USER_OP
local PR_USER
local PR_PROMPT

# Check the UID
if [[ $UID -ne 0 ]]; then 	# normal user
  PR_USER='%F{grey}%n%f'
  PR_USER_OP='%F{grey}%#%f'
#  PR_PROMPT='%F %f'
else 						# root
  PR_USER='%F{red}%n%f'
fi
# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{grey}%M%f' # no SSH
fi

#~~~~ UI prototypes ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local git_branch='$(git_prompt_info)'
local return_code="%(?..%F{red}%? ↵%f)"
local red_arr_one="%F{grey}╭─%f"
local red_arr_two="%F{grey}╰─%f%F{red}ᐅ%f" # ⮞ᐳᗒᐅᐉ
local red_arr_tree="%F{grey}│%f "
local folder_icon="%F{grey}🗁 %f" # pth 🖿 🗁 🗀
local user_icon="%F{grey}🖳 %f" # usr ♻ 🖳 🕱 🕶
local git_icon="%F{grey}⌥ %f" # git ↻ ⌥ ⎇ ⎌ ⎘
local red_beg="%F{red}[%f"
local red_end="%F{red}]%f"
local red_div="%F{red}:%f"
local user_host="${PR_USER}%F{red}@%f${PR_HOST}"
local current_dir="%B%F{blue}%~%f%b"
local gen_line="%F{red}${(r:$COLUMNS::- :)}%f"    # ┄ ─ - ˅
# ┈ ꒔

#~~~~ GIT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}❯ " # ▶ ▷ ❯
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{yellow} ❮%f" # ◀ ◁ ❮

# parse_git_dirty()

ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}☒%f" # ☒ ⮿
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}☑%f" # ☑ ✔

# git_prompt_status()

# ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[green]%}✚%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg[blue]%}✹%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}✖%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[magenta]%}➼%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[yellow]%}═%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[cyan]%}✭%{$reset_color%}"

# git_prompt_ahead()

# ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[red]%}!%{$reset_color%}"

# git_remote_status

# ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="⟶%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="⟵%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⇄%{$reset_color%}"

# git_prompt_long_sha() and git_prompt_short_sha()

# ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg[yellow]%}"
# ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]%{$reset_color%}"

#~~~~ UI combined ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local user_info="${red_arr_one}${red_beg}${user_icon}${red_div}${user_host}${red_end}"
local path_info="${red_arr_tree}${red_beg}${folder_icon}${red_div}${current_dir}${red_end}" # 🖿 🗁 🗀
local git_info="${red_arr_tree}${red_beg}${git_icon}${red_div}${git_branch}${red_end}"

#~~~~ Prompt UI ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT="${gen_line}
${user_info}
${path_info}
${git_info}
${red_arr_two}$PR_PROMPT "
RPROMPT="${return_code}"
