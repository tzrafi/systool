#!/bin/bash
#
#------------------
# systool
# By Tz Rafi
#------------------
#
counter(){
    one="┌[\e[32m1\e[0m]"
    two="|[\e[32m2\e[0m]"
    three="|[\e[32m3\e[0m]"
    four="|[\e[32m4\e[0m]"
    five="|[\e[32m5\e[0m]"
    six="|[\e[32m6\e[0m]"
    seven="|[\e[32m7\e[0m]"
    eight="|[\e[32m8\e[0m]"
    nine="|[\e[32m9\e[0m]"
    zero="└[\e[32m0\e[0m]"
}

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
    counter
    echo -e "$one Show IP Address" 
    echo -e "$two Show MAC Address"
    echo -e "$three Check DNS"
    echo -e "$zero Exit"
}

main(){
    banner
    message
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
    0) clear && exit 1 ;;
    *) echo "opps! we don't find you option : $option";;
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
counter
echo -e "$one Website IP Address"
echo -e "$two Website Nameserver"
echo -e "$nine Main Manu"
echo -e "$zero Exit"
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
    0) clear && exit 1 ;;
    *) echo "opps! we don't find you option : $doption"
    esac
}
banner
message
main
