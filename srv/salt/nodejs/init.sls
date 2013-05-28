nodejs:
  apt_repository:
    - ubuntu_ppa
    - user: chris-lea
    - name: node.js
    - key_id: C7917B12
  pkg:
    - latest
    - names:
      - nodejs
    - require:
      - apt_repository: nodejs

npm:
  pkg:
    - installed

coffeescript:
  pkg:
    - installed
  require:
    - pkg: nodejs

