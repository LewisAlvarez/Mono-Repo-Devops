front-end:
install_node_dependencies:
    cmd.run:
      - name: "sudo yum install -y gcc-c++ make"
  install_node:
    cmd.run:
      - name: "curl -sL https://rpm.nodesource.com/setup_15.x | sudo -E bash - && sudo yum install nodejs -y"
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