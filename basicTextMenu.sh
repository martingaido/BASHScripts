#!/usr/bin/env bash

# Simple Script Menu

function diskspace {
    clear
    df -k
}

function whoseon {
    clear
    who
}

function memusage {
    clear
    cat /proc/meminfo

    # Uncomment this like if you're using MacOSX
    # top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'
}

function menu {
    clear
    echo
    echo -e "\t\t\tSys Admin Menu\n"
    echo -e "\t1. Display Disk Space"
    echo -e "\t2. Display Loggued On Users"
    echo -e "\t3. Display Memory Usage"
    echo -e "\t0. Exit Menu\n\n"
    echo -en "\t\tEnter Option: "
    read -n 1 option
}

while [ 1 ]
do
    menu
    case $option in
        0)
            break ;;
        1)
            diskspace ;;
        2)
            whoseon ;;
        3)
            memusage ;;
        *)
            clear
            echo "Sorry, wrong selection";;
    esac
    echo -en "\n\n\t\t\tHit any key to continue"
    read -n 1 line
done
clear
