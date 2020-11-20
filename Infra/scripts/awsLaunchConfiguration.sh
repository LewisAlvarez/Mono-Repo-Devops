#!/bin/bash
sudo yum update -y
sudo yum install -y git 

#Clone salt repo
sudo mkdir -p /srv/app
sudo chmod 777 /srv/app
git clone https://github.com/LewisAlvarez/Mono-Repo-Devops /srv/app
sudo cd /srv/app
git checkout instances-provision
git pull origin instances-provision
#Install Salstack
sudo yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm
sudo yum clean expire-cache;sudo yum -y install salt-minion; sudo chkconfig salt-minion off

#Put custom minion config in place (for enabling masterless mode)
sudo cp -r /srv/app/conf_management/minion.d /etc/salt/

#echo -e 'grains:\n roles:\n  - back' > /etc/salt/minion.d/grains.conf
echo -e 'grains:\n roles:\n  - mateito' > /etc/salt/minion.d/grains.conf
## Trigger a full Salt run
sudo salt-call state.apply
