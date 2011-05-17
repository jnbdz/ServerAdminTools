if [ "$1" = "5" ]; then

mkdir /var/www/$2

cp -r /var/frameworks/kohana/application /var/www/$2/application

echo "<?php include_once('base.php');" > /var/www/$2/index.php

echo "<VirtualHost $2:80>\n ServerName $2\n ServerAlias www.$2\n ServerAdmin $3\n DocumentRoot /var/www/$2\n</VirtualHost>" > /etc/apache2/sites-available/$2

ln -s /etc/apache2/sites-available/$2 /etc/apache2/sites-enabled/

/etc/init.d/apache2 restart

echo 'Success!!!';

else

echo "I just shite my pants!!!";

fi
