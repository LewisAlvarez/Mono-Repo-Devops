install_node_dependencies:
  cmd.run:
    - name: "sudo yum install -y gcc-c++ make"
install_node:
  cmd.run:
    - name: "curl -sL https://rpm.nodesource.com/setup_15.x | sudo -E bash - && sudo yum install nodejs -y"