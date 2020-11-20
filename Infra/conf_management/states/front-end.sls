install_npm_front_dependencies:
  npm.bootstrap:
    - name: /srv/app/aik-front
run_aik_front_portal:
  cmd.run:
    - name: "nohup node /srv/app/aik-front/server.js > output.log &"