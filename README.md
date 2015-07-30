# Docker image for Ember CLI, PhantomJS and Bower command-line tools

[![](https://badge.imagelayers.io/sebp/ember:latest.svg)](https://imagelayers.io/?images=sebp/ember:latest 'Get your own badge on imagelayers.io')

This is a [Docker](http://www.docker.com) image for [Ember](http://emberjs.com/), [PhantomJS](http://phantomjs.org) and [Bower](http://bower.io), based on an image intended for use in the fashion described on [@dylanlindgren](https://twitter.com/dylanlindgren)'s series of blog articles about using Docker and the [Laravel PHP framework](http://www.laravel.com) together ([Docker for the Laravel framework](http://dylanlindgren.com/docker-for-the-laravel-framework), and [Beautiful Laravel Development with Docker & Fig](http://dylanlindgren.com/laravel-development-docker-fig)).

An automated build for this repo is available on the [Docker Hub](https://registry.hub.docker.com/u/sebp/ember).

### Contents

- Usage
- Building the image
- Notes
- About

## Usage

Ember, PhantomJS and Bower commands should be run within the container as the current user. Get the user ID of the current user using the following command:

	$ id -u
	1000  

In the following commands, replace `<UID>` with whatever figure was returned (e.g. `1000` in the example above). 

Running an Ember CLI command in the current directory:

	$ sudo docker run --rm -p 4200:4200 -v $(pwd):/data -w /data \
	  -u <UID> -e HOME=/data sebp/ember *your Ember CLI commands here*

Running a PhantomJS command in the current directory:

	$ sudo docker run --rm -v $(pwd):/data -w /data \
	  -u <UID> --entrypoint phantomjs sebp/ember *your PhantomJS commands here*

Running a Bower command in the current directory:

	$ sudo docker run --rm -v $(pwd):/data -w /data \
	  -u <UID> --entrypoint bower sebp/ember *your Bower commands here*

For the sake of sanity, it is strongly recommended to create aliases, e.g.:

	alias dember='sudo docker run ... sebp/ember'
	alias dphantomjs='sudo docker run ... sebp/phantom'
	alias dbower='sudo docker run ... sebp/bower'

To avoid recreating these aliases each time you start a new shell session, either add these lines to one of your shell's start-up files (e.g. `~/.bashrc` for Bash), or create a shell script with these three lines (e.g. `~/ember-aliases.sh`) and source it (i.e. `source ~/ember-aliases.sh` or . `~/ember/aliases.sh`) when you need to use the aliases.

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