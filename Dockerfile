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

# add package for certbot
RUN echo "|--- installing package helper.." && \
    apt-get install -y \
    binutils cpp cpp-6 dh-python gcc-6 libasan3 libatomic1 libc-dev-bin libc6-dev \
    libcc1-0 libcilkrts5 libexpat1-dev libgcc-6-dev libgomp1 libisl15 libitm1 \
    liblsan0 libmpc3 libmpdec2 libmpfr4 libmpx2 libpython-dev libpython-stdlib \
    libpython2.7 libpython2.7-dev libpython2.7-minimal libpython2.7-stdlib \
    libpython3-stdlib libpython3.5-minimal libpython3.5-stdlib libquadmath0 \
    libreadline7 libsqlite3-0 libssl1.1 libtsan0 libubsan0 linux-libc-dev mime-support \
    python-minimal python-pip-whl python-pkg-resources python2.7 python2.7-dev \
    python2.7-minimal python3 python3-minimal python3-pkg-resources \
    python3-virtualenv python3.5 python3.5-minimal readline-common

# default expose port
EXPOSE 80
# command following line to disable SSL configuration
EXPOSE 443
