# Update packages
sudo apt -y update

# Install prereq packages
sudo apt -y install wget unzip vim curl gcc openssl build-essential libgd-dev libssl-dev libapache2-mod-php php-gd php apache2

# Download Nagios Core
export VER="4.4.6"
$ curl -SL https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-$VER/nagios-$VER.tar.gz | tar -xzf -

# Install Nagios
cd nagios-4.4.6
./configure

# Compile main program
sudo make all 

# Create the group users 
sudo make install-groups-users
sudo usermod -a -G nagios www-data
sudo make install

# Run init script in /lib/systemd/system
sudo make install-init

# Install and configure permissions on the directory that contains the external command file
sudo make install-commandmode

# Install sample config files in /usr/local/nagios/etc
sudo make install-config

# Enable the Apache module required for Nagios web interface
sudo make install-webconf
sudo a2enmod rewrite cgi
sudo systemctl restart apache2

# Install the Nagios exfoliation theme as follows
sudo make install-exfoliation

# Create a Nagios login web user
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
