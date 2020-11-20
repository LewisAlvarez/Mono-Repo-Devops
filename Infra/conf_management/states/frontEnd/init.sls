frontEnd:
  install_node:
    cmd.run:
      - name: "sudo curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash - && sudo apt install nodejs"
  install_npm_back_dependencies:
    npm.bootstrap:
      - name: /srv/app/aik-back
  run_aik_back_portal:
    cmd.run:
      - name: "nohup node /srv/app/aik-back/server.js > output.log &"
  install_npm_front_dependencies:
    npm.bootstrap:
      - name: /srv/app/aik-front
  run_aik_front_portal:
    cmd.run:
      - name: "nohup node /srv/app/aik-front/server.js > output.log &"