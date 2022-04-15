#!/bin/env bash
clear
#Checkers
if (whereis geany)
then
echo "Geany Detected, this may Cause some issues in some areas if proceeding."
fi
if (whereis xfce4-session)
then
echo "XFCE Detected, this may cause issues in some areas if proceeding."
sleep 5
clear
fi
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
#code
if ( apt install x11-repo -y )
then
echo ""
else
termux-toast "Cannot Install X11-Repo, Check your Connectivity, Aborting."
echo "$red_f$bold Script on Error $?"
sleep 3
exit 1
fi
cat << "_EOF_"

XFCE INSTALLATION

1) Install XFCE
2) Install XFCE With Utilities
3) Install Yisus7u7's XFCE 
   (Warning: may fail, if it does, please Execute manually)
   (Here's The Code: 
   https://raw.githubusercontent.com/Yisus7u7/termux-desktop-xfce/main/boostrap.sh)
4) Install XFCE with Geany IDE only 
  (Focusing on Development, Fewer Assets installed, although..
  You may have to manually install Compilers.)
0) Back
_EOF_
read -p "$green_f$bold Input Here: [ 0 - 4 ]> $norm"
if [[ $REPLY =~ ^[0-3]$ ]]; then
case $REPLY in
  1 )
  echo -E "$green_f\Installing XFCE 4$norm"
  apt install xfce4 -y
  echo "Done"
  exit
  ;;
  2 )
  echo -E "$green_f\Installing XFCE with Goodies$norm"
  apt install xfce4 xfce4-goodies -y
  echo "Done"
  sleep 1
  exit
  ;;
  3 )
  clear
  echo "$red_b$white_f$bold$uline Warning, you are installing, Yisus7u7's XFCE, there's a higher level risk of failure to install for now. If issues popped up, alert me.$norm"
  sleep 3
  curl -sLf https://raw.githubusercontent.com/Yisus7u7/termux-desktop-xfce/main/boostrap.sh | bash
  if (whereis xfce4-session ; whereis geany)
  then
    echo "$green_f Installation Confirmed$norm"
    exit
    else
    echo "$bold$red_f No Signs of Yisus7u7's XFCE. Please Report the Issue as: Fail to install Yisus7u7's XFCE."
    exit
    fi
    ;;
  4 )
  echo "$green_f Installing XFCE with Geany IDE..$norm"
 if ( apt install geany xfce4 -y )
 then
 echo "$green_f Installation Complete..$norm"
 exit
 else
  echo "$red_f Install Failed, Please Check your connection or run 'apt-get --fix-missing / dpkg --configure -a . or its just your internet$norm"
  sleep 5
  exit
  fi
  ;;
  0 )
  echo "$red_f\Abort$norm"
  sleep 2
  exit 
  ;;
  esac
 else
 echo "Invalid Input"
 sleep $delay
 fi
./tool/x11.sh
