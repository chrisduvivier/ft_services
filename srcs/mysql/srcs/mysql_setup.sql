DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db IN('test', 'test\_%');
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL PRIVILEGES ON `wordpress`.* TO 'user'@'%' IDENTIFIED BY 'pass';
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL PRIVILEGES ON `phpmyadmin`.* TO 'user'@'%' IDENTIFIED BY 'pass';

\. pma_ini.sql

\. wordpress_setup.sql

exit