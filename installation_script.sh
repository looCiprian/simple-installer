#installation script

function main() {
  verifyRoot
  checkMinimalInstallation
  menu
}

function menu() {
  clear
  echo "MENU"
  echo "1. Install aircrack"
  echo "2. List user"
  echo "3. Install nmap"
  echo "4. Add user"
  echo "5. Install transmission"
  echo "6. Install FTP server" #apt-get install proftpd /etc/proftpd/proftpd.conf
  echo "7. Install VPN" #wget https://raw.githubusercontent.com/Angristan/OpenVPN-install/master/openvpn-install.sh
  echo "8. Download sqlmap"
  echo "9. Install curl"
  echo "10. Install wget"
  echo "11. Install wireshark"
  echo "12. Install apache2"
  echo "13. Install netdata"
  echo "14. Install hostapd"
  echo "15. get my public IP"
  echo "99. Exit"
  read choice


  case "$choice" in

  1)  aircrackF
      ;;
  2)  users
      ;;
  3)  nmap
      ;;
  4)  addUser
      ;;
  5)  transmission
      ;;
  6)  ftpF
      ;;
  7)  echo  "VPN"
      ;;
  8)  sqlmap
      ;;
  9)  curlF
      ;;
  10) wget
      ;;
  11) wireshark
      ;;
  12) apache2
      ;;
  13) netdata
      ;;
  14) hostapd
      ;;
  15) publicIp
      ;;
  99) clear
      exit
      ;;
  *) menu
     ;;
  esac
}

function verifyRoot() {
  # Verify root
  if [[ "$EUID" -ne 0 ]]; then
    echo "Sorry, you need to run this as root"
    exit 1
  fi
}

# aspetta finchè non si preme un tasto
function wasteTime() {
  echo "Press enter to continue"
  read untime
  menu
}

function publicIp() {
  clear
  echo "Your public IP: "
  curl ifconfig.co
  wasteTime
}

# install aircrack
function aircrackF() {
  clear
  echo "Install aircrack [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing aircrack..."
   sleep 2
   # sudo apt-get install aircrack-ng
   wasteTime
  else
    menu
  fi
}

# list user
function users() {
  clear
  #Listing user
  cut -d : -f1 /etc/passwd
  wasteTime
}

# install aircrack
function nmap() {
  clear
  echo "Install nmap [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing nmap..."
   sleep 2
   # sudo apt-get install nmap
   wasteTime
  else
    menu
  fi
}

# add user
function addUser() {
  clear
  echo "User to add: "
  read userName
  #adduser userdd -m $userName
  echo "Username $userName added"
  wasteTime
}

# install transmission
function transmission() {
  clear
  echo "Install transmission [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing transmission..."
   sleep 2
   # sudo apt-get install transmission-daemon
   wasteTime
  else
    menu
  fi
}

# install ftp
function ftpF() {
  clear
  echo "Install ftp [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing ftp..."
   sleep 2
   # sudo apt-get install proftpd
   echo "Config file at /etc/proftpd/proftpd.conf"
   wasteTime
  else
    menu
  fi
}

# download sqlmap
function sqlmap() {
  clear
  echo "Download sqlmap [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
    if checkGit == 0
    then
       echo "Downloading sqlmap from github..."
       sleep 2
       # git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
       wasteTime
    else
      echo "Need to install git before"
      wasteTime
    fi

  else
    menu
  fi

}

# install curl
function curlF() {
  clear
  echo "Install curl [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing curl..."
   sleep 2
   # sudo apt-get install curl
   wasteTime
  else
    menu
  fi
}

# install wget
function wget() {
  clear
  echo "Install wget [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing wget..."
   sleep 2
   # sudo apt-get install wget
   wasteTime
  else
    menu
  fi
}

# install wireshark
function wireshark() {
  clear
  echo "Install wireshark [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
    echo "Adding ppa:wireshark-dev/stable repository and update..."
    sleep 2
   # sudo add-apt-repository ppa:wireshark-dev/stable
   # sudo apt-get update
    echo "Installing wireshark..."
    sleep 2
   # sudo apt-get install wireshark
   wasteTime
  else
    menu
  fi
}

# install apache2
function apache2() {
  clear
  echo "Install apache2 [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing apache2..."
   sleep 2
   # sudo apt-get install apache2
   # sudo apt-get install php libapache2-mod-php
   wasteTime
  else
    menu
  fi
}

# install netdata
function netdata() {
  clear
  echo "Install netdata [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing netdata..."
   sleep 2
     # bash <(curl -Ss https://my-netdata.io/kickstart.sh)
   wasteTime
  else
    menu
  fi
}

# install hostapd
function hostapd() {
  clear
  echo "Install hostapd [s/N]"
  read choice1
  if [ "$choice1" == "s" ] || [ "$choice1" == "S" ]
  then
   echo "Installing hostapd..."
   sleep 2
     # sudo apt-get install hostapd
   wasteTime
  else
    menu
  fi
}

# check git installation
function checkGit() {
  if hash git 2>/dev/null; then
    return 0
  else
    return 1
  fi
}

# check git installation
function checkWget() {
  if hash wget 2>/dev/null; then
    return 0
  else
    return 1
  fi
}

# check git installation
function checkCurl() {
  if hash curl 2>/dev/null; then
    return 0
  else
    return 1
  fi
}


# checking minimal installation for git, wget, curl
function checkMinimalInstallation() {


  if checkGit == 0
  then
    echo "[OK] git"
  else
    echo "[NOT OK] git"
  fi
  sleep 1
  if checkCurl == 0
  then
    echo "[OK] curl"
  else
    echo "[NOT OK] curl"
  fi
  sleep 1

  if checkWget == 0
  then
    echo "[OK] wget"
  else
    echo "[NOT OK] wget"
  fi
  wasteTime

}

main
