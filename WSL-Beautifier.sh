#####################################################################################################
# Script_Name : WSL-Beautifier.sh
# Description : Perform ZSH installation on Ubuntu 18.04,20.4,20.10,21.04 and perform
#               additional post configuration to improve end user experience
#               installs Powerline,Powerlevel9k,Syntax Highlighting,Git,Autosuggestions,Oh My ZSH
#               
# Date : Aug 2021
# written by : Siniorone
# WebSite : https://github.com/siniorone/WSL-Beautifier 
# Version : 1.0 
# Disclaimer : Script provided AS IS. Use it at your own risk....
#              You can use this script and distribute it as long as credits are kept 
#              in place and unchanged   
# runnig script :$ sudo bash -c  "$(wget -qO- https://git.io/J0Tr6)"
# fixing zshrc  :$ sudo bash  ~/.fixzsh.sh  
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
/bin/echo -e "\e[1;36m   !               Git,Autosuggestions,Oh My ZSH                    !\e[0m"
/bin/echo -e "\e[1;36m   !          Credits : Written by Siniorone - Aug. 2021            !\e[0m"
/bin/echo -e "\e[1;36m   !          https://github.com/siniorone/WSL-Beautifier           !\e[0m"
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
sudo apt update
sudo apt upgrade
#---------------------------------------------------#
# Section 2  - ZSH installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing ZSH Packages...Proceeding...   !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install zsh
sudo mv -f  /root/.zsh /home/$SUDO_USER/.zsh
#---------------------------------------------------#
# Section 3  - Powerline  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing Powerline Pkgs...Proceeding    !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install powerline fonts-powerline
#---------------------------------------------------#
# Section 4  - Powerlevel9k  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   Installing powerlevel9k ...Proceeding     !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install zsh-theme-powerlevel9k
#---------------------------------------------------#
# Section 5  - Syntax Highlighting  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   ! Installing Syntax Highlighting...Proceeding !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
sudo apt install zsh-syntax-highlighting
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
git clone https://github.com/zsh-users/zsh-autosuggestions /home/$SUDO_USER/.zsh/zsh-autosuggestions
#---------------------------------------------------#
# Section 8  - zshrc  config and conda initialization
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !   zshrc  config and conda initialization    !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
ver=$(lsb_release -sr)
cat << EOF > ~/.zshrc
echo Ubuntu $ver
cd ~
export ZSH="/home/$SUDO_USER/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source /home/$SUDO_USER/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history ram ssh)
EOF
source /home/$SUDO_USER/anaconda3/etc/profile.d/conda.sh
conda init zsh
sudo cp ~/.zshrc /home/$SUDO_USER/.fixmyzsh
cat << EOF > /home/$SUDO_USER/.fixzsh.sh
cat /home/$SUDO_USER/.fixmyzsh > /home/$SUDO_USER/.zshrc
cat /home/$SUDO_USER/.fixmyzsh > /root/.zshrc
sudo usermod -s /usr/bin/zsh $SUDO_USER
sudo mv -f  /root/.oh-my-zsh /home/$SUDO_USER/.oh-my-zsh
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m   !  Installation Completed...Please test your ZSH configuration   !\e[0m" 
/bin/echo -e "\e[1;36m   !          now close your terminal and open it again             !\e[0m"
/bin/echo -e "\e[1;36m   !      and change defult font from Properties>Fonts to the       !\e[0m"
/bin/echo -e "\e[1;36m                 [ DejaVu Sans Mono Bold for Powerline ]            !\e[0m"
/bin/echo -e "\e[1;36m   !                                                                !\e[0m"
/bin/echo -e "\e[1;36m   !          Credits : Written by Siniorone - Aug. 2021            !\e[0m"
/bin/echo -e "\e[1;36m   !          https://github.com/siniorone/WSL-Beautifier           !\e[0m"
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
EOF
sudo cp /home/$SUDO_USER/.fixzsh.sh ~/.fixzsh.sh
#---------------------------------------------------#
# Section 9  - Fonts and Color  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   ! Font and Color  installation ...Proceeding  !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
rm -r -f  /mnt/c/myfonts
mkdir /mnt/c/myfonts
cd /mnt/c/myfonts
git clone https://github.com/powerline/fonts.git
cd fonts
sudo cp /mnt/c/myfonts/fonts/install.ps1 /mnt/c/myfonts/install.ps1
find ./ -mindepth 1 ! -regex '^./DejaVuSansMono\(/.*\)?' -delete
sudo cp /mnt/c/myfonts/install.ps1 /mnt/c/myfonts/fonts/install.ps1
sudo /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe C:/myfonts/fonts/install.ps1
rm -r -f /mnt/c/myfonts
#---------------------------------------------------#
# Section 10  - Oh My ZSH  installation....
#---------------------------------------------------#
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
/bin/echo -e "\e[1;33m   !      Installing Oh My ZSH ...Proceeding     !\e[0m"
/bin/echo -e "\e[1;33m   !---------------------------------------------!\e[0m"
exit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#---------------------------------------------------#
#                  Finish
#---------------------------------------------------#
