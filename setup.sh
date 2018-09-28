#!/usr/bin/env sh
echo "Installing basics to run ansible playbooks"
sudo dnf --releasever=28 -y install \
  ansible-2.6.4 \
  python2 \
  python2-requests \
  python2-dnf

echo "Downloading provision-dev-host scripts"
curl https://codeload.github.com/roadr/provision-dev-host/zip/java-update > /tmp/provision-dev-host.zip
unzip /tmp/provision-dev-host.zip -d /tmp
cd /tmp/provision-dev-host-java-update
ansible-playbook -i hosts.yaml dev-machine.yaml -K
