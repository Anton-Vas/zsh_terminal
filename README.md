>   general
git config --global --add safe.directory /workspace/dts
git config --global http.sslVerify false

>   zsh pluggins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

>   zsh theme
cd .. && sudo git clone https://github.com/Anton-Vas/zsh_terminal.git && cd zsh_terminal && sudo chown -R node red_zsh.zsh-theme && cp red_zsh.zsh-theme ~/.oh-my-zsh/themes/

>   zsh TURN-ON all
> add to plugins/theme via $ code ~/.zshrc
zsh-autosuggestions
zsh-syntax-highlighting
red_zsh.zsh-theme
