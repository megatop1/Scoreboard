sudo apt -y update
sudo apt -y install nagios4 nagios-plugins-contrib nagios-nrpe-plugin
sudo a2enmod authz_groupfile auth_digest

mv /etc/apache2/conf-enabled/nagios4-cgi.conf /etc/apache2/conf-enabled/nagios4-cgi.conf.temp
cp nagios4-cgi.conf.correct /etc/apache2/conf-enabled/nagios4-cgi.conf

sudo systemctl restart apache2

#Configure User Account
$password = "password1!"
sudo htdigest -c /etc/nagios4/htdigest.users Nagios4 nagiosadmin
echo $password
echo $password

sudo systemctl restart apache2
