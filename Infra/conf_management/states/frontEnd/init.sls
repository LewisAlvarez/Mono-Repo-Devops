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
    - name: https://github.com/LewisAlvarez/Mono-Repo-Devops
    - target: /srv/app
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