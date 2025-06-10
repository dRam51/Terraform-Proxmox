# Terraform-Proxmox
Terraform script to automate the deployment of a virtual machine in the Proxmox Virtual Environment.

# main.tf
This is the main configuration file.
It defines the Proxmox provider and the resources to create (your VM, disks, network, etc.).

# variables.tf
This declares all the variables used in your configuration.

Each variable you reference in main.tf (like var.proxmox_api_url, var.proxmox_node, var.storage_pool, etc.) should be declared here, often with descriptions and types.

# terraform.tfvars
This provides the actual values for the variables declared in variables.tf. Key-value pairs that set your environment-specific or sensitive data, such as API URLs, credentials, node names, template names, storage pools, ISO filenames, network bridges, and SSH key paths.
