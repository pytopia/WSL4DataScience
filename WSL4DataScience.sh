#!/bin/bash
#####################################################################################################
# Script_Name : WSL4DataScience.sh
# Description : This script offers tools that let data scientists to
#               quickly prepare their WSL for their projects.
# Date : Dec 2021
# written by : siniorone
# WebSite : https://github.com/siniorone/WSL4DataScience
# Version : 1.0
# Disclaimer : Script provided AS IS. Use it at your own risk....
#              You can use this script and distribute it as long as credits are kept
#              in place and unchanged
# runnig script :$ bash -c  "$(wget -qO- https://git.io/JyB33)"
####################################################################################################

logger(){
    COLUMNS=60
    title=$1
    echo -e "\e[1;33m   !-----------------------------------------------------!\e[0m"
    printf "\e[1;33m%*s\n\e[0m" $(((${#title}+$COLUMNS)/2)) "$title"
    echo -e "\e[1;33m   !-----------------------------------------------------!\e[0m"
}
show_header(){
    /bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
    /bin/echo -e "\e[1;36m   !              Welcome to WSL For Data Science Script            !\e[0m"
    /bin/echo -e "\e[1;36m   !  This script is intended to assist data scientists in working  !\e[0m"
    /bin/echo -e "\e[1;36m   !   with the Windows Subsystem for Linux (WSL).To delegate the   !\e[0m"
    /bin/echo -e "\e[1;36m   ! time-consuming tasks and configurations to the script and have !\e[0m"
    /bin/echo -e "\e[1;36m   !      your system up and running in a short period of time.     !\e[0m"
    /bin/echo -e "\e[1;36m   !      On Windows, we still advocate using [VScode] with the     !\e[0m"
    /bin/echo -e "\e[1;36m   !  [Remote - WSL] Extention for optimal integration and speed.   !\e[0m"
    /bin/echo -e "\e[1;36m   !  Install the [Windows Terminal] app from the Microsoft Store   !\e[0m"
    /bin/echo -e "\e[1;36m   !                 to make WSL more easy to use.                  !\e[0m"
    /bin/echo -e "\e[1;36m   !                          Dec. 2021                             !\e[0m"
    /bin/echo -e "\e[1;36m   !          https://github.com/pytopia/WSL4DataScience            !\e[0m"
    /bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
}
show_footer(){
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
/bin/echo -e "\e[1;36m   !                      Installation Completed.                   !\e[0m"
/bin/echo -e "\e[1;36m   !----------------------------------------------------------------!\e[0m"
}

show_menu(){
    line="   ================================================================="
    /bin/echo -e "\nInstallation Menu:\n"
    /bin/echo -e "\e[0;49;91m    0   HELP ME! \e[0m"
    /bin/echo -e "\e[1;49;32m    1   Update WSL \e[0m"
    /bin/echo -e "\e[1;49;34m    2   Full Installation \e[0m"
    /bin/echo -e "\e[1;49;93m    3   Anaconda Installation \e[0m"
    /bin/echo -e "\e[1;49;93m    4   ZSH Installation \e[0m"
    /bin/echo -e "\e[1;49;93m    5   Syntax Highlighting & Autosuggestions Installation \e[0m"
    /bin/echo -e "\e[1;49;93m    6   Oh My ZSH and other recommended Pkgs Installation \e[0m"
    /bin/echo -e "\e[1;49;93m    7   Font Installation \e[0m"
    /bin/echo -e "\e[1;49;93m    8   Schemes Installation \e[0m"
    /bin/echo -e "\e[1;49;93m    9   MongoDB Installation \e[0m"
    /bin/echo -e "\e[1;49;93m    10  Fix ~/.zshrc and Conda init \e[0m"
    /bin/echo -e "\e[1;49;93m    11  Create Conda env for DataScience Project \e[0m"
    /bin/echo -e "\e[0;49;91m    99  Exit \e[0m"
    /bin/echo -e "$line"
    read -p "Please Enter the Installation Mode: "  input
    while  [ $input -lt 0 ] || ([ $input -gt 11 ] && [ $input -ne 99 ]);do
        read -p "Please Enter the Installation Mode: "  input
    done
    return $input
}

help_me(){
    clear
    logger HELP
    /bin/echo -e "\e[1;49;91m    1   Update WSL:  \e[0m"
    /bin/echo -e "             install available upgrades of all packages currently installed"
    /bin/echo -e "             on the  system from the sources configured via sources.list"
    /bin/echo -e "             file. New packages will be installed if required to satisfy"
    /bin/echo -e "             dependencies, but existing packages will never be removed.\n"
    /bin/echo -e "\e[1;49;91m    2   Full Installation:  \e[0m"
    /bin/echo -e "             This part installs all of the script's functionality"
    /bin/echo -e "             on WSL.This feature is excellent for quickly establishing."
    /bin/echo -e "             an appropriate environment for data science activities."
    /bin/echo -e "\e[1;49;91m    3   Anaconda Installation:  \e[0m"
    /bin/echo -e "             Installs the most recent version of Anaconda, one of the most"
    /bin/echo -e "             popular package managers for data science projects.\n"
    /bin/echo -e "\e[1;49;91m    4   ZSH Installation:  \e[0m"
    /bin/echo -e "             ZSH is a powerful shell that can function as an interactive shell"
    /bin/echo -e "             as well as a scripting language interpreter. It has many features"
    /bin/echo -e "             similar to Bash, however some of ZSH's characteristics make it"
    /bin/echo -e "             superior to Bash, such as spelling correction, cd automation,better"
    /bin/echo -e "             theme and plugin support, and so on. \n"
    /bin/echo -e "\e[1;49;91m    5   Syntax Highlighting & Autosuggestions Installation:  \e[0m"
    /bin/echo -e "             It enables highlighting of commands whilst they are typed at a zsh"
    /bin/echo -e "             prompt into an interactive terminal. This helps in reviewing commands"
    /bin/echo -e "             before running them, particularly in catching syntax errors. As you type"
    /bin/echo -e "             commands, you will see a completion offered  after the cursor in a muted"
    /bin/echo -e "             gray color. If you press the right-arrow key or End with the cursorat the"
    /bin/echo -e "             end of the buffer, it will accept the suggestion,  replacing  the contents"
    /bin/echo -e "             of  the command line buffer with the suggestion. If you invoke the"
    /bin/echo -e "             forward-word  widget, it willpartially accept the suggestion up to the point"
    /bin/echo -e "             that the cursor moves to.\n"
    /bin/echo -e "\e[1;49;91m    6   Oh My ZSH and other recommended Pkgs Installation:  \e[0m"
    /bin/echo -e "             Oh My Zsh is a delightful, open source,community-driven framework"
    /bin/echo -e "             for managing your Zsh configuration. It comes bundled with thousands"
    /bin/echo -e "             of helpful functions, helpers,  plugins,  themes... . It also installs"
    /bin/echo -e "             the Powerlevel9k and Powerline fonts.Powerlevel9k was a tool for building"
    /bin/echo -e "             a beautiful and highly functional CLI, customized for you.\n"

    /bin/echo -e "\e[1;49;91m    7   Font Installation:  \e[0m"
    /bin/echo -e "             This script will install two fonts on Windows:"
    /bin/echo -e "             [Hack Regular Nerd Font Complete.ttf] and"
    /bin/echo -e "             [DejaVu Sans Mono Nerd Font Complete.ttf] "
    /bin/echo -e "             Enter the settings if you're using Windows Terminal."
    /bin/echo -e "             Choose your WSL profile.Set the Face Font option on"
    /bin/echo -e "             the Appearance tab to one of the two fonts shown above."
    /bin/echo -e "             Font adjustments are required to effectively display "
    /bin/echo -e "             WSL's features and capabilities. \n"

    /bin/echo -e "\e[1;49;91m    8   Schemes Installation:  \e[0m"
    /bin/echo -e "             Downloads around 40 schemas from the Iterm 2 "
    /bin/echo -e "             collection and adds them to the Windows Terminal settings."
    /bin/echo -e "             Before running this script, you must have Windows Terminal "
    /bin/echo -e "             installed. \n"
    /bin/echo -e "\e[1;49;91m    9   MongoDB Installation:  \e[0m"
    /bin/echo -e "             Due to the numerous issues encountered with  the  installation"
    /bin/echo -e "             of MongoDB on WSL, this script attempts to install version 4.4"
    /bin/echo -e "             on WSL so  that  you  may  access  MongoDB  through  127.0.0.1"
    /bin/echo -e "             and port 27017. In addition, if you want  to  install  MongoDB"
    /bin/echo -e "             on Windows and use it with WSL, a script will be added to your"
    /bin/echo -e "             WSL at the ~/findmongo path, and runs with this command:"
    /bin/echo -e "             $ source  ~/findmongo."
    /bin/echo -e "             findmongo  displays  the  correct  host  and  port for MongoDB"
    /bin/echo -e "             that installed on Windows."
    /bin/echo -e "             More information may be found in the README file of project.\n"
    /bin/echo -e "\e[1;49;91m    10  Fix ~/.zshrc and Conda init:  \e[0m"
    /bin/echo -e "             This section enhances  ZSH command prompt,"
    /bin/echo -e "             makes it compatible with Anaconda and Powerlevel9k,"
    /bin/echo -e "             and adds Anaconda's default settings to ~/.zshrc  .\n"
    /bin/echo -e "\e[1;49;91m    11  Create Conda env for DataScience Project:  \e[0m"
    /bin/echo -e "             In this section to provide a complete environment for"
    /bin/echo -e "             data science activities a Python environment is created"
    /bin/echo -e "             with the following packages and with your desired name: "
    /bin/echo -e "             python=3.8 jupyterlab pandas"
    /bin/echo -e "             numpy scipy matplotlib seaborn"
    /bin/echo -e "             scikit-learn tensorflow keras plotly"
    /bin/echo -e "             pytorch pymongo scrapy beautifulsoup4"
    /bin/echo -e "\e[1;49;91m    99  Exit:  \e[0m"
    /bin/echo -e "             You can quit the script by typing the number 99 in the menu.\n\n"
    read -p "Press Any Key to Exit : "
    return 99
}

update_wsl(){
    logger "Update WSL"
    sudo apt update -y
    sudo apt upgrade -y
}

anaconda_installation(){
    logger "Anaconda Installation"
    cd /tmp
    curl https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh --output anaconda.sh
    read -r shm_id rest <<<"$(sha256sum  /tmp/anaconda.sh)"
    if [[ "$shm_id" == "fedf9e340039557f7b5e8a8a86affa9d299f5e9820144bd7b92ae9f7ee08ac60" ]];then
        echo "Anaconda Downloaded Correctly"
        bash /tmp/anaconda.sh -u -b -p $HOME/anaconda3
    else
        echo "anaconda.sh file is corrupted!!!"
    fi
    
}

syntax_auto_installation(){
    logger "Syntax Highlighting & Autosuggestions Installation"
    sudo apt install -y zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
}

zsh_installation(){
    logger "ZSH Installation"
    sudo apt install -y zsh
    if [[ ! -f /root/.zsh ]];then
        echo "*"
    else
        sudo mv -fr  /root/.zsh /home/$SUDO_USER/.zsh
    fi
}

oh_my_zsh_installation(){
    logger "Oh My ZSH and other recemnded Pkgs Installation"
    sudo apt install -y powerline fonts-powerline
    sudo apt install -y zsh-theme-powerlevel9k
    sudo rm -r -f ~/.oh-my-zsh
    echo $(whoami)
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
}

font_installation(){
    logger "Font Installation"
    rm -r -f /mnt/c/myfonts
    mkdir /mnt/c/myfonts
    cd /mnt/c/myfonts
        cat << EOF > Install_Fonts.ps1
\$FontsFolder = "fonts-to-be-installed"
\$FONTS = 0x14
\$CopyOptions = 4 + 16;
\$objShell = New-Object -ComObject Shell.Application
\$objFolder = \$objShell.Namespace(\$FONTS)
\$allFonts = dir \$FontsFolder
foreach(\$font in Get-ChildItem -Path \$fontsFolder -File)
{
    \$dest = "C:\Windows\Fonts\\$font"
    echo "Installing \$font"
    \$CopyFlag = [String]::Format("{0:x}", \$CopyOptions);
    \$objFolder.CopyHere(\$font.fullname,\$CopyFlag)
}
EOF
    mkdir fonts-to-be-installed
    cd fonts-to-be-installed
    wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf --output-document=DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete.ttf
    wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf --output-document=Hack\ Regular\ Nerd\ Font\ Complete.ttf
    cd ..
    /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe  -executionpolicy Bypass -nologo -noninteractive -file C:/myfonts/Install_Fonts.ps1
    /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe Set-ExecutionPolicy -Scope Process -ExecutionPolicy Default
    cd ~
}

schemes_installation(){
    logger "Schemes Installation"
    bash -c  "$(wget -qO- https://git.io/J0g6c)"
    }

mongodb_installation(){
    logger "MongoDB Installation"
    sudo rm -rf /etc/apt/sources.list.d/mongo*  
    sudo apt purge mongodb-database-tools mongodb-mongosh mongodb-org* -y
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
    if [[ $(lsb_release -sr) -eq "20.04" ]];then
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
    else
        echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
    fi
    sudo apt update -y
    sudo apt install -y mongodb-org
    set -e
    if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
        sudo rm -f /etc/init/mongodb.conf
        sudo rm -f /etc/init/mongod
        sudo curl --http1.1 https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d --output /etc/init.d/mongod
        sudo chmod 755 /etc/init.d/mongod
        sudo mkdir -p /data/db
        sudo chown -R mongodb:mongodb /data/db
    fi
    echo 'echo "Mongo Bash Script"
    cd /mnt/c/Program\ Files/MongoDB/Server
    cd $(ls -d */|head -n 1)
    cd bin
    export MONGO_HOST=$(cat /etc/resolv.conf | grep nameserver | sed "s/nameserver\ //")
    sudo cp mongod.cfg /tmp/mongod.cfg
    sed  -i "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$MONGO_HOST/" /tmp/mongod.cfg
    sudo cat /tmp/mongod.cfg > mongod.cfg
    echo "host: $MONGO_HOST  port:27017"
    cd' > ~/findmongo
    echo "MongoDB Host: 127.0.0.1   Port: 27017"
    sudo service mongod start
}

fix_zshrc(){
    logger "Fix ~/.zshrc"
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
    echo $(whoami)
    sudo usermod -s /usr/bin/zsh $(whoami)
    source ~/anaconda3/etc/profile.d/conda.sh
    conda init zsh
    echo "done!"
}

conda_env(){
    logger "Create Conda env for DataScience Project"
    if [[ $# -eq 0 ]];then
        read -p "Please Enter Conda Env Name: " env        
    else
        env=$1
    fi
    echo "$env"
    conda create --name $env \
    python=3.8 jupyterlab pandas\
    numpy scipy matplotlib seaborn\
    scikit-learn tensorflow keras plotly\
    pytorch pymongo scrapy beautifulsoup4 -y
    cd ~/.jupyter
    rm -r -f  jupyter_notebook_config.py
    echo "c.NotebookApp.use_redirect_file = False" >> jupyter_notebook_config.py
}

full_installation(){
    logger "Full Installation"
    update_wsl
    anaconda_installation
    zsh_installation
    syntax_auto_installation
    oh_my_zsh_installation
    schemes_installation
    fix_zshrc
    conda_env "ds38"
    font_installation
    mongodb_installation
}

main(){
    clear
    show_header
    show_menu
    input=$?
    case $input in
        0)  help_me;;
        1)  update_wsl;;
        2)  full_installation;;
        3)  anaconda_installation;;
        4)  zsh_installation;;
        5)  syntax_auto_installation;;
        6)  oh_my_zsh_installation;;
        7)  font_installation;;
        8)  schemes_installation;;
        9)  mongodb_installation;;
        10) fix_zshrc;;
        11) conda_env;;
       esac
    show_footer
}

main
