/* Step 1: Install the needed packages */
sudo apt-get install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules

Step 2: Add the following content to the /etc/postfix/main.cf file
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_tls_CAfile = /etc/postfix/cacert.pem
smtp_use_tls = yes

Step 3: Add the username & password of your gmail account to /etc/postfix/sasl_passwd file
[smtp.gmail.com]:587    youremail@gmail.com:Password

Step 4: Provide the necessary permissions
sudo chmod 400 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd

Step 5: Reload the configuration
sudo /etc/init.d/postfix reload

Step 6: Test it
echo "Hello World!" | mail -s "Test Mail" dummy@industryvertical.co.in

