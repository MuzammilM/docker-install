ERROR="\033[0;31m"
WARN="\033[0;33m"
SUCCESS="\033[0;32m"
DEFAULT="\033[0;37m"
reset=`tput sgr0`

#Run as sudo
sudo apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu "`lsb_release -cs`" stable" >> /etc/apt/sources.list.d/docker.list
sudo apt-get -y update
sudo apt-get install -y docker-ce=17.12.0~ce-0~ubuntu
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R
sudo service docker restart
echo -e "{WARN}Please log out and log back in to start using docker${reset}"
