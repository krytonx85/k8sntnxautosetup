# Kubespray Deployment on Nutanix

This is a small project which automates the following:
1. Download Centos Image
2. Create and Deploy 4 VMs on your Prism Element using nutanix v2 api calls 
3. Use Kubespray - deploy a default configuration kubernetes cluster
4. Deploy addons like 
  - Nutanix CSI 2.0 
  - Nginx Ingress
  - Istio Service Mesh
