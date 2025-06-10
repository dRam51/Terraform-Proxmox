provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
}

resource "proxmox_vm_qemu" "rocky" {
  name        = "terraform-test"         
  target_node = var.proxmox_node          # Proxmox node to deploy the VM
  clone       = var.template_name         # Template to clone from
  full_clone  = true                      # Create a full clone (not linked)

  cpu {
    cores   = 2                          
    sockets = 1                          
  }

  memory  = 2048                         

  scsihw   = "virtio-scsi-single"         # SCSI controller type (recommended for Linux)
  bootdisk = "scsi1"                      # Boot from this disk slot

  # Main VM disk
  disk {
    slot     = "scsi1"                   
    type     = "disk"                    
    iothread = true                       # Enable IO thread for better performance
    size     = "20G"                     
    storage  = var.storage_pool           # Storage pool to use (e.g., local-lvm)
  }

  # Attach ISO as CD-ROM for installation
  disk {
    slot    = "ide2"                      # CD-ROM slot (can use ide0, ide1, etc.)
    type    = "cdrom"                     # CD-ROM device
    iso     = var.iso_image               # ISO file name (must be uploaded to Proxmox)
  }

  # Network interface configuration
  network {
    id     = 0                            # Network device index
    model  = "virtio"                     # Network device model (paravirtualized)
    bridge = var.network_bridge           # Proxmox network bridge (e.g., vmbr0)
  }

  ipconfig0 = "ip=dhcp"                   # Use DHCP for the first network interface

  sshkeys = file(var.ssh_public_key_path) # Inject SSH public key for access

  onboot = true                           # Start VM automatically on node boot
}
