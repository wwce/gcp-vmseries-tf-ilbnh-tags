## VM-Series Network Tags and TCP/UDP Internal Load Balancing

The purpose of this build is to demonstrate how to leverage Google Cloud Network Tags to route traffic to specific internal TCP/UDP load balancers that frontend separate VM-Series firewalls. 

Network tags make routes applicable only to instances that use the corresponding network tag and can be used for a variety of use-cases: 

* Prevention of cross-region traffic flows.
* Isolation of egress traffic between development environment and production environments.
* Create "swimming-lanes” to distribute traffic to different sets of load balanced firewalls.

The end result with network tags is you do not need to segregate different client instances into separate VPC networks, each pointing to their preferred internal TCP/UDP load balancer front-ending a  set of VM-Series firewalls. 

The build creates two sets of VM-Series firewalls (2 firewalls in each set) that are bootstrapped to secure inbound and outbound traffic from a single VPC network.  Network tags are used to route egress traffic from regionA through regionA VM-Series firewalls and regionB through regionB VM-Series firewalls. 

</br>
<p align="center">
<img src="https://raw.githubusercontent.com/wwce/gcp-vmseries-tf-ilbnh-tags/master/images/diagram.png">
</p>


### Prerequistes 
* Valid GCP Account with existing project
* Access to GCP Cloud Terminal or to a machine with a Terraform 1.0 installation

</br>

### How to Deploy
#### 1. Setup & Download Build
In your project, open GCP Cloud Terminal and run the following.
```
gcloud services enable compute.googleapis.com
ssh-keygen -f ~/.ssh/gcp-demo -t rsa -C gcp-demo
git clone https://github.com/wwce/gcp-vmseries-tf-ilbnh-tags; cd gcp-vmseries-tf-ilbnh-tags
```

#### 2. Edit terraform.tfvars
Open terraform.tfvars and edit variables (lines 1-4) to match your Project ID, deployment prefix, SSH Key (from step 1), and VM-Series type.

```
vi terraform.tfvars
```

<p align="center">
<b>Your terraform.tfvars should look like this before proceeding</b>
<img src="https://raw.githubusercontent.com/wwce/gcp-vmseries-tf-ilbnh-tags/master/images/tfvars.png" width="75%" height="75%" >
</p>

#### 3. Deploy Build
```
terraform init
terraform apply
```

</br>

### How to Destroy
Run the following to destroy the build and remove the SSH key created in step 1.
```
terraform destroy
rm ~/.ssh/gcp-demo*
```

</br>

### Support Policy
The guide in this directory and accompanied files are released under an as-is, best effort, support policy. These scripts should be seen as community supported and Palo Alto Networks will contribute our expertise as and when possible. We do not provide technical support or help in using or troubleshooting the components of the project through our normal support options such as Palo Alto Networks support teams, or ASC (Authorized Support Centers) partners and backline support options. The underlying product used (the VM-Series firewall) by the scripts or templates are still supported, but the support is only for the product functionality and not for help in deploying or using the template or script itself.
Unless explicitly tagged, all projects or work posted in our GitHub repository (at https://github.com/PaloAltoNetworks) or sites other than our official Downloads page on https://support.paloaltonetworks.com are provided under the best effort policy.
