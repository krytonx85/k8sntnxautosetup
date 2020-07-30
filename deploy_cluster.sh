# ansible-playbook -i prism_inventory.yml main.yaml
# ansible-playbook -i k8s_inventory.yml kubespray/cluster.yml -u root -e kubectl_localhost=true -e kubeconfig_localhost=true
ansible-playbook -i k8s_inventory.yml install_addons.yml -u root
