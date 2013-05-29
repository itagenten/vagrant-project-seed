vagrant-project-seed
======================

Be carefull: the project is under heavy development and not really usable at the moment!


The goal of this project is to deliver well defined development environments to our
deveopers. The planned development stacks include:

* nodejs
* php
* java
* cordova
* python
* ruby 

Prerequisites
---------------------

* VirtualBox
* vagrant
* vagrant-hostsupdater plugin
* salty-vagrant plugin


Installation
--------------------

1. install VirtualBox 

apt-get install virtualbox

2. download & install vagrant 

http://downloads.vagrantup.com/tags/v1.2.0

3. install required vagrant plugins

    vagrant plugin install vagrant-salt

    vagrant plugin uninstall vagrant-hostsupdater

4. create "config.rb"

5. start the maschine 

  vagrant up

