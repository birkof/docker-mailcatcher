# Import base image
FROM birkof/ubuntu

MAINTAINER Daniel STANCU <birkof@birkof.ro>

ENV DEBIAN_FRONTEND noninteractive

# Update & upgrade the package repository
RUN apt-get update \
    && apt-get upgrade -y

# Install postfix package & libraries
RUN apt-get install -yq \
    make \
    libsqlite3-dev \
    ruby \
    ruby-dev \
    mailutils

# Install Mailcatcher package
RUN gem install --no-ri --no-rdoc mailcatcher

# Set relayhost in postfix & reload postfix
RUN postconf -e relayhost=127.0.0.1:1025

# Add supervisor configurations
ADD supervisor/conf.d/ /etc/supervisor/conf.d/

# Clean up the mess
RUN apt-get remove --purge -y \
        build-essential \
        ruby-dev \
        libsqlite3-dev \
    && apt-get autoclean \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Exposed port/s (smtp & web)
EXPOSE 1080 1025
