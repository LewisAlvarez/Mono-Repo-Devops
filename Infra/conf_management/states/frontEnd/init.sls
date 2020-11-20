frontEnd:
install_node:
  cmd.run:
    - name: "sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && sudo apt install nodejs"
install_npm_dependencies:
  npm.bootstrap:
    - name: /srv/app/aik-back
run_aik_portal:
  cmd.run:
    - name: "nohup node /srv/app/aik-back/server.js > output.log &"
install_npm_dependencies:
  npm.bootstrap:
    - name: /srv/app/aik-front
run_aik_portal:
  cmd.run:
    - name: "nohup node /srv/app/aik-front/server.js > output.log &"