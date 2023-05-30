deb [signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64] https://repo.saltproject.io/salt/py3/debian/11/amd64/latest bullseye main:
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltproject.io/salt/py3/debian/11/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg
    - aptkey: False

salt-minion:
  service.dead:
    - enable: False

/etc/salt/minion.d/file_client.conf:
  file.managed:
    - contents:
      - 'file_client: local'
    - user: root
    - group: root
    - mode: '0644'

/etc/salt/minion.d/fileserver.conf:
  file.managed:
    - source: salt://salt/fileserver.conf.j2
    - template: jinja
    - user: root
    - group: root
    - mode: '0644'

salt-call --local state.apply -l error:
  cron.present:
    - user: root
    - minute: '*/30'
