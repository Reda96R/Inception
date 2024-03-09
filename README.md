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
	   1. [How does Docker work](### how-does-docker-work) 
   3. [OSI](#osi)
3. [Subnetting](#subnetting)
   1. [IP Address](#ip-address)
   2. [Making a Subnet](#making-a-subnet)
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
### How does Docker work?
Docker is basically running on top of a host machine, and it is sharing the kernel of that machine with the containers, providing isolated processes in their own user space

# Acknowledgement:
<p align="right">(<a href="#top">back to top</a>)</p>

