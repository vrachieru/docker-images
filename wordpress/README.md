# Docker Image for Wordpress

[![Docker Stars](https://img.shields.io/docker/stars/vrachieru/wordpress.svg?style=flat)](https://hub.docker.com/r/vrachieru/wordpress/)
[![Docker Pulls](https://img.shields.io/docker/pulls/vrachieru/wordpress.svg?style=flat)](https://hub.docker.com/r/vrachieru/wordpress/)

This image will have you running Wordpress & posting in no time without the hasle of setting up Apache and MySQL.

### Quick start

#### Build

If you'd like to try directly from the Dockerfile you can build the image as:

``docker build -t <yourname>/wordpress .``

#### Pull

The image is also released as an official Docker image from Docker's automated build repository.  
You can always pull or refer the image when launching containers.

``docker pull vrachieru/wordpress``

#### Run

Specify your desired port and run the container with the following command:

``docker run --name wordpress -d -p <http_port>:80 <yourname>/wordpress``

You can then stop and (re)start the container a follows:

``docker stop wordpress``

``docker start wordpress``


### Includes the following components

* [Apache2](https://httpd.apache.org/)
* [MySQL](https://www.mysql.com/)
* [Wordpress](https://wordpress.com/)
