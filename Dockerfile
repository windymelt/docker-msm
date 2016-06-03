FROM centos:6

RUN set -x && \
    yum -y update && \
    yum -y install screen rsync zip cronie-anacron wget java-1.8.0-openjdk && \
    curl -fSsL http://git.io/6eiCSg > /etc/msm.conf && \
    mkdir /opt/msm && \
    useradd minecraft -M --home /opt/msm && \
    chown minecraft /opt/msm && \
    chmod -R 775 /opt/msm && \
    mkdir /dev/shm/msm && \
    chown minecraft /dev/shm/msm && \
    chmod -R 775 /dev/shm/msm && \
    curl -fSsL http://git.io/J1GAxA > /etc/init.d/msm && \
    chmod 755 /etc/init.d/msm && \
    chkconfig --add msm && \
    ln -s /etc/init.d/msm /usr/local/bin/msm && \
    yes | msm update && \
    curl -fSsL http://git.io/pczolg > /etc/cron.d/msm && \
    service crond start && \
    service crond reload && \
    msm jargroup create minecraft minecraft
EXPOSE 25565 25566
CMD ["msm", "higashiyoka", "start"]
CMD ["msm", "nishiyoka", "start"]
CMD ["bash"]

