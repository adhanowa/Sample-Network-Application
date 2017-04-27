#!/bin/bash

PROGNAME=`basename $0`
VERSION="Version 1.1,"

# set an infinite loop
while :
do

# exec 1> >(logger -s -t $(basename $0)) 2>&1

print_version() {
    echo "$VERSION $AUTHOR"
}

print_help() {
    print_version $PROGNAME $VERSION
    echo ""
    echo "The below parameters calculates the average per packet count per minute of received, error received, unknown received and sent"
    echo ""
    echo "Options:"
    echo ""
    echo "  --uwarning|-uw)"
    echo "    Sets a warning level for packets to unknown port received. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --ucritical|-uc)"
    echo "    Sets a critical level for packets to unknown port received. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --ewarning|-ew)"
    echo "    Sets a warning level for packet receive errors. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --ecritical|-ec)"
    echo "    Sets a critical level for packet receive errors. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --rwarning|-rw)"
    echo "    Sets an upper warning level for packet received. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --rcritical|-rc)"
    echo "    Sets an upper critical level for packet received. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --lrwarning|-lrw)"
    echo "    Sets a lower warning level for packet received. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --lrcritical|-lrc)"
    echo "    Sets a lower critical level for packet received. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --swarning|-sw)"
    echo "    Sets an upper warning level for packet sent. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --scritical|-sc)"
    echo "    Sets an upper critical level for packet sent. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --lswarning|-lsw)"
    echo "    Sets a lower warning level for packet sent. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  --lscritical|-lsc)"
    echo "    Sets a lower critical level for packet sent. Default is: 0"
    echo "    The unit is packets/min"
    echo ""
    echo "  -- USAGE --"
    echo ""
    echo "    When prompted, enter your desired thresholds: -ec 100 -sc 100 -uc 100 "
    echo ""
}

print_menu() {
	clear
        # display menu
        echo "Server Name - $(hostname)"
        echo ""
    echo "     TCP / UDP Monitor         "
	echo "-------------------------------"
	echo "     M A I N - M E N U"
	echo "-------------------------------"
	echo "1. Print Help for Setting Monitor Thresholds"
	echo "2. Sockets Summary"
	echo "3. Start local web server for storing and viewing critical"
	echo "   alerts. Records can be retreived via HTTP methods GET/POST"
	echo "4. Display All TCP Sockets"
	echo "5. Display All UDP Sockets"
	echo "6. Monitor TCP Sockets with Critical Alerting (Send & Receive)"
	echo "7. Monitor UDP Sockets with Critical Alerting (Send & Receive)"
	echo "8. Link to WebServer"
	echo "9. Exit"
        # get input from the user
	read -p "Enter your choice [ 1 - 9 ] " choice
        # make decision using case..in..esac
	case $choice in
		1)
			echo "Print Help for Setting Monitor Thresholds"
			print_help
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		2)
			ss -s
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		3)
			echo "Start web server to store critical alerts"
			./web_server_store_json.py
			# watch -n1 ss -atn | tee ss_tcp_output.csv
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		4)
			watch -n1 ss -atn | tee ss_tcp_output.csv
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		5)
			watch -n1 ss -aun | tee ss_udp_output.csv
			#watch -n1 'ss -aun' | tee ss_udp_output.csv
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		6)
            echo ""
		    echo "Enter Critical thresholds for TCP Queues (See 'Help' for more info). Default: 0 "
		    echo "Example -ec 100 -sc 100. See 'Help' for more info. "
		    read prammies1
			echo "You entered $prammies1 "
			# watch -n2 "cd ~/PycharmProjects/tcp-udp-sockets-monitor/scripts/ && ./check_tcp_stats.sh $prammies1 "
			watch -n2 "./check_tcp_stats.sh $prammies1 "
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		7)
			echo ""
		    echo "Enter Critical thresholds for UDP Queues (See 'Help' for more info). Default: 0 "
		    echo "Example -ec 100 -sc 100. See 'Help' for more info. "
		    read prammies2
			echo "You entered $prammies2 "
			# watch -n2 "cd ~/PycharmProjects/tcp-udp-sockets-monitor/scripts/ && ./check_udp_stats.sh $prammies2 "
			watch -n2 "./check_udp_stats.sh $prammies2 "
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		8)
			echo "Link to webserver coming soon"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		9)
			echo "This software is free to use; however if you use it for commercial purposes, you will"
			echo "owe Avi One Billion Dollars."
			echo "Have a great day!"
			exit 0
			;;
		*)
			echo "Error: Invalid option..."
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
    esac

}

print_menu

 done
