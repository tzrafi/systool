#!/bin/bash

banner(){
clear
echo "#################################"
echo "#                               #"
echo "#            Systool            #"
echo "#                               #"
echo "#################################"
echo 
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
echo "Enter 1 to Check Website IP Address"
echo "Enter 2 to Check Website Nameserver"
echo "Enter 9 to Main Manu"
echo "Enter 0 to Exit"
}
message(){
echo "Enter 1 to Show IP Address"
echo "Enter 2 to Show MAC Address"
echo "Enter 3 to Check DNS"
echo "Enter 0 to Exit"
}
dmain(){
    echo
    read -p "Enter your Option : " doption

    case $doption in
    1)  read -p "Enter your website URL : " site
        echo
        echo "Your website ($site) IP Address is : " $(ping -c 2 $site | grep "64 bytes from" | awk 'NR == 2 {print $5}' | tr -d '():')
    ;;
    2)  read -p "Enter your website URL : " ns
        echo
        echo -e "Your website ($ns) Nameserver is : \n\n$(dig +short ns $ns)"
    ;;
    9)  banner
        message
        main
    ;;
    *) echo "opps! we don't find you option : $doption"
    esac
}
main(){
    echo
    read -p "Enter your Option : " option
    echo

    case $option in
    1)  echo "Your IP Address is : " $(hostname -I | awk 'NR == 1 {print $1}');;
    2)  echo "Your MAC Address is : " $(ip link show eth0 | grep "link/ether" | awk '{print $2}');;
    3)  dbanner
        dns
        dmain
        ;;
    *) echo "opps! we don't find you option : $option"
    esac

}
banner
message
main
