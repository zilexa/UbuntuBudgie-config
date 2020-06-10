#!/bin/bash
#
# Run this script with sudo -E, otherwise $HOME points to /root instead of /home/username
# After running this script a new env variable $USERHOME is available for sudo to use instead of -E
#
# Create a system-wide environmental variable that will always point to the home folder of the logged in user
# Useful since Ubuntu 19.10 to have an env when using sudo that points to /home/username instead of /root.
sh -c "echo USERHOME=/home/$SUDO_USER >> /etc/environment"
#_________________________________
# Get separators for Plank or Dock
# --------------------------------
# Get a seperator-like app icon
sudo wget --no-check-certificate -P /usr/share/icons https://github.com/zilexa/UB-PostInstall/blob/master/separators/separatorH.svg
# Get a seperator-like app shortcut
wget --no-check-certificate -P $HOME/.local/share/applications https://raw.githubusercontent.com/zilexa/UB-PostInstall/master/separators/SeparatorH1.desktop
#
#______________________________________
# Get a Firefox shortcut for 2 profiles
# -------------------------------------
wget --no-check-certificate -P $HOME/.local/share/applications https://raw.githubusercontent.com/zilexa/UB-PostInstall/master/firefox.desktop
#
#________________________________
# Budgie Desktop Settings
# -------------------------------
# Dark mode
gsettings set com.solus-project.budgie-panel dark-theme true
#
# Theme with clearer icons
gsettings set org.gnome.desktop.interface icon-theme 'ubuntu-mono-dark'
#
# close/minimise/maximise buttons on the left side (more common)
gsettings set com.solus-project.budgie-wm button-style 'left'
#
# Panel left side, size 53 (=treshold for bigger app icons)
#
# folders always list view instead of big icon view
gsettings set org.nemo.preferences default-folder-viewer 'list-view'
#
# disable doubleclick empty area to go up 1 folder
gsettings set org.nemo.preferences click-double-parent-folder false
#
# week numbers in Raven calendar
gsettings set com.solus-project.budgie-raven enable-week-numbers true
#
# show reload folder button
gsettings set org.nemo.preferences show-reload-icon-toolbar true
#
# get brightness, volume etc buttons on laptop keyboard to work
gsettings set org.onboard layout '/usr/share/onboard/layouts/Full Keyboard.onboard'

#________________________________
# AppImageLauncher - integrate AppImage apps on first execution
# -------------------------------
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher

#________________________________
# MS Office fonts
# -------------------------------
wget --no-check-certificate https://raw.githubusercontent.com/zilexa/Mediaserver/master/officefonts.sh
sudo bash officefonts.sh
wait
rm officefonts.sh
exit 0
#________________________________
# LibreOffice Dutch UI/Spellcheck/Hyphencheck/Help
# -------------------------------
sudo apt-add-repository ppa:libreoffice/ppa
sudo apt update
sudo apt-get install libreoffice-l10n-nl hunspell-nl hyphen-nl libreoffice-help-nl

#________________________________
# Timeshift - automated system snapshots (backups) 
# -------------------------------
sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt update
sudo apt-get install timeshift

#________________________________
# Pluma - better simple notepad 
# -------------------------------
sudo apt-get install pluma

#________________________________
# VLC - better videoplayer
# -------------------------------
sudo apt-get install vlc

#________________________________
# Recommended apps to install manually
# -------------------------------
echo -e "\n\nPlease install the following recommended apps by downloading them manually:\n"
echo -e "BLEACHBIT (cleanup) \t https://www.bleachbit.org/download/linux"
echo -e "NOMACHINE (share desktop within local network) \t https://www.nomachine.com/download/download&id=4"
echo -e "ANYDESK (remote desktop via internet) \t https://anydesk.com/en/downloads/linux"
echo -e "DIGIKAM (photo management) \t https://www.digikam.org/download/"
echo -e "RAWTHERAPEE ART (raw photo editor) \t https://bitbucket.org/agriggio/art/downloads/"


