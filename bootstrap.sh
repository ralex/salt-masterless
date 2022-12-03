#!/bin/bash
# Bootstrap Saltstack
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/11/amd64/latest bullseye main' | sudo tee /etc/apt/sources.list.d/saltstack.list
curl https://repo.saltproject.io/salt/py3/debian/11/amd64/latest/salt-archive-keyring.gpg | sudo tee /etc/apt/trusted.gpg.d/salt-archive-keyring.gpg

sudo apt update
sudo apt install salt-common
sudo salt-pip install GitPython

mkdir -p /etc/salt/minion.d

# Set masterless minion
echo 'file_client: local' | sudo tee /etc/salt/minion.d/file_client.conf

# Configure 
sudo tee /etc/salt/minion.d/fileserver.conf << EOF
fileserver_backend:
  - git

file_ignore_regex:
  - ^\.git

gitfs_remotes:
  - https://github.com/ralex/salt-masterless
  - https://github.com/ralex/salt-laptop

EOF

echo 'Enter roles separated with comma (",") or press enter to skip grains setup.'
read grains

if [ ! -z $grains ]; then
    echo 'roles:' | sudo tee /etc/salt/grains
    for grain in $(echo $grains | sed "s/,/ /g"); do
        echo "  - ${grain}" | sudo tee -a /etc/salt/grains
    done
fi

sudo salt-call --local state.apply
