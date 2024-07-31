# PHP-Apache-MySQL Docker Environment

This repository contains a Docker Compose setup for a PHP-Apache-MySQL environment.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/andrescdo/php-apache-mysql-docker.git
cd php-apache-mysql-docker
```

### Build and Start the Containers

```bash
docker-compose up -d
```

### Access the Application

- PHP-Apache [http://localhost:8080](http://localhost:8080).
- MySQL [http://localhost:8081](http://localhost:8081).

## Configuration

### PHP-Apache

The PHP-Apache server is configured to serve files from the `src` directory. You can place your PHP files in this directory.

### MySQL

The MySQL configuration file is located in ./mysql/my.conf. You can change the configuration in this file. 
The MySQL server is configured with the following environment variables:

- `MYSQL_ROOT_PASSWORD`: The password for the `root` user.
- `MYSQL_DATABASE`: The name of the default database.
- `MYSQL_USER`: The name of the default user.
- `MYSQL_PASSWORD`: The password for the default user.

You can change these values in the `docker-compose.yml` file.

## Cleanin Up

To stop and remove the containers, run the following command:

```bash
docker-compose down
```

To remove the MySQL data, run the following command:

```bash
rm -rf mysql/data
```

## License

This project is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
