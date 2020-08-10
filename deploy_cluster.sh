ansible-playbook -i prism_inventory.yml main.yaml &&
ansible-playbook -i kubespray/inventory/mycluster/hosts.yml kubespray/cluster.yml  -u root  -e kubeconfig_localhost=true -e kubectl_localhost=true &&
ansible-playbook -i kubespray/inventory/mycluster/hosts.yml install_addons.yml -u root
