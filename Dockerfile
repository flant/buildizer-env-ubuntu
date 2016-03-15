FROM ubuntu:14.04
MAINTAINER flant <256@flant.com>
ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["/bin/bash"]

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

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
