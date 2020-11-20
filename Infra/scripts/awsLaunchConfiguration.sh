#!/bin/bash
sudo yum update -y
sudo yum install -y git 

#Clone salt repo
mkdir -p /srv/app
sudo chmod 777 /srv/app
sudo git clone --single-branch --branch instances-provision  https://github.com/LewisAlvarez/Mono-Repo-Devops /srv/app

#Install Salstack
#sudo mkdir /srv/salt/
#sudo curl -L https://bootstrap.saltstack.com -o /srv/salt/bootstrap_salt.sh && sudo sh /srv/salt/bootstrap_salt.sh
#sudo yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm
#sudo yum clean expire-cache;sudo yum -y install salt-minion;
#chkconfig salt-minion off
sudo yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm
sudo yum clean expire-cache;sudo yum -y install salt-minion; sudo chkconfig salt-minion off

#Put custom minion config in place (for enabling masterless mode)
sudo cp -r /srv/app/Infra/conf_management/minion.d /etc/salt/
sudo cp -r /srv/app/Infra/conf_management/states /etc/salt/
sudo cp -r /srv/app/Infra/conf_management/pillars /etc/salt/

sudo su
#echo -e 'grains:\n roles:\n  - back' > /etc/salt/minion.d/grains.conf
echo -e 'grains:\n roles:\n  - frontend' > /etc/salt/minion.d/grains.conf
## Trigger a full Salt run
exit
sudo salt-call state.apply
