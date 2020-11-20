install_npm_back_dependencies:
  npm.bootstrap:
    - name: /srv/app/aik-back
run_aik_back_portal:
  cmd.run:
    - name: "node /srv/app/aik-back/server.js > ~/output.log &"