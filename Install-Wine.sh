echo "Adding 32-bit package support..."
sudo dpkg --add-architecture i386 
echo "Adding WineHQ repository key..."
sudo wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
echo "Adding WineHQ repository..."
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
echo "Updating package list..."
sudo apt update
echo "Adding FAudio repository key..."
wget -nc https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/Release.key
sudo apt-key add Release.key
echo "Adding FAudio repository..."
sudo add-apt-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./'
echo "Updating package list (again)..."
sudo apt update
PS3="Which branch of Wine would you like to install?: "

select opt in Wine-Stable Wine-Development Wine-Staging; do

case $opt in
Wine-Stable)
sudo apt install --install-recommends winehq-stable
;;
Wine-Development)
sudo apt install --install-recommends winehq-devel
;;
Wine-Staging)
sudo apt install --install-recommends winehq-staging
;;
*)
echo "You have selected an invalid option. Please try again."
esac
done
