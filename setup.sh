#!/usr/bin/env sh
sudo dnf --releasever=24 -y install \
  ansible-2.1.2.0 \
  python2 \
  python2-dnf
curl https://codeload.github.com/roadr/provision-dev-host/zip/master > /tmp/provision-dev-host.zip
unzip /tmp/provision-dev-host.zip -d /tmp
cd /tmp/provision-dev-host-master
ansible-playbook -i hosts.yaml dev-machine.yaml -K