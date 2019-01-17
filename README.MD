# Nginx Loadbalancer
this nginx image is base on `nginx:1.15.1`

## Package Included
- wget
- curl
- net-tools
- iputils-ping
- nano

> How to `Basic`

```bash
  $ git clone this_repo # <- change `this_repo` with repo clone url
  $ cd nginx-loadbalancer
```

> How to `Build`

```bash
  $ docker build -f Dockerfile -t your_dockerhub_username/your_image_name:tag_name .

  # example
  $ docker build -f Dockerfile -t kankuu/nginx-loadbalancer:alpha .
```

> How to `Run` with `single line`

```bash
  $ docker run -d --name container_name --net network_name -p expose_port:80 your_dockerhub_name/image_name:tag_name

  # example
  $ docker run -d dev-loadbalance --net local -p 8080:80 kankuu/nginx-loadbalancer:alpha

  # is there some issue with network try to create network first
  $ docker network create network_name
  # example
  $ docker network create local
```

> How to `Run` with `docker-compose`

```bash
  # open docker-compose.yml file
  $ nano docker-compose.yml # use | vi | vscode | or other editor doesn't matter
  # configure your compose
```

the compose will be like bellow, you can modify all of those with your configuration

```yml
version: "3"

networks:
  local_net: 
    external:
      name: network_name

services:
  dev_lb:
    restart: always
    image: your_dockerhub_username/your_image_name:tag_name
    container_name: container_name
    working_dir: /etc/nginx/
    ports:
      - 80:80
      - 443:443
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./conf.d:/etc/nginx/conf.d
      - ./nginx_log:/var/log/nginx
      - ./report:/usr/share/nginx/html
      - ./pass:/etc/nginx/pass
    networks:
      - local_net
```

if any confuse on your mind, try my compose file.

```yml
version: "3"

networks:
  dev_net: 
    external:
      name: dev # run : docker network create dev

services:
# Web Server Container
  dev_lb:
    restart: 
    image: kankuu/nginx-loadbalancer:alpha
    container_name: dev-lb
    working_dir: /etc/nginx/
    ports:
      - 80:80
      - 443:443
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./conf.d:/etc/nginx/conf.d
      - ./nginx_log:/var/log/nginx
      - ./report:/usr/share/nginx/html
      - ./pass:/etc/nginx/pass
    networks:
      - dev_net
```

if anything is done, then try to `docker-compose up -d`

```bash
  $ docker-compose up -d
  # to check is there no error
  $ docker-compose logs
  # to check container is up or not
  $ watch docker ps -a | grep container_name
  # if status is Exited try to check container log
  $ docker logs container_name

  # on my case will be like this
  $ docker logs dev-lb # <- dev-lb is my container name
```

<kankuu> dont be hesitate to make `Issue` or `Pull Request` :>