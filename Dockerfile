FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    cron \
    sudo \
    vim \
    net-tools \
    iputils-ping \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash tester && echo "tester:panicatthedisco" | chpasswd && adduser tester sudo

COPY cronjob.sh /opt/cronjob.sh
RUN chmod +x /opt/cronjob.sh && chown tester:tester /opt/cronjob.sh

RUN echo "* * * * * root /opt/cronjob.sh" >> /etc/crontab
RUN echo "root_flag{crontab_pwned_successfully}" > /root/flag.txt && chmod 600 /root/flag.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22
CMD ["/entrypoint.sh"]
