FROM ubuntu:latest
MAINTAINER eric@scheier.org

# Install cron
RUN apt-get -y update
RUN apt-get -y install cron
RUN apt-get -y install wget

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron

# Add shell script and grant execution rights
ADD script.sh /script.sh
RUN chmod u+x /script.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron

# Download and install minergate-cli
ADD https://minergate.com/download/deb-cli .
RUN dpkg -i deb-cli

# Run the command on container startup
CMD ./script.sh
