Instalar Saltstack en instancias EC2:
    cmd.run:
    - name: "curl -L https://bootstrap.saltstack.com -o /srv/salt/bootstrap_salt.sh && sudo sh /srv/salt/bootstrap_salt.sh