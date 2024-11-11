deb [signed-by=/etc/apt/keyrings/salt-archive-keyring.pgp arch=amd64] https://packages.broadcom.com/artifactory/saltproject-deb stable main:
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public
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
