# Docker image for Ember CLI, PhantomJS and Bower command-line tools

This is a [Docker](http://www.docker.com) image for [Ember](http://emberjs.com/), [PhantomJS](http://phantomjs.org) and [Bower](http://bower.io), based on an image intended for use in the fashion described on [@dylanlindgren](https://twitter.com/dylanlindgren)'s series of blog articles about using Docker and the [Laravel PHP framework](http://www.laravel.com) together ([Docker for the Laravel framework](http://dylanlindgren.com/docker-for-the-laravel-framework), and [Beautiful Laravel Development with Docker & Fig](http://dylanlindgren.com/laravel-development-docker-fig)).

An automated build for this repo is available on the [Docker Hub](https://registry.hub.docker.com/u/sebp/ember-docker).

### Contents

- Running Ember, PhantomJS and Bower commands
	- With Docker
	- With Docker Compose
	- Tip
- Usage notes
	- Running Ember, PhantomJS and Bower commands
- Building the image
- Notes
- About

## Running Ember, PhantomJS and Bower commands

You can run Ember, PhantomJS and Bower commands using either Docker or Docker Compose.

### With Docker

Running an Ember CLI command:

	$ sudo docker run --privileged=true --rm sebp/ember-docker -p 4200:4200 *your Ember CLI commands here*

Running a PhantomJS command:

	$ sudo docker run --privileged=true --rm sebp/ember-docker --entrypoint="phantomjs" *your PhantomJS commands here*

Running a PhantomJS command:

	$ sudo docker run --privileged=true --rm sebp/ember-docker --entrypoint="bower" *your Bower commands here*

### With Docker Compose

Create the following entries in a `docker-compose.yml` file which you can run `docker-compose` against:

	ember:
	  image: sepb/ember-docker
	  privileged: true
	  ports:
	    - "4200:4200"
	 
	phantomjs:
	  image: sepb/ember-docker
	  entrypoint: phantomjs
	  privileged: true 
	
	bower:
	  image: sepb/ember-docker
	  entrypoint: bower
	  privileged: true

Running an Ember CLI command:

	$ sudo docker-compose run --rm ember *your Ember CLI commands here*

Running a PhantomJS command:

	$ sudo docker-compose run --rm phantomjs *your PhantomJS commands here*

Running a PhantomJS command:

	$ sudo docker-compose run --rm bower *your Bower commands here*

### Tip 

Whichever option you go with to run the commands, for the sake of sanity, it is strongly recommended to create aliases:

	alias dember='sudo docker-compose run --rm ember'
	alias dphantomjs='sudo docker-compose run --rm phantom'
	alias dbower='sudo docker-compose run --rm bower'

To avoid recreating these aliases each time you start a new shell session, either add these lines to one of your shell's start-up files (e.g. `~/.bashrc` for Bash), or create a shell script with these three lines (e.g. `~/ember-aliases.sh`) and source it (i.e. `source ~/ember-aliases.sh` or . `~/ember/aliases.sh`) when you need to use the aliases.

## Usage notes

The image's default working directory is `/data/www`, which is also the default user's home directory, in which dot files will be created as needed. 

### Running commands in specific directories

This image uses a data volume, the mount point of which is `/data`.

To run Ember CLI, Bower or PhantomJS, remember to set the image's working directory to wherever you want to run the command from **in the data volume**. For instance if you mapped the image's `/data` mount point to `/var/my-data` on your host and you want to run a command in `/var/my-data/www/public` on your host, then you need to set your working directory to `/data/www/public`.

You can define your working directory using one of the following methods:

- Run the `docker run` command with the `-w` (or `--workdir=""`) option.

- Use the `working_dir` key in Docker Compose's `docker-compose.yml` file.   

- Write your own `Dockerfile`, setting the base image to `sebp/ember-docker` (i.e. `FROM sebp/ember-docker`), and use the `WORKDIR` instruction. This option is the least flexible as you'll have to rebuild the Docker image each time you want to run Ember CLI, Bower or PhantomJS in a different directory.

## Building the image

To rebuild this image with Docker Compose, use the supplied `docker-compose.yml`, and run:

	$ sudo docker-compose build

## Notes

This image works well with the below related images.

- [dylanlindgren/docker-laravel-data](https://github.com/dylanlindgren/docker-laravel-data)

- [dylanlindgren/docker-laravel-nginx](https://github.com/dylanlindgren/docker-laravel-nginx)

- [dylanlindgren/docker-laravel-phpfpm](https://github.com/dylanlindgren/docker-laravel-phpfpm)

- [dylanlindgren/docker-laravel-composer](https://github.com/dylanlindgren/docker-laravel-composer)

- [dylanlindgren/docker-laravel-artisan](https://github.com/dylanlindgren/docker-laravel-artisan)

- [dylanlindgren/docker-laravel-phpunit](https://github.com/dylanlindgren/docker-laravel-phpunit)

## About

Adapted by [Sébastien Pujadas](http://pujadas.net) from [@dylanlindgren](https://twitter.com/dylanlindgren)'s [Docker image for Bower](https://github.com/dylanlindgren/docker-laravel-bower), released under the [MIT license](http://opensource.org/licenses/MIT).