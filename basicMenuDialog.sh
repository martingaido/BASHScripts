#!/usr/bin/env bash

# Using dialog to create a menu

temp1=$(mktemp -t test1.XXXXX)
temp2=$(mktemp -t test2.XXXXX)

function diskspace {
    df -k > $temp1
    dialog --textbox $temp1 20 60
}

function whoseon {
    who > $temp1
    dialog --textbox $temp1 20 50
}

function memusage {
    
    # Uncomment this line if you're using MacOSX
    # top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/ || /Load Avg/{print}'
    
    # This like will work with GNU/Linux systems
    cat /proc/meminfo > $temp1
    dialog --textbox $temp1 20 50
}

while [ 1 ]
    do
        dialog --menu "Sys Admin Menu" 20 30 10 1
                      "Display Disk Space" 2
                      "Display Users" 3
                      "Display Memory Usage" 0
                      "Exit" 2> $temp2
    if [ $? -eq 1 ]
    then
        break
    fi

selection=$(cat $temp2)

case $selection in
    1)
        diskspace ;;
    2)
        whoseon ;;
    3)
        memusage ;;
    0)
        break ;;
    *)
        dialog --msgbox "Sorry, invalid selection" 10 30
    esac
done
rm -f $temp1 2> /dev/null
rm -f $temp2 2> /dev/null
