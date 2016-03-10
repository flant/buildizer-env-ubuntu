FROM ubuntu:12.04
MAINTAINER flant <256@flant.com>
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]

RUN bash -lec "\
sed -i s/mesg/#mesg/ /root/.profile; \
echo export DEBIAN_FRONTEND=noninteractive >> /etc/bash.bashrc"

RUN bash -lec "\
apt-get update; \
apt-get install -y curl vim build-essential"
