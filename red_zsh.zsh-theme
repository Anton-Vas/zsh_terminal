# smoothmonkey.zsh-theme
# Org rep: 		https://github.com/sebastianpulido/oh-my-zsh/smoothmonkey.zsh-theme
# based on: 	https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
# based on: 	jbergantine.zsh-theme
#
# Copy from this folder: 	cp /home/dev/Desktop/zsh/red_zsh.zsh-theme ~/.oh-my-zsh/themes/
#
#
#//////////////////// v2 as gnzh //////////////////////////////////////////////////////////////

setopt prompt_subst

() {

# 
local PR_USER
local PR_USER_OP
local PR_PROMPT
local PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then 	# normal user
  PR_USER='%F{grey}%n%f'
  PR_USER_OP='%F{grey}%#%f'
#  PR_PROMPT='%F %f'
else 						# root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
#  PR_PROMPT='%F{red} %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{grey}%M%f' # no SSH
fi


# UI prototypes
local git_branch='$(git_prompt_info)'
local return_code="%(?..%F{red}%? ↵%f)"
local red_arr_one="%F{grey}╭─%f"
local red_arr_two="%F{grey}╰─%f%F{red}➤%f"
local red_beg="%F{red}[%f"
local red_end="%F{red}]%f"
local red_div="%F{red}:%f"
local user_host="${PR_USER}%F{red}@%f${PR_HOST}"
local current_dir="%B%F{blue}%~%f%b"
local gen_line="%F{grey}${(r:$COLUMNS::.:)}%f"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">%f"

# UI conditions
if [ -z "$git_branch" ]
then
  echo "git_branch is empty"
  git_branch="%F{yellow}~%f"
fi

# UI combined
local user_info="${red_arr_one}${red_beg}${user_host}${red_end}${red_beg}${current_dir}${red_end}"
local git_info="%F{grey}│%f ${red_beg}%F{grey}git%f${red_div}${git_branch}${red_end}"

# Prompt UI
PROMPT="${gen_line}
${user_info}
${git_info}
${red_arr_two}$PR_PROMPT "
RPROMPT="${return_code}"

}




