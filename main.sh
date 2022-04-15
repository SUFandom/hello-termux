#!/bin/bash
clear
#Random Number Generator, ranging only 1 to 10
rand=$( shuf -i 1-20 -n 1)
#Var
procx=$!
barrier="======================================================"
#norm
norm=$(tput sgr0)
#ColorGrade
red_f=$(tput setaf 1)
red_b=$(tput setab 1)
green_f=$(tput setaf 2)
green_b=$(tput setab 2)
yellow_f=$(tput setaf 3)
yellow_b=$(tput setab 3)
blue_f=$(tput setaf 4)
blue_b=$(tput setab 4)
magenta_f=$(tput setaf 5)
magenta_b=$(tput setab 5)
cyan_f=$(tput setaf 6)
cyan_b=$(tput setab 6)
white_f=$(tput setaf 7)
white_b=$(tput setab 7)

#TextForm
bold=$(tput bold)
uline=$(tput smul)
blink=$(tput blink)
reverse=$(tput rev)
standout=$(tput smso)

#Others
user=$(whoami)
host=$(uname -n)
opsys=$(uname -o)
machine=$(uname -m)
kernel_nme=$(uname -s)
kernel_rel=$(uname -r)
kernel_ver=$(uname -v)
upt=$(uptime -p)
cal=$(date)
termux-notification -t "Hello Termux is Running" -c "Hello Termux is Running and at Process id: $procx" --button1 "End Process in Terminal" --button1-action kill $procx
#Default Delay Variable
delay=5
while true ; do
clear
#main
cat << "EOF"

        _  _     _ _
       | || |___| | |___
       | __ / -_) | / _ \
       |_||_\___|_|_\___/
 _____                      _
|_   _|__ _ _ _ __ _  ___ _| |
  | |/ -_) '_| '  \ || \ \ /_|
  |_|\___|_| |_|_|_\_,_/_\_(_)
  
      VERSION 1.0 - ©GPL 3.0
             SUFANDOM
  
EOF
echo "$bold$green_f> $( sed -n $rand\p misc/quote.txt ) $norm"
sleep 3
echo -E "$green_f Hello, $user\!$norm"
echo "$barrier"
echo -E "$green_f $bold A tool that will let you kickstart your Termux Experience, as it will try to help you get used to this App\!$norm"
echo "$barrier"
sleep 2
echo "$green_f $bold System Info$norm"
echo "$barrier"
echo "$cyan_f Kernel: $kernel_nme$norm"
echo "$magenta_f Version: $kernel_ver$norm"
echo "$blue_f Release Date: $kernel_rel. $norm"
echo "$green_f Operating System: $opsys$norm"
echo "$yellow_f Linux Host: $host $norm"
echo "$ref_f CPU Architecture: $machine$norm"
echo "$white_f Device Uptime: $upt$norm"
echo "$red_f Date: $cal$norm"
echo "$barrier"
sleep $delay
echo ""
echo ""
echo ""
echo "$barrier"
echo "$cyan_f$uline Select Menu here$norm$cyan_f: $norm"

cat << "_EOF_"
 1) Install Basic Necessities
 2) Install X11 Utilities ( Options Available )
 3) Install C Utilities (Includes C++ and C# Support)
 4) Install Custom ohMyzsh! with ability to Modify your terminal easily
 5) Setup Storage
 6) Check if Terminal Granted Root Access
 7) Install Python Library ( Options available )
 0) Exit
_EOF_


read -p "$green_f$bold$uline\Enter your Choice, [ 0 - 7 ] > $norm"
if [[ $REPLY =~ ^[0-8]$  ]]; then
    case $REPLY in
    
    1)
    clear
    echo -E "$greem_f\Installing Basic Necessities..$norm"
    sleep $delay
    apt update
    apt upgrade -y
    apt install nano -y
    apt install termux-tools termux-apt-repo -y
    apt install neofetch man cpufetch figlet openssh wget -y
    clear
    echo "$green_f Done!$norm"
    sleep $delay
    continue
    ;;
    2) bash tool/x11.sh
    ;;
    3)
    echo "Installing"
    if (apt install clang -y)
    then
    echo "$bold$green_f Clang Installed$norm"
    sleep 3
    continue
    else
    echo "$bold$red_f Clang Installation Failed.$norm"
    echo "$bold$red_f Please execute apt update on second Session or use apt-get --fix-missing / dpkg --configure -a ."
    sleep 2
    continue
    fi
    ;;
    4)
    echo -E "$bold$cyan_f You are now trying to Install ohmyZSH\!"
    sleep 1
    echo -E "$bold$yellow_f Although, if there's any issues, try to check the directory for 'termux-omz' and execute chmod +x install and run it. But since this is automation, this script will try to install it. (After this, you are needed to Restart Termux to Apply Effects.)$norm"
    sleep 5
    git clone https://github.com/Cabbagec/termux-ohmyzsh
    echo "Installer Prompt Incoming"
    sleep 1
    if ( ./termux-ohmyzsh/install.sh )
    then
   echo "$green_f$bold Restart Termux if Completed$norm"
   else
   echo "$bold$red_f Failed To Execute install, Please go to termux-ohmyzsh and install.$norm"
   sleep 2
   continue
   fi
    ;;
    5)
    if [[ -d storage ]] ; then
      echo "$green_f$bold Permission Already Present$norm"
      sleep 5
      continue
    else
      termux-setup-storage
      echo "$green_f$bold$uline Storage Permission Access now Permitted $norm"
      sleep 5
    fi
      continue
    ;;
    6)
    if (( $UEID = 0 ))
    then
      echo "$yellow_f You are in Root\!$norm"
      sleep 5
      continue
    else
      echo "$bold$red_f You are not in Root,But if you are, the.you may used an Xposed Module to Hid it, or Used Magisk, or just .. you didn't give it./$norm"
      sleep 5
      continue
    fi
    ;;
    7)
    clear
    echo "$green_f$bold Installing Python 3.$norm"
    sleep 2
    apt install python -y
    apt install python-apt -y
    apt install python-static -y
    continue
    ;;
    0)
    clear
    sleep 2
    exit 0
    ;;
    esac
  else
  echo -E "$white_b$red_f$bold\Wrong Input, Please Try to Read instructions again.$norm"
  sleep $delay
  clear
fi
done
echo "Program Terminated"
exit 0
#199 Lines Lol, a first in my programming motive!, i mean i like codes that are short and easy, but damn, this took me a fucking week
