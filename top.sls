base:
  '*':
    - salt

  'roles:laptop':
    - match: grain
    - bash
    - git
    - i3
    - keybase
    - kubernetes-client
    - nodejs
    - minikube
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

  'roles:work':
    - match: grain
    - common
    - docker-cds
    - joplin
    - taskwarrior-cds
    - trivy

  'G@os:Debian and G@roles:laptop':
    - match: compound
    - debian

  'roles:nginx':
    - match: grain
    - nginx
