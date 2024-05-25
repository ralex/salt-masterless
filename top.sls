base:
  '*':
    - salt

  'roles:laptop':
    - match: grain
    - asdf
    - bash
    - direnv
    - firefox
    - firefox.nightly
    - git
    - joplin
    - logseq
    - minikube
    - nodejs
    - pipewire
    - regolith-desktop
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
    - logseq
    - regolith-desktop

  'G@os:Debian and G@roles:laptop':
    - match: compound
    - debian

  'roles:nginx':
    - match: grain
    - nginx
