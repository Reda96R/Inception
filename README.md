<div id="top"></div>
<!-- PROJECT LOGO -->
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

this is the base configuration file:
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
# Acknowledgement:
<p align="right">(<a href="#top">back to top</a>)</p>


