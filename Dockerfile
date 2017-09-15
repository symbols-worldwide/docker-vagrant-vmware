FROM symbols/vmware

LABEL maintainer="simon@widgit.com"

RUN VERSION=$(wget -O- https://releases.hashicorp.com/vagrant/ | fgrep 'href="/vagrant' | head -1 | sed -r 's/.*([0-9].[0-9].[0-9]).*/\1/') && \
    wget -O /root/vagrant.deb \
      https://releases.hashicorp.com/vagrant/${VERSION}/vagrant_${VERSION}_x86_64.deb && \
    dpkg -i /root/vagrant.deb && \
    rm /root/vagrant.deb && \
    apt-get -y update && \
    apt-get -y install rsync xorg && \
    vagrant plugin install vagrant-vmware-workstation && \
    apt-get -y clean

COPY run_vagrant_and_wait.sh /usr/local/bin/run_vagrant_and_wait.sh

CMD ["/usr/local/bin/run_vagrant_and_wait.sh"]
WORKDIR /vagrant

