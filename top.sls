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
    - taskwarrior-cds
    - trivy

  'G@os:Debian and G@roles:laptop':
    - match: compound
    - debian

  'roles:nginx':
    - match: grain
    - nginx
