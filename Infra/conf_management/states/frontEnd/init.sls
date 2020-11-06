nodejs_prereq:
  pkg.installed:
    - pkgs:
      - gcc-c++
      - make
  cmd.run:
    - name: "curl -sL https://rpm.nodesource.com/setup_11.x | sudo -E bash -"

nodejs:
  pkg.installed:
    - name: nodejs
    
aik-ui:
  git.latest:
    - name: https://github.com/icesi-ops/aik-portal
    - target: /srv/app
install_npm_dependencies:
  npm.bootstrap:
    - name: /srv/app/aik-app-ui
run_aik_portal:
  cmd.run:
    - name: "nohup node /srv/app/aik-app-ui/server.js > output.log &"