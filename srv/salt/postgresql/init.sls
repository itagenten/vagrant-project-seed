postgresql:
  pkg:
    - installed
  file.managed:
    - name: /var/lib/postgres/data/postgresql.conf
    - source: salt://postgresql/postgresql.conf.jinja
    - mode: 644
    - template: jinja
    - defaults:
        listen_addresses: 127.0.0.1
        max_connections: 10
        shared_buffers: 14MB
        effective_cache_size: 32MB
        timezone: 'Europe/Berlin'
    - require:
      - pkg: postgresql
  service.running:
    - enable: True
    - watch:
      - file: postgresql
