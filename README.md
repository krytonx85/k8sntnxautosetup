# Kubespray Deployment on Nutanix

This is a small project which aims to quckly setup a production grade kubernetes cluster on Nutanix Prism Element using ansible and install addons like Nutanix CSI 2.0 ,istio and nginx ingress.  This is just for testing/poc purposes and in now way related supported by Nutanix .

It automates the following:
1. Download Centos Image
2. Create and Deploy 4 VMs on your Prism Element using nutanix v2 api calls 
3. Use Kubespray - deploy a default configuration kubernetes cluster
4. Deploy addons like 
  - Nutanix CSI 2.0 
  - Nginx Ingress
  - Istio Service Mesh

# About Kubespray
Please refer to these docs about kubespray:
- https://kubernetes.io/docs/setup/production-environment/tools/kubespray/
- https://kubespray.io/#/
- https://github.com/kubernetes-sigs/kubespray

# About Nutanix CSI

The CSI for Nutanix plugin provisions the storage backend for your PVC.
Refer [here](https://portal.nutanix.com/page/documents/details?targetId=CSI-Volume-Driver-v2_0:CSI-Volume-Driver-v2_0) for learning more on Nutanix CSI 2.0. 

# Requirement

1. python3 installed
2. ssh key pass installed
3. Highly recommend to install virtual env to install the python3 dependencies
4. network defined in the required_vars.yaml file should have IPAM enabled or dhcp server with DNS defined as each vm will be downloading the bits from internet


# Installation Instruction
1. Create a seperate directory and cd into it. 
```# mkdir myproject; cd myproject```
2. Create a virtual environment for python3 using virtualenv or venv. Refer [here](https://docs.python.org/3/library/venv.html) 
```
# mkdir myk8senv
# python3 -m venv myk8senv/
# source myk8senv/bin/activate
(myk8senv) # 
```

3. Clone the repo (recurisive as kubespray is a submodule)

```
git clone https://github.com/krytonx85/k8sntnxautosetup.git --recursive 
```

4. cd into the k8sntnxautosetup

```
cd k8sntnxautosetup
```

5. Install the python dependencies in k8sntnxautosetup
```
pip install -r requirements.txt
```

6. change prism_inventory.ym and required_vars.yml per your setup. Refer [here](#required-variables)
```
vi required_vars.yml ##change the values to match your environment. DONOT delete any params.
vi prism_inventory.yml ##change the details to match your prism element
```

6. run deploy_cluster.sh -  relax for 30-40 min to get a production grade K8s HA cluster up and running
```
sh deploy_cluster.sh 
```
7. copy the kubeconfig and use it for later

```
cp kubespray/inventory/mycluster/artifacts/admin.conf ~/.kube/admin.conf

```


# Required Variables

Prior to deployment - you need to modify the required_vars and prism_inventory files.

## 1. required_vars.yml variables
- centos_image_url - centos image download url. change it to some centos cloud image qcow file matching your local reqion for faster download
- ssh_keys - copy the public key of the user you are running the script from. These get copied to the k8s vm under root user for subsequent provisioning
- vm_network_name - name of the PE network that has ipam/dhcp and dns
- storage_ctr_name - name of the PE storage container name

## 2. prism_inventory.yml
- ansible_host - change it to the PE VIP
- ansible_user - leave it as nutanix
- ansible_ssh_pass - nutanix user ssh password
- pe_api_username - PE cluster admin user for making api calls 
- pe_api_password - PE cluster admin password


# Accessing the cluster
Your kubeconfig file is found in directory `kubespray/inventory/mycluster/artifacts`
# Configuration Notes
Following Config is created by default
   1. 4 VMs - 4 vcpu and 8GB RAM
   2. Kubernetes 1.17 with Calico
   3. Ingress Controller - Nginx
   4. Istio Service Mesh
   5. CSI 2.0 is deployed and default storage class created for ISCSI

   
 
# Import Notes
1. Highly recommend to install virtual env to install the python3 dependencies
2. Roughly should take about 30-40 min - if it takes more time - please check your internet connection to the prism element and worker vms.


