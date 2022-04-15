#!/bin/bash



#LoadingAnim

anim=( "|" "/" "-" "\ " "|"  )

#ProcessSys
procs(){
animation &
pid=$!
for i in 'seq  1 5 '
do 
sleep 1
done
sleep 5
echo "Remember to install Termux:API on F-Droid"
sleep 1
apt install termux-api -y
apt install dialog bash -y
echo "Done"
sleep 3
clear
echo "Testing API"
sleep 3
if ( termux-notification -t "Test from api.sh" -c "Test Complete" )
then
echo "$(tput setaf 2)Test Notification now pops up$(tput sgr0)"
else
echo "$(tput setaf 1)Fail to Brodcast Notification. Contact Developer for more info$(tput sgr0)"
fi
if ( termux-toast -b "gray" -g "top" "Termux Toast API test" )
then
echo "$(tput setaf 2)Confirm Toast Broadcast$(tput sgr0)"
else
echo "$(tput setaf 1)Brodcast Fail, may affect the user Experience later. anyways, tell the developer about this issue.$(tput sgr0)"
fi
sleep 2
clear
echo "Execute main.sh now"
kill $pid
}
#anim
animation(){
  while [ 1 ]
  do
  for i in "${anim[@]}"
  do
    echo -ne "$(tput setaf 2) Initializing:$(tput setaf 3)$i $(tput sgr0)\r"
    sleep 0.5
  done
 done
  
}
procs
