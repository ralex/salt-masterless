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
    - sddm
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
    - trivy

  'os:Debian and roles:laptop':
    - match: grain
    - debian

  'roles:nginx':
    - match: grain
    - nginx
