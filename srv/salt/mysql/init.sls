mysql-server:
  pkg:
    - installed
mysql:
  service:
    - running
  require:
    - pkg: mysql-server

python-mysqldb:
  pkg:
    - installed

database-setup:
  mysql_user.present:
    - name: cowboy
    - password: cowboy
    - require:
      - pkg: python-mysqldb
      - service: mysql

  mysql_database.present:
    - name: app_dev
    - require:
      - mysql_user : database-setup

  mysql_grants.present:
    - grant: all privileges
    - database: app_dev.*
    - user: cowboy
    - require:
      - mysql_database : database-setup

