#!/usr/bin/env sh
sudo dnf --releasever=24 -y install \
  ansible-2.1.2.0 \
  python2 \
  python2-dnf
ansible-playbook -i hosts.yaml dev-machine.yaml -K
