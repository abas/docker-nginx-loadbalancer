FROM nginx:1.15.1

LABEL Kankuu <akhmadbasir5@gmail.com>

# package include
RUN echo "|--- installing package helper.." && \
    apt-get update -y && \
    apt-get install -y \
    nano curl iputils-ping net-tools wget && \
    echo "---| installing package helper complete"

# certbot
RUN echo "|--- installing certbot plugin.." && \
    wget https://dl.eff.org/certbot-auto && \
    chmod a+x certbot-auto && \
    echo "---| installing certbot complete"

# default expose port
EXPOSE 80
# command following line to disable SSL configuration
EXPOSE 443