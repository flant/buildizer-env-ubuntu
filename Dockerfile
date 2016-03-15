FROM ubuntu:14.04
MAINTAINER flant <256@flant.com>
ENTRYPOINT ["/bin/bash", "--login", "-c"]
ENV LANG en_US.UTF-8
CMD ["/bin/bash"]

RUN bash -lec "\
sed -i s/mesg/#mesg/ /root/.profile; \
echo export DEBIAN_FRONTEND=noninteractive >> /etc/bash.bashrc"

RUN bash -lec "\
apt-get update; \
apt-get install -y curl vim build-essential"

RUN bash -lec "\
curl -sSL https://rvm.io/mpapis.asc | gpg --import -; \
curl -sSL https://get.rvm.io | bash -s stable"
RUN bash -lec "rvm install 2.2.1 --quiet-curl"

RUN bash -lec "gem install package_cloud"
