# Qi4j Testbed
#
# Build with: docker build . -t <yourname>/qi4j-testbed
# Run with: docker run -p 11211:11211 -p 6379:6379 -p 27017:27017 -d <yourname>/qi4j-testbed
#
# VERSION 1

FROM ubuntu:12.04

MAINTAINER Paul Merlin, paul@nosphere.org

# Dirty workaround for https://github.com/dotcloud/docker/issues/1724
RUN dpkg-divert --local --rename /usr/bin/ischroot && ln -sf /bin/true /usr/bin/ischroot

# Update distro
RUN apt-get update
RUN apt-get upgrade --yes

# Install and setup base tools
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes curl tree htop screen vim sudo supervisor
RUN echo "%sudo	ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN mkdir -p /var/log/supervisor

# Add APT repositories
RUN curl http://apt.basho.com/gpg/basho.apt.key | apt-key add -
RUN bash -c "echo deb http://apt.basho.com precise main > /etc/apt/sources.list.d/basho.list"
RUN apt-get update

# Install external services available in upstream repositories
RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes memcached redis-server mongodb-server mysql-server postgresql riak

# Setup services that need configuration
RUN mkdir -p /data/db/
# TODO MySQL & PostgreSQL

# Expose ports
# Memcached
EXPOSE 11211
# Redis
EXPOSE 6379
# MongoDB
EXPOSE 27017
# MySQL
EXPOSE 3306
# PostgreSQL
EXPOSE 5432
# Riak
EXPOSE 8087

# Setup supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
