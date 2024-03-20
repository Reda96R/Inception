<br>
<div align="center">
  <a href="https://github.com/Reda96R/Inception">
    <img src="https://raw.githubusercontent.com/Reda96R/NetPractice/main/images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h1 align="center">::: Inception_42 :::</h1>
</div>
`This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.`

![Inception](https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/1076e1f8-f0bd-43cb-ad02-775ee714a2c1/dfhw90h-473d540f-50f6-4c57-8e8b-5946d055112d.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzEwNzZlMWY4LWYwYmQtNDNjYi1hZDAyLTc3NWVlNzE0YTJjMVwvZGZodzkwaC00NzNkNTQwZi01MGY2LTRjNTctOGU4Yi01OTQ2ZDA1NTExMmQuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.B-pKCscLC4BRc3UNm69G9GC6pxakPUQP5pwA6UUQaY0)

# Table of Contents
1. [Project Overview](#project-overview)
2. [Background Theory](#background-theory)
   1. [Containerization](#containerization)
   2. [Docker](#docker)
	   1. [How does Docker work](###how-does-docker-work)
3. [Making the project](#making-the-project)
   1. [Making the Containers](#making-the-containers)
	   1. [Nginx](###nginx)
	   2. [Mariadb](###mariadb)
	   3. [Wordpress](###wordpress)
4. [Acknowledgement](#acknowledgement)
5. [Resources](#resources)

# Project Overview:
This project is intended to learn about the concept of **Containerization** and why we need it, also Gain practical experience in Docker image creation, management, and deployment.
# Background theory:

![It works on my machine ¯\_(ツ)_/¯](https://i.imgflip.com/5hcaq2.jpg)

Let's imagine this story, After months of burning the midnight oil, you crafted a masterpiece of an application: a sleek, intuitive, and downright revolutionary tool that promised to change the way people interacted with technology.  With a triumphant click of the "Deploy" button, you sent your creation out into the world, confident in its ability to dazzle and delight. but soon enough, Reports started pouring in of crashes, glitches, and inexplicable errors, Panicked, you dove headfirst into the code, scouring every line for clues as to what had gone wrong. Hours turned into days, and days turned into weeks, but the elusive bug remained elusive. at the end, It turned out that your application had been built on a fragile foundation of libraries, frameworks, and third-party services, each with its own quirks and idiosyncrasies. And when deployed to the wild, these dependencies clashed and collided like tectonic plates. 
As we bid farewell to you and your epic struggle with software deployment, it's essential to acknowledge a truth that every developer eventually faces the specter of deployment woes will visit us all at some point in our coding journeys. Whether you're a seasoned pro or just starting out on your coding adventures, and thanks to **Containerization** which has emerged as a game-changer—a transformative technology that promises to revolutionize the way we build, deploy, and manage applications. By encapsulating applications and their dependencies into lightweight, portable units called containers, But what exactly are containers, and how do they work? In the next section, we'll dive deeper into the world of containerization, exploring its history, principles, and practical applications. So buckle up and get ready to embark on a journey into the heart of this transformative technology.
## Containerization:
Same as how shipping containers made cargo easily transported whether it be via trucks, trains or ships, containerization made apps easily moved across different environments.
in a nutshell, Containerization is a method of packaging, distributing, and running applications in lightweight, isolated environments called containers. These containers encapsulate everything an application needs to run, including its code, runtime, system tools, libraries, and settings.
> IBM: Containerization is the packaging of software code with just the operating system (OS) libraries and dependencies that are required to run the code to create a single lightweight executable—called a container—that runs consistently on any infrastructure.

There are many containerization thechnologies out there such as **[Podman](https://podman.io/)**,**[LXC](https://linuxcontainers.org/)**, **[**OpenVZ**](https://openvz.org/)** and many others, each with its own features and capabilities. but for us we're going to focus on the most popular one : **[Docker](https://www.docker.com/)**.

![kubernetes](https://media.licdn.com/dms/image/D4E10AQHEc7bZebbfOQ/image-shrink_800/0/1699883119851?e=2147483647&v=beta&t=VyjRBnpwpnmxbDL78gI7BiGfl57hTrn-tDBd4yuoq-8)

## Docker:
> Wikipedia: **Docker** is a set of [platform as a service](https://en.wikipedia.org/wiki/Platform_as_a_service "Platform as a service") (PaaS) products that use [OS-level virtualization](https://en.wikipedia.org/wiki/OS-level_virtualization "OS-level virtualization") to deliver software in packages called _[containers](https://en.wikipedia.org/wiki/Container_(virtualization) "Container (virtualization)")_.[[4]](https://en.wikipedia.org/wiki/Docker_(software)#cite_note-SYS-CON_Media-4) The service has both free and premium tiers. The software that hosts the containers is called **Docker Engine**.[[5]](https://en.wikipedia.org/wiki/Docker_(software)#cite_note-what-is-a-container-5) It was first released in 2013 and is developed by [Docker, Inc](https://en.wikipedia.org/wiki/Docker,_Inc. "Docker, Inc.")
### How does Docker work:
Docker is basically running on top of a host machine, and it is sharing the kernel of that machine with the containers, providing isolated processes in their own user space.

You might notice something weird here, if we need an isolated environment with a separate Os from the Host's, why on earth would we chose a dang container over a something that we already know, which is virtualization?
### Containerization vs Virtualization:
We had a glimps on virtualization in a previous [project](https://github.com/Reda96R/Born2beroot), and we saw how we can create a totally separate environment using a virtual machine, but why using a container, in order to spot the difference between those two, let's have a look on how each one of them work,

# Making the project:
The Project consists of mainly three parts, the first being the making of each of the services's container, then we need to make the volumes for these services, and the last step is to make a docker network to establish a connection between our services, the following diagram represents the intended project structure,

//Diagram

Now it is time to start making our Docker containers.
## Making the Containers:

![Inception](https://drivendata.co/images/one-container-is-not-enough.jpg)

In order to create our container, we need a Docker image, this is simply a blueprint for Docker containers, They contain everything needed to run a container and the instructions for creating one, including the application code, runtime, libraries, dependencies, and system tools, where can we find this docker image? you might ask, I have two answers for this question, the first being [Docker Hub](https://hub.docker.com/), which is a cloud registry service, from which users can deploy containers and test and share images, a sort of an image store like app store for example, where we can find images for a lot of different containers, the second is **Dockerfile** which is text file containing instructions for building the image, It specifies the base image, sets the working directory, copies files into the image, installs dependencies, and defines the command to run when the container starts, and this makes the images typically layered, meaning each instruction in the Dockerfile creates a new layer in the image. This makes images lightweight and easy to share and distribute, in our project we're going to rely on Dockerfiles to create our own images.
Here's a simple example of a Dockerfile for a Python web application using Flask:
```
# Use an official Python runtime as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
```

To keep things simple and focused on getting started, I won't delve into the details of each Dockerfile command. If you're curious about the commands used in the Dockerfile, you can find comprehensive documentation and tutorials on the Docker [website](https://docs.docker.com/reference/dockerfile/). This will provide you with a deeper understanding of how Dockerfiles work and how to customize them for your specific needs.
### Nginx:
**[NGINX](https://www.nginx.com/)** is a popular web server software that is used to serve web pages and applications over the internet. It's known for its high performance, stability, and scalability, think of it as a traffic cop directing vehicles on a busy intersection. Just as the traffic cop efficiently manages the flow of cars, NGINX efficiently manages the flow of internet traffic to websites and applications. It ensures that incoming requests are directed to the appropriate destination, balances the load evenly across multiple servers, and helps optimize the performance of web services, much like how a traffic cop keeps traffic moving smoothly and prevents congestion, you check this [tutorial](https://www.hostinger.com/tutorials/what-is-nginx) to get you around Nginx and how it works.
let's create the Dockerfile for out Nginx container, first we need to build our container on top of the penultimate stable version of Alpine or Debian, I'm just gonna go with Debian, and since the latest version of Debian as of time writing this article is Debian 12 (bookworm), we are going to install Debian 11 (bullseye),
```dockerfile
FROM debian:bullseye
```
the `FROM` instruction is typically the first instruction in a Dockerfile, It specifies the base image that will be used to build the new image, which in our case the image of Debian,
>Docker will first check if it has the `debian:bullseye` image locally. If it doesn't find it locally, Docker will then attempt to pull the `debian:bullseye` image from the Docker Hub registry. and this is the only exception where we're allowed to utilize the Docker hub.

After setting up the base image, now we need to install the tools that we need and to do that we're going to use `RUN` which is used to execute commands during the build process of the Docker image,
```dockerfile
FROM debian:bullseye
RUN apt -y update && apt -y install vim && apt -y install curl
RUN apt -y install nginx && apt -y install openssl
```
>We need Openssl in order to configure our Nginx server with TLSv1.2 or TLSv1.3

At this point, we can already run our container by running `docker build -t nginx .` in the same directory as our Dockerfile, this will build our image, then type `docker run -it nginx` to run, and we will be prompted by the terminal of the system inside of the container. 
The next thing we need to do is to create our SSL certification which is in short a digital certificate that authenticates a website’s identity and enables an encrypted connection between the client(browser) and the server(in our case Nginx), I highly recommend you to go visit this [guide](https://blog.hubspot.com/marketing/what-is-ssl) to know more,

```dockerfile
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/private.key -subj "/C=MA/ST=MA/L=Benguerir/O=42/OU=1337/CN=rerayyad.42.fr/UID=rerayyad"
```
I know this looks ugly, but don't worry I'm gonna explain everything,
- `openssl`: This is the command-line tool for OpenSSL, a cryptographic toolkit.
    
- `req`: This subcommand of OpenSSL is used to process certificate requests.
    
- `-x509`: This option tells OpenSSL to generate a self-signed certificate instead of a certificate request.
    
- `-nodes`: This option tells OpenSSL to create a certificate without encrypting the private key with a passphrase. This is useful so we don't have to manually enter a passphrase.
    
- `-out /etc/nginx/ssl/certificate.crt`: This specifies the path and filename of the output file where the SSL certificate will be saved. In this case, it's saving the certificate to `/etc/nginx/ssl/certificate.crt` within the Docker image.
    
- `-keyout /etc/nginx/ssl/private.key`: This specifies the path and filename of the output file where the private key will be saved. In this case, it's saving the private key to `/etc/nginx/ssl/private.key` within the Docker image.
    
- `-subj "/C=MA/ST=MA/L=Benguerir/O=42/OU=1337/CN=rerayyad.42.fr/UID=rerayyad"`: This specifies the subject of the certificate, which includes various pieces of information like the country (C), state (ST), location (L), organization (O), organizational unit (OU), common name (CN), and user ID (UID). These are often used for identifying the entity that the certificate represents.
So, altogether, this `RUN` instruction generates a self-signed SSL certificate and private key with the specified subject and saves them to the `/etc/nginx/ssl/` directory within the Docker image. These files can then be used to configure our Nginx to serve HTTPS traffic with SSL encryption.
I forgot to create the directory where we'll save our key and certificate, so before generating them we simply gonna create `/etc/nginx/ssl`, and our Dockerfile will be like this:
```dockerfile
FROM debian:bullseye
RUN apt -y update && apt -y install vim && apt -y install curl
RUN apt -y install nginx && apt -y install openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/private.key -subj "/C=MA/ST=MA/L=Benguerir/O=42/OU=1337/CN=rerayyad.42.fr/UID=rerayyad"
```

Now that we have our certificate, it is time to configure Nginx to use this certificate and serve Https traffic.
to configure Nginx we need to modify `/etc/nginx/nginx.conf`, so let's go had and have a look at it,
```bash
user       www www;  ## Default: nobody
worker_processes  5;  ## Default: 1
error_log  logs/error.log;
pid        logs/nginx.pid;
worker_rlimit_nofile 8192;

events {
  worker_connections  4096;  ## Default: 1024
}

http {
  include    conf/mime.types;
  include    /etc/nginx/proxy.conf;
  include    /etc/nginx/fastcgi.conf;
  index    index.html index.htm index.php;

  default_type application/octet-stream;
  log_format   main '$remote_addr - $remote_user [$time_local]  $status '
    '"$request" $body_bytes_sent "$http_referer" '
    '"$http_user_agent" "$http_x_forwarded_for"';
  access_log   logs/access.log  main;
  sendfile     on;
  tcp_nopush   on;
  server_names_hash_bucket_size 128; # this seems to be required for some vhosts

  server { # php/fastcgi
    listen       80;
    server_name  domain1.com www.domain1.com;
    access_log   logs/domain1.access.log  main;
    root         html;

    location ~ \.php$ {
      fastcgi_pass   127.0.0.1:1025;
    }
  }

  server { # simple reverse-proxy
    listen       80;
    server_name  domain2.com www.domain2.com;
    access_log   logs/domain2.access.log  main;

    # serve static files
    location ~ ^/(images|javascript|js|css|flash|media|static)/  {
      root    /var/www/virtual/big.server.com/htdocs;
      expires 30d;
    }

    # pass requests for dynamic content to rails/turbogears/zope, et al
    location / {
      proxy_pass      http://127.0.0.1:8080;
    }
  }

  upstream big_server_com {
    server 127.0.0.3:8000 weight=5;
    server 127.0.0.3:8001 weight=5;
    server 192.168.0.1:8000;
    server 192.168.0.1:8001;
  }

  server { # simple load balancing
    listen          80;
    server_name     big.server.com;
    access_log      logs/big.server.access.log main;

    location / {
      proxy_pass      http://big_server_com;
    }
  }
}
```

![config](https://media.giphy.com/media/3XR0chfiSTtAI/giphy.gif?cid=ecf05e4729m6fkxl3g0z6igc2i2huwne6au5t21zaoq6f3rn&ep=v1_gifs_search&rid=giphy.gif&ct=g)

**WHAT ON EARTH IS THIS?!**

This was my reaction when I first opened that file, but don't worry I got your back ;),
forget about everything up there, I want you to focus on this:
```bash
listen       80;
```
here we have a sort of a **Key** (listen) and a **Value** (80), if you notice, this pattern get repeated in many parts of that file, for example in ```
```bash
server_name     big.server.com;
```
these pairs of values and keys are called **Directives**,
you might also notice that there are blocks of code limited by curly braces,
```bash
events {
  worker_connections  4096;  ## Default: 1024
}
```
these are known as **Contexts**, and within contexts we can find directives like the example above, If you need to go deeper in Nginx I suggest watching [this crash course](https://www.youtube.com/watch?v=7VAI73roXaY) to get you on the road. To continue our work, let's configure our server,
```bash
server {
    listen              443 **ssl**;
    server_name         www.example.com;
    ssl_certificate     **www.example.com.crt**;
    ssl_certificate_key **www.example.com.key**;
    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
    ...
}
```
we're going to build upon the [example](http://nginx.org/en/docs/http/configuring_https_servers.html) provided by Nginx on how to configure Https servers.
as we see in `listen    443 **ssl**;`, we are telling our telling our server to listen on the 433 port which is for Https connections, next we'll focus on those three lines
```bash
ssl_certificate     **www.example.com.crt**;
ssl_certificate_key **www.example.com.key**;
ssl_protocols       TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
```
here we simply specify the paths to the certificate and the key, that we already generated,
after that we specify the protocols that we're going to use, which in our case should be TLSv1.2 and TLSv1.3, let's adapt this config on our needs
```bash
server {
    listen              443 ssl;
    ssl_certificate     etc/nginx/ssl/certificate.crt;
    ssl_certificate_key etc/nginx/ssl/private.key;
    ssl_protocols       TLSv1.2 TLSv1.3;
}
```
next we need to add informations about our files and server name,
```bash
server {
    listen              443 ssl;
    ssl_certificate     etc/nginx/ssl/certificate.crt;
    ssl_certificate_key etc/nginx/ssl/private.key;
    ssl_protocols       TLSv1.2 TLSv1.3;

	root /var/www/html;
	index index.html index.htm index.nginx-debian.html;
	server_name _;

	location / {
		try_files $uri $uri/ =404;
	}
}
```
- `root /var/www/html` This sets the root directory for serving files for this server block. In this case, it's set to `/var/www/html`, which is a common location for serving static files on NGINX.
> We're gonna change the root later to `/var/www/wordpress`, also `server_name _;` to `server_name login.42.fr;`

- `index index.html index.htm index.nginx-debian.html;`: This directive specifies the default files to serve when a directory is requested. NGINX will look for these files in the specified `root` directory and serve the first one it finds.
- `server_name _;`: here we specify the server's hostname. The underscore `_` is a wildcard that matches any hostname. This means that this server block will respond to requests for any hostname.
- - `location / { ... }`: This block defines a location directive that matches requests for the root URL (`/`). Inside this block:
    - `try_files $uri $uri/ =404;`: This directive tells NGINX to try serving the requested URL (`$uri`). If the URL doesn't match an existing file, it will try appending a slash to the URL and look for a directory. If that fails as well, it will return a 404 Not Found error.
right now we are pretty much done, we still have some tweaks to do, but we'll see that later,
the task now is to place this configuration in a file inside `/etc/nginx/sites-available` then we would symlink from `/etc/nginx/sites-available/` to `/etc/nginx/sites-enabled/` to activate the configuration,
> Configurations placed in `sites-available` are considered available but not actively used by Nginx until they are symlinked from `sites-enabled`. This separation allows for better organization and management of Nginx configurations, especially in scenarios where we might have multiple sites or applications to manage.

Coming back to our Dockerfile, we will copy the config file to  `/sites-available` and then symlink to `/sites-enabled`,
```dockerfile
FROM debian:bullseye
RUN apt -y update && apt -y install vim && apt -y install curl
RUN apt -y install nginx && apt -y install openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/private.key -subj "/C=MA/ST=MA/L=Benguerir/O=42/OU=1337/CN=rerayyad.42.fr/UID=rerayyad"

COPY conf rerayyad.conf /etc/nginx/sites-avilable/rerayyad.conf
RUN ln -s /etc/nginx/sites-available/rerayyad.conf /etc/sites-enabled/

CMD [ "nginx", "-g", "daemon off;" ]
```
>We can add `EXPOSE 443`, which will expose port 443, but we can ignore it if we add the `-p` the moment of running the container, check [this](https://stackoverflow.com/questions/22111060/what-is-the-difference-between-expose-and-publish-in-docker) to understand ;)

We added `CMD [ "nginx", "-g", "daemon off;" ]` which will start Nginx and tells it to run in the foreground and not to daemonize.
### MariaDB:
It is time now to setup our data base container, on for that we're going to use **[MariaDB](https://mariadb.org/)**
which is a an enhanced drop-in replacement open source version of the MySQL relational database management system.
>**Relational** database is a collection of information that organizes data in predefined relationships where data is stored in one or more tables (or "relations") of columns(attributes) and rows(entries), making it easy to see and understand how different data structures relate to each other, **Non-Relational** databases, on the other hand, store data in a more flexible and dynamic way, often using formats like JSON or key-value pairs. They are also known as NoSQL databases. Non-relational databases are useful when dealing with unstructured or semi-structured data, and they can handle large volumes of data with high velocity.

Let's write start with our Dockerfile,
```dockerfile
FROM debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server

```
next we have two major steps, the first is to configure our Mariadb, the second is to set up a database and create a database user, let's start by the configuration.

this is the default server configuration:
```bash
#
# These groups are read by MariaDB server.
# Use it for options that only the server (but not clients) should see

# this is read by the standalone daemon and embedded servers
[server]

# this is only for the mysqld standalone daemon
[mysqld]

#
# * Basic Settings
#

user                    = mysql
pid-file                = /run/mysqld/mysqld.pid
basedir                 = /usr
datadir                 = /var/lib/mysql
tmpdir                  = /tmp
lc-messages-dir         = /usr/share/mysql
lc-messages             = en_US
skip-external-locking

# Broken reverse DNS slows down connections considerably and name resolve is
# safe to skip if there are no "host by domain name" access grants
#skip-name-resolve

# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address            = 127.0.0.1

#
# * Fine Tuning
#

#key_buffer_size        = 128M
#max_allowed_packet     = 1G
#thread_stack           = 192K
#thread_cache_size      = 8
# This replaces the startup script and checks MyISAM tables if needed
# the first time they are touched
#myisam_recover_options = BACKUP
#max_connections        = 100
#table_cache            = 64

#
# * Logging and Replication
#

# Both location gets rotated by the cronjob.
# Be aware that this log type is a performance killer.
# Recommend only changing this at runtime for short testing periods if needed!
#general_log_file       = /var/log/mysql/mysql.log
#general_log            = 1

# When running under systemd, error logging goes via stdout/stderr to journald
# and when running legacy init error logging goes to syslog due to
# /etc/mysql/conf.d/mariadb.conf.d/50-mysqld_safe.cnf
# Enable this if you want to have error logging into a separate file
#log_error = /var/log/mysql/error.log
# Enable the slow query log to see queries with especially long duration
#slow_query_log_file    = /var/log/mysql/mariadb-slow.log
#long_query_time        = 10
#log_slow_verbosity     = query_plan,explain
#log-queries-not-using-indexes
#min_examined_row_limit = 1000

# The following can be used as easy to replay backup logs or for replication.
# note: if you are setting up a replication slave, see README.Debian about
#       other settings you may need to change.
#server-id              = 1
#log_bin                = /var/log/mysql/mysql-bin.log
expire_logs_days        = 10
#max_binlog_size        = 100M

#
# * SSL/TLS
#

# For documentation, please read
# https://mariadb.com/kb/en/securing-connections-for-client-and-server/
#ssl-ca = /etc/mysql/cacert.pem
#ssl-cert = /etc/mysql/server-cert.pem
#ssl-key = /etc/mysql/server-key.pem
#require-secure-transport = on

#
# * Character sets
#

# MySQL/MariaDB default is Latin1, but in Debian we rather default to the full
# utf8 4-byte character set. See also client.cnf
character-set-server  = utf8mb4
collation-server      = utf8mb4_general_ci

#
# * InnoDB
#

# InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.
# Read the manual for more InnoDB related options. There are many!
# Most important is to give InnoDB 80 % of the system RAM for buffer use:
# https://mariadb.com/kb/en/innodb-system-variables/#innodb_buffer_pool_size
#innodb_buffer_pool_size = 8G

# this is only for embedded server
[embedded]

# This group is only read by MariaDB servers, not by MySQL.
# If you use the same .cnf file for MySQL and MariaDB,
# you can put MariaDB-only options here
[mariadb]

# This group is only read by MariaDB-10.5 servers.
# If you use the same .cnf file for MariaDB of different versions,
# use this group for options that older servers don't understand
[mariadb-10.5]
```
we need to change somethings on this configuration:
first we'll remove the `[server]`, `[embedded]`, `[mariadb]`, and `[mariadb-10.5]` sections since they're not being used.
>These sections are typically used to specify configuration options for different components or versions of MariaDB, but if they are empty or not needed in your setup, it's safe to remove them.

by default MariaDB allows connection only from localhost and all connections from a remote server is denied, to change that we need to to modify the bind-address from 127.0.0.1 to 0.0.0.0, this will make our MariaDB accept connections on all host IPv4 interfaces,

```bash
bind-address            = 0.0.0.0
```
Since the default port for MariaDB is 3306, it is optional to add this line to our configuration
```bash
port            = 3306
```
the same goes for:
```bash
socket          = /run/mysql/mysqld.sock
```
as MySQL/MariaDB by default expects the Unix socket file to be located at `/var/run/mysqld/mysqld.sock`
>Unix sockets provide a way for processes on the same machine to communicate with each other efficiently. When a MySQL/MariaDB client connects to the server running on the same machine, it can use a Unix socket instead of a network connection. This can offer better performance and security for local connections.

Last we can uncomment the log_error option which specifies the path to the error log file where MariaDB will log any errors encountered during operation
```bash
log_error = /var/log/mysql/error.log
```

now let's have a look at the final state of our file,
```bash
# this is only for the mysqld standalone daemon
[mysqld]
user                    = mysql #Specifies the user account that the MySQL daemon process should run as
pid-file                = /run/mysqld/mysqld.pid #Specifies the path to the file where the process ID (PID) of the MySQL daemon process should be written.
basedir                 = /usr
datadir                 = /var/lib/mysql #Specifies the base directory where MariaDB's executable files are located.
tmpdir                  = /tmp #Specifies the directory where temporary files should be stored.
socket					= /run/mysql/mysqld.sock #Specifies the path to the Unix socket file used for local client connections. (optional)
port					= 3306 #(optional)
lc-messages-dir         = /usr/share/mysql #Specifies the directory where language-specific error message files are located.

lc-messages             = en_US #Specifies that the server will produce error messages and other textual output in English

# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address            = 0.0.0.0

log_error = /var/log/mysql/error.log
expire_logs_days        = 10 #Specifies the number of days before binary log files should be automatically removed. Binary log files are used for point-in-time recovery and replication.

# MySQL/MariaDB default is Latin1, but in Debian we rather default to the full
# utf8 4-byte character set. See also client.cnf

#Specifies the default character set and collation for the server. In this case, it's set to `utf8mb4` for both, which supports a wider range of characters compared to the older `utf8` character set.
character-set-server  = utf8mb4
collation-server      = utf8mb4_general_ci
```
>we removed `skip-external-locking` which instructs the MySQL/MariaDB server to bypass the use of external locking mechanisms. This means that the server will not rely on external locking protocols provided by the operating system. Instead, it will use its internal locking mechanisms for table-level locks, In recent versions of MySQL and MariaDB, external locking mechanisms have been deprecated and eventually removed. This means that the server always uses its internal locking mechanisms, regardless of whether `skip-external-locking` is enabled or not. Since external locking is no longer supported, the option has effectively become obsolete.

let's add this file to our Dockerfile
```dockerfile
FROM debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server
COPY conf/50-server.cnf /etc/mysql/maiadb.conf.d/50-server.cnf
```
now that Mariadb is successfully installed and configured, it is time to create a database and a user, and to do that we're going to write a script, first let's run MySQL by
```bash
service mysql start;
```
next we'll create a database, but only if it does not already exist, and the same goes for the user:
```bash
service mariadb start;
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;";
mariadb -u root -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER/`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
```
notice that we're using environment variables, these would be specified in the **.env** file.
> Backticks are used to delimit identifiers, such as table names, column names, database names, and usernames. They are primarily used to distinguish identifiers from SQL keywords, to allow the use of special characters in identifiers, and to handle cases where an identifier coincides with a reserved word. For example, if you have a table named `order`, you would use backticks to refer to it: `SELECT * FROM` order`;`, while Single quotes are used to delimit string literals values, such as text strings or passwords.

Now we need to grant permissions to our newly created user in order to have access to the database,
```bash
mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';";
```
next we need to change the root password
```bash
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
```
and then we should reload everything after the modifications
```bash
mariadb -u root  -e "FLUSH PRIVILEGES;";
```
the last thing we should do is to stop MySQL
```bash
kill $(cat /var/run/mysqld/mysqld.pid);
```

this is the final result of the script:
```bash
service mariadb start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS testbase;"
mariadb -u root -e "CREATE USER IF NOT EXISTS 'testuser'@'%' IDENTIFIED BY '1234';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON testbase.* TO 'testuser'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('4321');"
mariadb -u root -e "FLUSH PRIVILEGES;"

mariadb -u root -p4321 -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '4321';"
mariadb -u root -p4321 -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid);
```
>In the docker file we should add `ENTRYPOINT ["mysqld_safe"]`

### Wordpress:
as usual we're gonna build our container on top of debian 11 and update and download the tools we need, our Dockerfile will look like this
```dockerfile
FROM debian:buster
RUN apt update -y && apt upgrade -y
RUN apt install -y vim && apt install -y wget
```
now we will install wordpress and php-fpm, wait we know php but what's **fpm**?, you might ask,
in order to understand php-fpm, we need to have a look at what **CGI** and **FastCGI** are, In simple terms, **CGI(**Common Gateway Interface)** is like sending individual requests to the server, where each request starts a new process to handle it. **FastCGI**, on the other hand, uses persistent processes that can handle multiple requests over time, making it faster and more scalable, especially for websites with lots of visitors making requests simultaneously, more simpler, CGI is like having a new waiter for every customer in a restaurant, while FastCGI is like having a few waiters(group of PHP worker processes aka **pools**) serving multiple customers, making the process faster and more efficient, **[FPM(FastCGI Process Manager)](https://www.php.net/manual/en/install.fpm.php)** is simply a PHP FastCGI implementation designed for PHP-based web applications. now let's install it,
```dockerfile
FROM debian:buster
RUN apt update -y && apt upgrade -y
RUN apt install -y vim && apt install -y wget

RUN apt install -y php7.4-fpm php7.4-mysql mariadb-client
```
In addition to php-fpm, we will need **php-mysql** where PHP handles the server-side scripting tasks, while MySQL manages the storage and retrieval of data, also we'll need **mariadb-client** that will be used to interact with the Mariadb server that we already installed in the Mariadb container. as usual after installing it, we need configure it, we got to modify the configuration file `www.conf` located in `/etc/php/7.4/fpm/pool.d/`, and it contains this:
```bash
; Start a new pool named 'www'.
; the variable $pool can be used in any directive and will be replaced by the
; pool name ('www' here)
[www]

; Per pool prefix
; It only applies on the following directives:
; - 'access.log'
; - 'slowlog'
; - 'listen' (unixsocket)
; - 'chroot'
; - 'chdir'
; - 'php_values'
; - 'php_admin_values'
; When not set, the global prefix (or /usr) applies instead.
; Note: This directive can also be relative to the global prefix.
; Default Value: none
;prefix = /path/to/pools/$pool

; Unix user/group of processes
; Note: The user is mandatory. If the group is not set, the default user's group
;       will be used.
user = www-data
group = www-data

; The address on which to accept FastCGI requests.
; Valid syntaxes are:
;   'ip.add.re.ss:port'    - to listen on a TCP socket to a specific IPv4 address on
;                            a specific port;
;   '[ip:6:addr:ess]:port' - to listen on a TCP socket to a specific IPv6 address on
;                            a specific port;
;   'port'                 - to listen on a TCP socket to all addresses
;                            (IPv6 and IPv4-mapped) on a specific port;
;   '/path/to/unix/socket' - to listen on a unix socket.
; Note: This value is mandatory.
listen = /run/php/php7.4-fpm.sock

; Set listen(2) backlog.
; Default Value: 511 (-1 on FreeBSD and OpenBSD)
;listen.backlog = 511

; Set permissions for unix socket, if one is used. In Linux, read/write
; permissions must be set in order to allow connections from a web server. Many
; BSD-derived systems allow connections regardless of permissions. The owner
; and group can be specified either by name or by their numeric IDs.
; Default Values: user and group are set as the running user
;                 mode is set to 0660
listen.owner = www-data
listen.group = www-data
;listen.mode = 0660
; When POSIX Access Control Lists are supported you can set them using
; these options, value is a comma separated list of user/group names.
; When set, listen.owner and listen.group are ignored
;listen.acl_users =
;listen.acl_groups =

; List of addresses (IPv4/IPv6) of FastCGI clients which are allowed to connect.
; Equivalent to the FCGI_WEB_SERVER_ADDRS environment variable in the original
; PHP FCGI (5.2.2+). Makes sense only with a tcp listening socket. Each address
; must be separated by a comma. If this value is left blank, connections will be
; accepted from any ip address.
; Default Value: any
;listen.allowed_clients = 127.0.0.1

; Specify the nice(2) priority to apply to the pool processes (only if set)
; The value can vary from -19 (highest priority) to 20 (lower priority)
; Note: - It will only work if the FPM master process is launched as root
;       - The pool processes will inherit the master process priority
;         unless it specified otherwise
; Default Value: no set
; process.priority = -19

; Set the process dumpable flag (PR_SET_DUMPABLE prctl) even if the process user
; or group is differrent than the master process user. It allows to create process
; core dump and ptrace the process for the pool user.
; Default Value: no
; process.dumpable = yes

; Choose how the process manager will control the number of child processes.
; Possible Values:
;   static  - a fixed number (pm.max_children) of child processes;
;   dynamic - the number of child processes are set dynamically based on the
;             following directives. With this process management, there will be
;             always at least 1 children.
;             pm.max_children      - the maximum number of children that can
;                                    be alive at the same time.
;             pm.start_servers     - the number of children created on startup.
;             pm.min_spare_servers - the minimum number of children in 'idle'
;                                    state (waiting to process). If the number
;                                    of 'idle' processes is less than this
;                                    number then some children will be created.
;             pm.max_spare_servers - the maximum number of children in 'idle'
;                                    state (waiting to process). If the number
;                                    of 'idle' processes is greater than this
;                                    number then some children will be killed.
;  ondemand - no children are created at startup. Children will be forked when
;             new requests will connect. The following parameter are used:
;             pm.max_children           - the maximum number of children that
;                                         can be alive at the same time.
;             pm.process_idle_timeout   - The number of seconds after which
;                                         an idle process will be killed.
; Note: This value is mandatory.
pm = dynamic

; The number of child processes to be created when pm is set to 'static' and the
; maximum number of child processes when pm is set to 'dynamic' or 'ondemand'.
; This value sets the limit on the number of simultaneous requests that will be
; served. Equivalent to the ApacheMaxClients directive with mpm_prefork.
; Equivalent to the PHP_FCGI_CHILDREN environment variable in the original PHP
; CGI. The below defaults are based on a server without much resources. Don't
; forget to tweak pm.* to fit your needs.
; Note: Used when pm is set to 'static', 'dynamic' or 'ondemand'
; Note: This value is mandatory.
pm.max_children = 5

; The number of child processes created on startup.
; Note: Used only when pm is set to 'dynamic'
; Default Value: (min_spare_servers + max_spare_servers) / 2
pm.start_servers = 2

; The desired minimum number of idle server processes.
; Note: Used only when pm is set to 'dynamic'
; Note: Mandatory when pm is set to 'dynamic'
pm.min_spare_servers = 1

; The desired maximum number of idle server processes.
; Note: Used only when pm is set to 'dynamic'
; Note: Mandatory when pm is set to 'dynamic'
pm.max_spare_servers = 3

; The number of seconds after which an idle process will be killed.
; Note: Used only when pm is set to 'ondemand'
; Default Value: 10s
;pm.process_idle_timeout = 10s;

; The number of requests each child process should execute before respawning.
; This can be useful to work around memory leaks in 3rd party libraries. For
; endless request processing specify '0'. Equivalent to PHP_FCGI_MAX_REQUESTS.
; Default Value: 0
;pm.max_requests = 500

; The URI to view the FPM status page. If this value is not set, no URI will be
; recognized as a status page. It shows the following informations:
;   pool                 - the name of the pool;
;   process manager      - static, dynamic or ondemand;
;   start time           - the date and time FPM has started;
;   start since          - number of seconds since FPM has started;
;   accepted conn        - the number of request accepted by the pool;
;   listen queue         - the number of request in the queue of pending
;                          connections (see backlog in listen(2));
;   max listen queue     - the maximum number of requests in the queue
;                          of pending connections since FPM has started;
;   listen queue len     - the size of the socket queue of pending connections;
;   idle processes       - the number of idle processes;
;   active processes     - the number of active processes;
;   total processes      - the number of idle + active processes;
;   max active processes - the maximum number of active processes since FPM
;                          has started;
;   max children reached - number of times, the process limit has been reached,
;                          when pm tries to start more children (works only for
;                          pm 'dynamic' and 'ondemand');
; Value are updated in real time.
; Example output:
;   pool:                 www
;   process manager:      static
;   start time:           01/Jul/2011:17:53:49 +0200
;   start since:          62636
;   accepted conn:        190460
;   listen queue:         0
;   max listen queue:     1
;   listen queue len:     42
;   idle processes:       4
;   active processes:     11
;   total processes:      15
;   max active processes: 12
;   max children reached: 0
;
; By default the status page output is formatted as text/plain. Passing either
; 'html', 'xml' or 'json' in the query string will return the corresponding
; output syntax. Example:
;   http://www.foo.bar/status
;   http://www.foo.bar/status?json
;   http://www.foo.bar/status?html
;   http://www.foo.bar/status?xml
;
; By default the status page only outputs short status. Passing 'full' in the
; query string will also return status for each pool process.
; Example:
;   http://www.foo.bar/status?full
;   http://www.foo.bar/status?json&full
;   http://www.foo.bar/status?html&full
;   http://www.foo.bar/status?xml&full
; The Full status returns for each process:
;   pid                  - the PID of the process;
;   state                - the state of the process (Idle, Running, ...);
;   start time           - the date and time the process has started;
;   start since          - the number of seconds since the process has started;
;   requests             - the number of requests the process has served;
;   request duration     - the duration in µs of the requests;
;   request method       - the request method (GET, POST, ...);
;   request URI          - the request URI with the query string;
;   content length       - the content length of the request (only with POST);
;   user                 - the user (PHP_AUTH_USER) (or '-' if not set);
;   script               - the main script called (or '-' if not set);
;   last request cpu     - the %cpu the last request consumed
;                          it's always 0 if the process is not in Idle state
;                          because CPU calculation is done when the request
;                          processing has terminated;
;   last request memory  - the max amount of memory the last request consumed
;                          it's always 0 if the process is not in Idle state
;                          because memory calculation is done when the request
;                          processing has terminated;
; If the process is in Idle state, then informations are related to the
; last request the process has served. Otherwise informations are related to
; the current request being served.
; Example output:
;   ************************
;   pid:                  31330
;   state:                Running
;   start time:           01/Jul/2011:17:53:49 +0200
;   start since:          63087
;   requests:             12808
;   request duration:     1250261
;   request method:       GET
;   request URI:          /test_mem.php?N=10000
;   content length:       0
;   user:                 -
;   script:               /home/fat/web/docs/php/test_mem.php
;   last request cpu:     0.00
;   last request memory:  0
;
; Note: There is a real-time FPM status monitoring sample web page available
;       It's available in: /usr/share/php/7.4/fpm/status.html
;
; Note: The value must start with a leading slash (/). The value can be
;       anything, but it may not be a good idea to use the .php extension or it
;       may conflict with a real PHP file.
; Default Value: not set
;pm.status_path = /status

; The ping URI to call the monitoring page of FPM. If this value is not set, no
; URI will be recognized as a ping page. This could be used to test from outside
; that FPM is alive and responding, or to
; - create a graph of FPM availability (rrd or such);
; - remove a server from a group if it is not responding (load balancing);
; - trigger alerts for the operating team (24/7).
; Note: The value must start with a leading slash (/). The value can be
;       anything, but it may not be a good idea to use the .php extension or it
;       may conflict with a real PHP file.
; Default Value: not set
;ping.path = /ping

; This directive may be used to customize the response of a ping request. The
; response is formatted as text/plain with a 200 response code.
; Default Value: pong
;ping.response = pong

; The access log file
; Default: not set
;access.log = log/$pool.access.log

; The access log format.
; The following syntax is allowed
;  %%: the '%' character
;  %C: %CPU used by the request
;      it can accept the following format:
;      - %{user}C for user CPU only
;      - %{system}C for system CPU only
;      - %{total}C  for user + system CPU (default)
;  %d: time taken to serve the request
;      it can accept the following format:
;      - %{seconds}d (default)
;      - %{miliseconds}d
;      - %{mili}d
;      - %{microseconds}d
;      - %{micro}d
;  %e: an environment variable (same as $_ENV or $_SERVER)
;      it must be associated with embraces to specify the name of the env
;      variable. Some exemples:
;      - server specifics like: %{REQUEST_METHOD}e or %{SERVER_PROTOCOL}e
;      - HTTP headers like: %{HTTP_HOST}e or %{HTTP_USER_AGENT}e
;  %f: script filename
;  %l: content-length of the request (for POST request only)
;  %m: request method
;  %M: peak of memory allocated by PHP
;      it can accept the following format:
;      - %{bytes}M (default)
;      - %{kilobytes}M
;      - %{kilo}M
;      - %{megabytes}M
;      - %{mega}M
;  %n: pool name
;  %o: output header
;      it must be associated with embraces to specify the name of the header:
;      - %{Content-Type}o
;      - %{X-Powered-By}o
;      - %{Transfert-Encoding}o
;      - ....
;  %p: PID of the child that serviced the request
;  %P: PID of the parent of the child that serviced the request
;  %q: the query string
;  %Q: the '?' character if query string exists
;  %r: the request URI (without the query string, see %q and %Q)
;  %R: remote IP address
;  %s: status (response code)
;  %t: server time the request was received
;      it can accept a strftime(3) format:
;      %d/%b/%Y:%H:%M:%S %z (default)
;      The strftime(3) format must be encapsuled in a %{<strftime_format>}t tag
;      e.g. for a ISO8601 formatted timestring, use: %{%Y-%m-%dT%H:%M:%S%z}t
;  %T: time the log has been written (the request has finished)
;      it can accept a strftime(3) format:
;      %d/%b/%Y:%H:%M:%S %z (default)
;      The strftime(3) format must be encapsuled in a %{<strftime_format>}t tag
;      e.g. for a ISO8601 formatted timestring, use: %{%Y-%m-%dT%H:%M:%S%z}t
;  %u: remote user
;
; Default: "%R - %u %t \"%m %r\" %s"
;access.format = "%R - %u %t \"%m %r%Q%q\" %s %f %{mili}d %{kilo}M %C%%"

; The log file for slow requests
; Default Value: not set
; Note: slowlog is mandatory if request_slowlog_timeout is set
;slowlog = log/$pool.log.slow

; The timeout for serving a single request after which a PHP backtrace will be
; dumped to the 'slowlog' file. A value of '0s' means 'off'.
; Available units: s(econds)(default), m(inutes), h(ours), or d(ays)
; Default Value: 0
;request_slowlog_timeout = 0

; Depth of slow log stack trace.
; Default Value: 20
;request_slowlog_trace_depth = 20

; The timeout for serving a single request after which the worker process will
; be killed. This option should be used when the 'max_execution_time' ini option
; does not stop script execution for some reason. A value of '0' means 'off'.
; Available units: s(econds)(default), m(inutes), h(ours), or d(ays)
; Default Value: 0
;request_terminate_timeout = 0

; The timeout set by 'request_terminate_timeout' ini option is not engaged after
; application calls 'fastcgi_finish_request' or when application has finished and
; shutdown functions are being called (registered via register_shutdown_function).
; This option will enable timeout limit to be applied unconditionally
; even in such cases.
; Default Value: no
;request_terminate_timeout_track_finished = no

; Set open file descriptor rlimit.
; Default Value: system defined value
;rlimit_files = 1024

; Set max core size rlimit.
; Possible Values: 'unlimited' or an integer greater or equal to 0
; Default Value: system defined value
;rlimit_core = 0

; Chroot to this directory at the start. This value must be defined as an
; absolute path. When this value is not set, chroot is not used.
; Note: you can prefix with '$prefix' to chroot to the pool prefix or one
; of its subdirectories. If the pool prefix is not set, the global prefix
; will be used instead.
; Note: chrooting is a great security feature and should be used whenever
;       possible. However, all PHP paths will be relative to the chroot
;       (error_log, sessions.save_path, ...).
; Default Value: not set
;chroot =

; Chdir to this directory at the start.
; Note: relative path can be used.
; Default Value: current directory or / when chroot
;chdir = /var/www

; Redirect worker stdout and stderr into main error log. If not set, stdout and
; stderr will be redirected to /dev/null according to FastCGI specs.
; Note: on highloaded environement, this can cause some delay in the page
; process time (several ms).
; Default Value: no
;catch_workers_output = yes

; Decorate worker output with prefix and suffix containing information about
; the child that writes to the log and if stdout or stderr is used as well as
; log level and time. This options is used only if catch_workers_output is yes.
; Settings to "no" will output data as written to the stdout or stderr.
; Default value: yes
;decorate_workers_output = no

; Clear environment in FPM workers
; Prevents arbitrary environment variables from reaching FPM worker processes
; by clearing the environment in workers before env vars specified in this
; pool configuration are added.
; Setting to "no" will make all environment variables available to PHP code
; via getenv(), $_ENV and $_SERVER.
; Default Value: yes
;clear_env = no

; Limits the extensions of the main script FPM will allow to parse. This can
; prevent configuration mistakes on the web server side. You should only limit
; FPM to .php extensions to prevent malicious users to use other extensions to
; execute php code.
; Note: set an empty value to allow all extensions.
; Default Value: .php
;security.limit_extensions = .php .php3 .php4 .php5 .php7

; Pass environment variables like LD_LIBRARY_PATH. All $VARIABLEs are taken from
; the current environment.
; Default Value: clean env
;env[HOSTNAME] = $HOSTNAME
;env[PATH] = /usr/local/bin:/usr/bin:/bin
;env[TMP] = /tmp
;env[TMPDIR] = /tmp
;env[TEMP] = /tmp

; Additional php.ini defines, specific to this pool of workers. These settings
; overwrite the values previously defined in the php.ini. The directives are the
; same as the PHP SAPI:
;   php_value/php_flag             - you can set classic ini defines which can
;                                    be overwritten from PHP call 'ini_set'.
;   php_admin_value/php_admin_flag - these directives won't be overwritten by
;                                     PHP call 'ini_set'
; For php_*flag, valid values are on, off, 1, 0, true, false, yes or no.

; Defining 'extension' will load the corresponding shared extension from
; extension_dir. Defining 'disable_functions' or 'disable_classes' will not
; overwrite previously defined php.ini values, but will append the new value
; instead.

; Note: path INI options can be relative and will be expanded with the prefix
; (pool, global or /usr)

; Default Value: nothing is defined by default except the values in php.ini and
;                specified at startup with the -d argument
;php_admin_value[sendmail_path] = /usr/sbin/sendmail -t -i -f www@my.domain.com
;php_flag[display_errors] = off
;php_admin_value[error_log] = /var/log/fpm-php.www.log
;php_admin_flag[log_errors] = on
;php_admin_value[memory_limit] = 32M

```
let's keep just what we need,
```bash
[www] #This indicates the start of a configuration block for the PHP pool named "www"

; The address on which to accept FastCGI requests.
listen = 0.0.0.0:9000 #Configures PHP-FPM to listen for FastCGI connections on all available network interfaces on the server, on port 9000, allowing connections from any client that can reach the server.

listen.owner = www-data #Specifies the Unix user account that will own the Unix socket or TCP address defined in the `listen` directive.
listen.group = www-data #Specifies the Unix group that will own the Unix socket or TCP address defined in the `listen` directive.

; Unix user/group of processes
user = www-data #Specifies the Unix user account under which PHP-FPM processes in this pool will run. 
group = www-data #Specifies the Unix group under which PHP-FPM processes in this pool will run.

; Choose how the process manager will control the number of child processes.
pm = dynamic #Specifies the process manager type. In this case, it's set to dynamic, meaning PHP-FPM will dynamically adjust the number of child processes based on the workload.
pm.max_children = 5 #Sets the maximum number of child processes that PHP-FPM will allow to spawn for this pool. Here, it's set to 5.
pm.start_servers = 2 #Defines the number of child processes that PHP-FPM will start initially when it's started or restarted. Here, it's set to start 2 child processes.
pm.min_spare_servers = 1 #Specifies the minimum number of idle child processes that PHP-FPM will maintain. If the number of idle processes falls below this value, PHP-FPM will spawn more child processes to meet this minimum.
pm.max_spare_servers = 3 #Specifies the maximum number of idle child processes that PHP-FPM will maintain. If the number of idle processes exceeds this value, PHP-FPM will terminate the excess processes.

clear_env = no #Determines whether environment variables passed in the client request should be cleared in the environment of PHP-FPM worker processes.
```
>When a client, such as a web server, sends a request to php-fpm to process a php script, it may include environment variables as part of the request headers or other metadata, The `clear_env` directive determines whether these environment variables from the client request should be cleared (removed) from the environment of php-fpm worker processes before executing the php script.

also we need to create PID directory for php-fpm to avoid any potential errors
```dockerfile
RUN mkdir -p /run/php
RUN chmod 775 /run/php
```

Now it is turn for wordpress to be installed and configured,
```dockerfile
RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xfz latest.tar.gz && rm -rf latest.tar.gz
```
> the **-P** will place the downloaded file in `/var/www`

last we need to change the ownership of the `/var/www/wordpress` directory and its contents to the `root` user and group by running, this directory will contain our installation and configuration of wordpress,
```dockerfile
RUN chown -R root:root /var/www/wordpress
```
the configuration file that should be configured is `/var/www/wordpress/wp-config.php`, it can be named `wp-config-sample.php`, if it's the case we simply change its name to `wp-config.php`, it should contain the database connection details for wordpress It sets up parameters like database name, username, password, and host. We can directly modfy this file, but luckily for us there is something called **WordPress CLI (Command Line Interface)**, which is a tool that allows us to manage various aspects of our WordPress site directly from the command line, in our case we are going to use to configure WordPress, including setting up the database connection, creating the initial administrator account, and configuring basic settings, let's start by downloading it,
```dockerfile
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
```
now let's write a script to setup everything with the CLI, starting by downloading core wordpress files,
```bash
wp core download --allow-root
```
next let's add our database credentials to wordpress
```bash
wp config create  --allow-root --dbname=testbase --dbuser=testuser --dbpass=1234 --dbhost=mariadb:3306 --path='/var/www/wordpress'
```
>**[wp config create:](https://developer.wordpress.org/cli/commands/config/create/)** Creates a new wp-config.php with database constants, and verifies that the database constants are correct.

Now let's actually install wordpress itself 
```bash
wp core install     --url=rerayyad.42.fr --title=testtitle --admin_user=rerayyad --admin_password=rerayyad --admin_email=rerayyad@mail.com --allow-root --path='/var/www/wordpress'
```
>**[wp core install](https://developer.wordpress.org/cli/commands/core/install/)**: Sets up a new WordPress installation with the specified configuration parameters, such as site URL, title, admin username, password, and email. It also creates the necessary database tables, sets up the initial configuration files, and prepares the basic structure of a WordPress site.

this last step will avoid the wordpress installation page from showing every time we run the container,
lastly we need to create a user as specified in the subject, for that we'll simply use [wp user create](https://developer.wordpress.org/cli/commands/user/create/),
```bash
wp user create --allow-root --role=author usertest2 usermail2@mail.com --user_pass=1234 --path='/var/www/wordpress'
```
the final result of our Dockerfile will look something like this:
```dockerfile
FROM  debian:bullseye
RUN       apt update -y && apt upgrade -y
RUN       apt install -y vim && apt install -y wget

RUN       apt install -y php7.4-fpm php7.4-mysql mariadb-client

COPY  /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php
RUN chmod 775 /run/php

RUN       wget https://wordpress.org/latest.tar.gz -P /var/www
RUN       cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

RUN       wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
RUN       chmod +x /usr/local/bin/wp

COPY  /tools/script.sh /
RUN       chmod +x script.sh
ENTRYPOINT ["bash", "script.sh"]
```

And we're finally done with making and configuring the containers

![exhausted](https://media.giphy.com/media/3o7TKEP6YngkCKFofC/giphy.gif?cid=ecf05e475bcb0rl8uwh69g5ycktcji7k67sbwzz4gam497ww&ep=v1_gifs_search&rid=giphy.gif&ct=g)

All we need now is to run our services all together, to do that we gonna need something called **Docker Compose**.
## Docker Compose:
Docker Compose is a tool used for defining and running multi-container Docker applications. It allows us to define the services, networks, and volumes for our application in a YAML file called `docker-compose.yml`, here's a very basic example of what it might look like:
```yaml
version: '3'
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
  db:
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: example
```
here we define two services(containers), `web` and `db`, and we specify the parameters of each one, if we want start these services we run `docker-compose up`.
now let's make our own,
# Acknowledgement:
# Resources:
- [Configuring MariaDB with Option Files](https://mariadb.com/kb/en/configuring-mariadb-with-option-files/#default-option-file-locations)
- [Enable Remote access to MariaDB/MySQL database](https://webdock.io/en/docs/how-guides/database-guides/remote-access-your-mariadb-mysql-database-ubuntu-focal-mariadb-v106)
- [Create MariaDB User and Grant Privileges](https://phoenixnap.com/kb/how-to-create-mariadb-user-grant-privileges)
- [Installing and using WP-CLI](https://www.hostinger.fr/tutoriels/wp-cli#Les_principes_de_base_des_commandes_de_WP-CLI) 
- 
<p align="right">(<a href="#top">back to top</a>)</p>
