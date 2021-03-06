sudo apt -y update
sudo apt -y install nagios4 nagios-plugins-contrib nagios-nrpe-plugin
sudo a2enmod authz_groupfile auth_digest

mv /etc/apache2/conf-enabled/nagios4-cgi.conf /etc/apache2/conf-enabled/nagios4-cgi.conf.temp
cp nagios4-cgi.conf.correct /etc/apache2/conf-enabled/nagios4-cgi.conf

sudo systemctl restart apache2

#Configure User Account
sudo htdigest -c /etc/nagios4/htdigest.users Nagios4 nagiosadmin

sudo systemctl restart apache2
sudo systemctl restart nagios4
sydo systemctl enable apache2
sudo systemctl enable nagios4
