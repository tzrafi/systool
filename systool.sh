#!/bin/bash
#
#------------------
# systool
# By Tz Rafi
#------------------
#

banner(){
clear
echo "#################################"
echo "#                               #"
echo "#            Systool            #"
echo "#                               #"
echo "#################################"
echo 
}

message(){
echo -e "┌[\e[32m1\e[0m] Show IP Address" 
echo -e "|[\e[32m2\e[0m] Show MAC Address"
echo -e "|[\e[32m3\e[0m] Check DNS"
echo -e "└[\e[32m0\e[0m] Exit"
}

main(){
    echo
    read -p "Choose : " option
    myip=$(hostname -I | awk 'NR == 1 {print $1}')
    mymac=$(ip link show eth0 | grep "link/ether" | awk '{print $2}')
    echo

    case $option in
    1)  echo "Your IP Address is : " $myip;;
    2)  echo "Your MAC Address is : " $mymac;;
    3)  dbanner
        dns
        dmain
        ;;
    *) echo "opps! we don't find you option : $option"
    esac

}

dbanner(){
clear
echo "#################################"
echo "#                               #"
echo "#           DNS Tool            #"
echo "#                               #"
echo "#################################"
echo 
}

dns(){
echo -e "┌[\e[32m1\e[0m] Website IP Address"
echo -e "|[\e[32m2\e[0m] Website Nameserver"
echo -e "|[\e[32m9\e[0m] Main Manu"
echo -e "└[\e[32m0\e[0m] Exit"
}

dmain(){
    echo
    read -p "Choose : " doption

    case $doption in
    1)  read -p "Enter your website URL : " site
        iping=$(ping -c 2 $site | grep "64 bytes from" | awk 'NR == 2 {print $5}' | tr -d '():')
        echo
        echo "Your website ($site) IP Address is : " $iping
    ;;
    2)  read -p "Enter your website URL : " ns
        nserver=$(dig +short ns $ns)
        echo
        echo -e "Your website ($ns) Nameserver is : \n\n$nserver"
    ;;
    9)  banner
        message
        main
    ;;
    *) echo "opps! we don't find you option : $doption"
    esac
}
banner
message
main
