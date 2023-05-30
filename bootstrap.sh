#!/bin/bash
# Bootstrap Saltstack
mkdir /etc/apt/keyrings

sudo curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring-2023.gpg https://repo.saltproject.io/salt/py3/debian/11/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg
echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/11/amd64/latest bullseye main" | sudo tee /etc/apt/sources.list.d/saltstack.list

sudo apt update
sudo apt install -y salt-common jq
sudo salt pip install GitPython

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
