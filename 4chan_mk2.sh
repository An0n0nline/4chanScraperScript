#!/bin/bash

clear

# Function to display header
header() {
  tput setaf 115; echo -n "///// "; tput setaf 219; echo -n "4CHAN SEARCH "; tput setaf 115; echo "///// "
  echo
}

# Function to handle single scan
single_scan() {
  clear
  header
  tput setaf 11; echo "SINGLE SCAN"
  tput setaf 9; echo "TYPE 'NULL' FOR EMPTY SEARCHES"
  echo "OTHERWISE YOU WILL RECEIVE FULL PAGE RETURNS"
  tput setaf 14; echo "===============BOARD SELECTION===============";
  tput setaf 15; read -r -p "ENTER BOARD (EXAMPLE: B): " board1
  tput setaf 14; echo "=============================================";
  echo

  echo "===============SEARCH TERMS (4)==============";
  tput setaf 15; read -r -p "ENTER IN SEARCH TERM 1: " term1
  read -r -p "ENTER IN SEARCH TERM 2: " term2
  read -r -p "ENTER IN SEARCH TERM 3: " term3
  read -r -p "ENTER IN SEARCH TERM 4: " term4
  tput setaf 14; echo "=============================================";
  echo

  for page in 0 1 2 3 4 5 6 7 8 9 10
  do
    echo "SCANNING 4CHAN.ORG/$board1/$page" | lolcat -a -s 999
    echo "NUMBER OF MENTIONS:";
    w3m boards.4chan.org/$board1/$page | grep -i -E --color=always "$term1|$term2|$term3|$term4" -c
    w3m boards.4chan.org/$board1/$page | grep -i -E --color=always "$term1|$term2|$term3|$term4"
    echo
  done

  tput setaf 9; echo "SCAN COMPLETE"
  tput setaf 11; echo -n "TIMESTAMP: "; date
  echo "============================================================"; tput setaf 15

  read -p "WOULD YOU LIKE TO RETURN TO THE MENU? (y/n): " ANSWER
  if [ "$ANSWER" = y ]; then
    bash ./4chan.sh
  fi
}

# Function to handle persistent scan
persistent_scan() {
  clear
  header
  tput setaf 11; echo "PER PAGE BOARD SEARCH + PERSISTENT SCAN"
  tput setaf 9; echo "TYPE 'NULL' FOR EMPTY SEARCHES"
  echo "OTHERWISE YOU WILL RECEIVE FULL PAGE RETURNS"
  tput setaf 14; echo "===============BOARD SELECTION===============";
  tput setaf 15; read -r -p "ENTER BOARD (EXAMPLE: B): " board1
  tput setaf 14; echo "=============================================";
  echo

  echo "===============SEARCH TERMS (4)==============";
  tput setaf 15; read -r -p "ENTER IN SEARCH TERM 1: " term1
  read -r -p "ENTER IN SEARCH TERM 2: " term2
  read -r -p "ENTER IN SEARCH TERM 3: " term3
  read -r -p "ENTER IN SEARCH TERM 4: " term4
  tput setaf 14; echo "=============================================";
  echo

  echo "==============PERSISTANT SEARCH==============";
  tput setaf 15; read -r -p "ENTER IN DELAY FOR REPEAT+LOG (SECONDS): " seconds1
  tput setaf 14; echo "=============================================";
  echo

  while true; do
    for page in 0 1 2 3 4 5 6 7 8 9 10
    do
      echo "SCANNING 4CHAN.ORG/$board1/$page" | lolcat -a -s 999
      echo "NUMBER OF MENTIONS:";
      w3m boards.4chan.org/$board1/$page | grep -i -E --color=always "$term1|$term2|$term3|$term4" -c
      w3m boards.4chan.org/$board1/$page | grep -i -E --color=always "$term1|$term2|$term3|$term4"
      echo
    done

    tput setaf 9; echo "SCAN COMPLETE"
    tput setaf 11; echo -n "TIMESTAMP: "; date
    echo "============================================================"; tput setaf 15
    tput setaf 15; echo "SEARCH WILL REPEAT IN $seconds1 SECONDS"
    tput setaf 14; echo "//////////////////////////////////////////////"
    sleep $seconds1
  done
}

# Function to handle end scan page visit
end_scan_page_visit() {
  clear
  header
  tput setaf 11; echo "PER PAGE BOARD SEARCH + END SCAN PAGE VISIT"
  tput setaf 9; echo "TYPE 'NULL' FOR EMPTY SEARCHES"
  echo "OTHERWISE YOU WILL RECEIVE FULL PAGE RETURNS"
  tput setaf 14; echo "===============BOARD SELECTION===============";
  tput setaf 15; read -r -p "ENTER BOARD (EXAMPLE: B): " board1
  tput setaf 14; echo "=============================================";
  echo

  echo "===============SEARCH TERMS (4)==============";
  tput setaf 15; read -r -p "ENTER IN SEARCH TERM 1: " term1
  read -r -p "ENTER IN SEARCH TERM 2: " term2
  read -r -p "ENTER IN SEARCH TERM 3: " term3
  read -r -p "ENTER IN SEARCH TERM 4: " term4
  tput setaf 14; echo "=============================================";
  echo

  for page in 0 1 2 3 4 5 6 7 8 9 10
  do
    echo "SCANNING 4CHAN.ORG/$board1/$page" | lolcat -a -s 999
    echo "NUMBER OF MENTIONS:";
    w3m boards.4chan.org/$board1/$page | grep -i -E --color=always "$term1|$term2|$term3|$term4" -c
    w3m boards.4chan.org/$board1/$page | grep -i -E --color=always "$term1|$term2|$term3|$term4"
    echo
  done

  tput setaf 9; echo "SCAN COMPLETE"
  tput setaf 11; echo -n "TIMESTAMP: "; date
  echo "============================================================"; tput setaf 15

  tput setaf 14; echo "================ENTER IN PAGE================";
  tput setaf 15; read -r -p "PAGE TO VISIT (ENTER DEFAULT PAGE ["1"]): " page1
  tput setaf 14; echo "=============================================";
  w3m boards.4chan.org/$board1/$page1
}

# Main menu
header
read -r -p "SELECT (1) SINGLE SCAN (2) PERSISTENT SCAN (3) END SCAN PAGE VISIT: " selection1
echo

case $selection1 in
  1) single_scan ;;
  2) persistent_scan ;;
  3) end_scan_page_visit ;;
  *) echo "Invalid selection";;
esac
