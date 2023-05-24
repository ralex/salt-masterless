base:
  '*':
    - salt

  'roles:laptop':
    - match: grain
    - asdf
    - bash
    - direnv
    - git
    - i3
    - joplin
    - keybase
    - kubernetes-client
    - pipewire
    - nodejs
    - minikube
    - salt
    - signal
    - sony-headphone-client
    - spotify
    - ssh.client
    - tailscale
    - taskwarrior
    - terminator
    - terraform
    - vagrant-libvirt
    - vim
    - vscode

  'roles:home':
    - match: grain
    - cura
    - docker
    - twitch

  'roles:work':
    - match: grain
    - common
    - docker-cds
    - nsgclient
    - taskwarrior-cds
    - trivy

  'G@os:Debian and G@roles:laptop':
    - match: compound
    - debian

  'roles:nginx':
    - match: grain
    - nginx
