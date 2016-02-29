<?php 
$link = mysql_connect($_SERVER['MYSQL_HOST'],$_SERVER['MYSQL_USER'],$_SERVER['MYSQL_PASSWORD']);
        if ($link)
                echo "Success...";
        else
                echo "Failure...";

        mysql_close();
phpinfo(); 
?>
