#####################################################################################################
# Script_Name : WSL-Beautifier.sh
# Description : Perform ZSH installation on Ubuntu 18.04,20.4,20.10,21.04 and perform
#               additional post configuration to improve end user experience
#               installs Powerline,Powerlevel9k,Syntax Highlighting,Git,Autosuggestions,Oh My ZSH
#               and 40 schemes from iTerm2-Color-Schemes.
# Date : Aug 2021
# written by : Siniorone
# WebSite : https://github.com/siniorone/WSL-Beautifier 
# Version : 1.0 
# Disclaimer : Script provided AS IS. Use it at your own risk....
#              You can use this script and distribute it as long as credits are kept 
#              in place and unchanged   
# runnig script :$ bash -c  "$(wget -qO- https://git.io/J0Tr6)"
####################################################################################################
#---------------------------------------------------#
# Section 1  - Welcome & UPDATE
#---------------------------------------------------#
echo $SUDO_USER
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m   !                   Welcome to WSL-Beautifier                    !\e[0m" 
/bin/echo -e "\e[1;36m   !   This script Perform ZSH initialization and then peform some  !\e[0m"
/bin/echo -e "\e[1;36m   !        configuation on zshrc and initialize Anaconda           !\e[0m"
/bin/echo -e "\e[1;36m   !     this pakages will be installed after runnig the script     !\e[0m"
/bin/echo -e "\e[1;36m   !           Powerline,Powerlevel9k,Syntax Highlighting           !\e[0m"
/bin/echo -e "\e[1;36m   !               Git,Autosuggestions,Oh My ZSH and                !\e[0m"
/bin/echo -e "\e[1;36m   !              40 schemes from iTerm2-Color-Schemes              !\e[0m"
/bin/echo -e "\e[1;36m   !          Credits : Written by Siniorone - Aug. 2021            !\e[0m"
/bin/echo -e "\e[1;36m   !          https://github.com/siniorone/WSL-Beautifier           !\e[0m"
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
sudo apt update -y
sudo apt upgrade -y
#---------------------------------------------------#
# Section 2  - ZSH installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing ZSH Packages...Proceeding...   !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install -y zsh
if [[ ! -f /root/.zsh ]]
then
    echo "*"
else
	sudo mv -fr  /root/.zsh /home/$SUDO_USER/.zsh
fi
#---------------------------------------------------#
# Section 3  - Powerline  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing Powerline Pkgs...Proceeding    !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install -y powerline fonts-powerline
#---------------------------------------------------#
# Section 4  - Powerlevel9k  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing powerlevel9k ...Proceeding     !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install -y zsh-theme-powerlevel9k
#---------------------------------------------------#
# Section 5  - Syntax Highlighting  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   ! Installing Syntax Highlighting...Proceeding !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install -y zsh-syntax-highlighting
#---------------------------------------------------#
# Section 6  - Git  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !        Installing Git ...Proceeding         !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install git
#---------------------------------------------------#
# Section 7  - Autosuggestions  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing Autosuggestions ...Proceeding  !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
#---------------------------------------------------#
# Section 8  - zshrc  configuration
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !            ZSHRC  configuration             !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
ver=$(lsb_release -sr)
cat << EOF > ~/.zshrc
echo Ubuntu $ver
cd ~
export ZSH="/home/$(whoami)/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source /home/$(whoami)/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history ram ssh)
EOF

echo "done!"
#---------------------------------------------------#
# Section 9  - Fonts  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !    Fonts  installation ...Proceeding        !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
rm -r -f /mnt/c/myfonts
mkdir /mnt/c/myfonts
cd /mnt/c/myfonts
wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/install.ps1 --output-document=install.ps1
mkdir fonts
cd fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf --output-document=DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete.ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf --output-document=Hack\ Regular\ Nerd\ Font\ Complete.ttf
/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe C:/myfonts/install.ps1
/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Set-ExecutionPolicy -Scope Process -ExecutionPolicy Default
cd ~
rm -r -f /mnt/c/myfonts
#---------------------------------------------------#
# Section 10  - Oh My ZSH  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !      Installing Oh My ZSH ...Proceeding     !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo rm -r -f ~/.oh-my-zsh
echo $(whoami)
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
#---------------------------------------------------#
# Section 11  - Conda and ZSH initialization ....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   ! Conda and ZSH initialization ...Proceeding  !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
echo $(whoami)
usermod -s /usr/bin/zsh $(whoami)
source ~/anaconda3/etc/profile.d/conda.sh
conda init zsh
#---------------------------------------------------#
#                  Finish
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   ! Adding Schemes to setting.json...Proceeding !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
bash -c  "$(wget -qO- https://git.io/J0g6c)"
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m   !  Installation Completed...Please test your ZSH configuration   !\e[0m" 
/bin/echo -e "\e[1;36m   !          now close your terminal and open it again             !\e[0m"
/bin/echo -e "\e[1;36m   !      and change defult font from Properties>Fonts to the       !\e[0m"
/bin/echo -e "\e[1;36m   !             [ DejaVu Sans Mono Nerd Font Complete ]            !\e[0m"
/bin/echo -e "\e[1;36m   !             or    [Hack Regular Nerd Font Complete]            !\e[0m"
/bin/echo -e "\e[1;36m   !          Credits : Written by Siniorone - Aug. 2021            !\e[0m"
/bin/echo -e "\e[1;36m   !          https://github.com/siniorone/WSL-Beautifier           !\e[0m"
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
