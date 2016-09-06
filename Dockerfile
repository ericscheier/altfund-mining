FROM ubuntu:latest
MAINTAINER eric@scheier.org

# Install cron
RUN apt-get update
RUN apt-get install cron

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron

# Add shell script and grant execution rights
ADD script.sh /script.sh
RUN chmod +x /script.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron

# Download and install minergate-cli
RUN wget https://minergate.com/download/deb-cli
RUN sudo dpkg -i deb-cli

# Run the command on container startup
CMD ./script.sh
