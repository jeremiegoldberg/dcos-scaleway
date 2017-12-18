# dcos-scaleway

Here is the terraform code to pop up your first [DC/OS](https://mesosphere.com/blog/dcos-1_10-kubernetes/) cluster

# Description :

The code as is will start 7 machines [on SCALEWAY](https://www.scaleway.com/), by far the cheapest easiest cloud provider I've found so far.

It will start :

* 3 VC1S ( 2 VCPUS, 2GB ram, €0.006/hour) as masters   
* 3 VC1M ( 4 VCPUS, 4GB ram, €0.012/hour) as slaves
* 1 VC1S as bootstrap server (kill it once the cluster is running)

# Terraform

If you're not familiar with [Terraform](https://www.terraform.io/) visit their [website](https://www.terraform.io/)

Terraform Installation documentation is [here](https://www.terraform.io/intro/getting-started/install.html)

The scaleway plugin is [described here](https://www.terraform.io/docs/providers/scaleway/index.html)

# Run the cluster

```
$ terraform init 
$ terraform get
$ terraform apply

```
It's pretty long considering it has to create all machines and security rules. Wait for it.

Once the console hangs giving you installer url go to https://<ip_of_any_master>:9000/

The terraform script will fill the masters' & slaves' IP addresses.

Follow the steps specified [here](https://dcos.io/docs/1.7/administration/installing/custom/gui/)

 * Copy/Paste **your ssh private key** (Corresponding to the ssh key you use to connect to your scaleway servers) into the GUI 
 * Choose the **ip_script.sh** file as IP Detect script 
 * Don't forget to kill the bootstrap server once done. 
