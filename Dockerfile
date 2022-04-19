FROM ubuntu:hirsute
ENV DEBIAN_FRONTEND noninteractive
ENV dockerdeploy true
RUN apt-get update && apt-get install -y systemd
COPY docker/systemctl.py /usr/bin/systemctl.py
RUN chmod +x /usr/bin/systemctl.py \
    && cp -f /usr/bin/systemctl.py /usr/bin/systemctl
COPY . librephotos-linux
WORKDIR /librephotos-linux
RUN ./install-librephotos.sh
EXPOSE 3000
WORKDIR /
COPY docker/entrypoint.sh /entrypoint.sh
CMD ["bash","/entrypoint.sh"]
