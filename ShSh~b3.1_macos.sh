#!/bin/bash
clear
date +%d-%b-%Y
echo "Hello! Today Is $today"
echo "What Would You Like To Do?"
echo "@iTrickzGG On Twitter, For Any Questions"
echo "Running "Setup" Is Obligatory For First Time"
echo "If You're An Advanced User, You May Skip Option 1"
echo "Dont Change The Name Of This Script"
echo "If Its The First Time You Run This Script, Run It From Desktop"
echo "==============================================================="
echo "[0] Setup"
echo "[1] Instructions"
echo "[2] Save SHSH Blobs For Latest"
echo "[3] Save SHSH Blobs For Specific Signed Firmware"
echo "[4] Verify Existing SHSH Blobs[64bit]"
echo "==============================================================="
read a
if [ "$a" = "0" ]
	then
echo "Welcome To The Setup!"
echo "**NEW! You No Longer Need Any Tools On Your Desktop!**"
echo "This Will Download Latest Necessary Tools"
echo "tsschecker/img4tool"
cd ~/Desktop
mkdir -p ShShb3
	function pause(){
   read -p "$*"
}
echo "Later You Will Be Presented With An Option"
echo "Type A"
pause 'Press [Enter] Key To Proceed To Installation'
echo "Initializing Installation"
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install curl
cd ~/Desktop/ShShb3
curl -OO http://api.tihmstar.net/builds/{img4tool/img4tool-latest.zip,tsschecker/tsschecker-latest.zip}
unzip \*.zip
chmod +x {*_macos,*_linux}
rm -rf resources
mv ~/Desktop/ShSh~b3_macos.sh ~/Desktop/ShShb3
cd ~/Desktop/ShShb3
rm *_linux
rm *.txt
rm *.zip
rm *.pem
rm *_windows.exe
rm LICENSE
mkdir -p ShShBlobs
echo "Saved ShSh Go Into ~/Desktop/ShShBlobs"
echo "Script Has Been Moved Into ~/Desktop/ShShBlobs"
echo "Please Do Not Modify Location Or Name Of Script Or Tools"
elif [ "$a" = "1" ]
	then
echo "Welcome To The Instructions"
echo "Learn To Find Certain Infos About Your iDevice"
echo "To Ease Your ShSh Script Experience"
function pause(){
   read -p "$*"
}
pause 'Press [Enter] key To Continue'
resize -s 34 80
echo " "
echo "[*] BuildManifest"
echo "1-Change Extension To .zip"
echo "2-Unzip [Open It]"
echo "3-You Should See A New Folder"
echo "4-Open Folder, You Should See BuildManifest"
echo " "
echo "[*] ECID"
echo "METHOD1-------------------------------->"
echo "Plug Your iDevice To Your Computer"
echo "Open iTunes"
echo "Look For [SerialNumber]"
echo "Double Click That"
echo "METHOD2-------------------------------->"
echo "[UDID Calculator]"
echo "Download Said App From Cydia"
echo "FOUND ON BIGBOSS REPO"
echo "END------------------------------------>"
echo " "
echo "[*] Model/BoardConfig"
echo "ex model : iPhone8,1"
echo "ex boardconfig : n71map"
echo "USE METHOD2/3 FOR 6S[+]"
echo "METHOD1-------------------------------->"
echo "[https://www.theiphonewiki.com/wiki/Models]"
echo "There You Should Find Your BoardConfig/Model"
echo "METHOD2-------------------------------->"
echo "[Battery Memory System Status Monitor]"
echo "Download Said App From AppStore"
echo "METHOD3-------------------------------->"
echo "[UDID Calculator]"
echo "Download Said App From Cydia"
echo "FOUND ON BIGBOSS REPO"
echo "END------------------------------------>"
if [ "$a" = "2" ]
then
cd ~/Desktop/ShShb3
echo "Let's Start"
echo "This Will Save The Latest Signed ApTicket"
function pause(){
   read -p "$*"
}
pause 'Press [Enter] key To Continue'
echo "ECID?"
read ecid
echo "Model?"
read model
echo "BoardConfig?"
read board
echo "Fetching Blobs.."
./tsschecker_macos -d "$model" --boardconfig "$board" -s -l -e "$ecid" --nocache
mv *shsh2 ~/Desktop/ShShb3/ShShBlobs
echo "SHSH BLOBS Have Been Moved To ShShBlobs"
echo "Thanks!"
elif [ "$a" = "3" ]
then
cd ~/Desktop/ShShb3
echo "Let's Start"
echo "This Will Save A Specified Signed ApTicket"
function pause(){
   read -p "$*"
}
pause 'Press [Enter] key To Continue'
echo "ECID?"
read ecid1
echo "Model?"
read model1
echo "BoardConfig?"
read board1
echo "Drag BuildManifest Here [Of Firmware/Blob]"
read manifest
echo "Fetching Blobs.."
./tsschecker_macos -d $model1 --boardconfig $board1 -m $manifest -s -l -e $ecid --nocache
mv *shsh2 ~/Desktop/ShShb3/ShShBlobs
echo "SHSH BLOBS Have Been Moved To ShShBlobs"
echo "Thanks!"
elif [ "$a" = "4" ]
then
cd ~/Desktop/ShShb3
echo "Let's Start"
echo "Verify ShShBlobs [64BIT ONLY]"
echo "Drag ShSh Blob Here"
read shsh
echo "Drag BuildManifest Here [Of Firmware/Blob]"
read manifest1
echo "What BoardConfig Is Associated With Blob?"
read board2
echo "Verifying ShSh Blob.."
./img4tool_macos -s $shsh -v $manifest1
read -r -p "Do You See $board2? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
	then
echo "ShSh Blob Is Valid!"
echo "@iTrickzGG For More Help"
else
echo "Not Valid.."
echo "@iTrickzGG For More Help"
fi
fi
fi