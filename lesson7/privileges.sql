CREATE USER 'admin_geodata'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON geodata.* TO 'admin_geodata'@'localhost';

FLUSH PRIVILEGES;