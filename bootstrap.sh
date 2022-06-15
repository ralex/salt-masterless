#!/bin/bash
# Bootstrap Saltstack
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sudo sh bootstrap_salt.sh -v -X -p python3-git stable

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
