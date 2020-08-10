# Kubespray Deployment on Nutanix

This is a small project which automates the following:
1. Download Centos Image
2. Create and Deploy 4 VMs on your Prism Element using nutanix v2 api calls 
3. Use Kubespray - deploy a default configuration kubernetes cluster
4. Deploy addons like 
  - Nutanix CSI 2.0 
  - Nginx Ingress
  - Istio Service Mesh


# Installation Instruction
```
mkdir myproject
cd myproject
python3 -m pip install --upgrade pip
pip3 install virtualenv
git clone https://github.com/krytonx85/k8sntnxautosetup.git
pip install -r k8sntnxautosetup/requirements.txt
cd k8sntnxautosetup
vi required_vars.yml ##change the values to match your environment. DONOT delete any params.
vi prism_inventory.yml ##change the details to match your prism element
```

# Requirement
1. python3 installed
2. ssh key pass installed
3. Highly recommend to install virtual env to install the python3 dependencies

# Configuration Notes
1. Following Config is created by default
   a. 4 VMs - 4 vcpu and 8GB RAM
   b. Kubernetes 1.17 with Calico
   c. Ingress Controller - Nginx
   d. Istio Service Mesh
   
 
# Import Notes
1. Highly recommend to install virtual env to install the python3 dependencies
2. Roughly should take about 30-40 min - if it takes more time - please check your internet connection to the prism element and worker vms.



