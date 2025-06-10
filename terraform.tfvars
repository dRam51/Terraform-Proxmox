proxmox_api_url          = "https://<IP-of-Proxmox>/api2/json"
proxmox_api_token_id     = "root@pam!terraform"
proxmox_api_token_secret = "<your-secret-token>"

# Proxmox VM configuration
proxmox_node         = "<your-name>"
template_name        = "<template-name>"
storage_pool         = "<your-storage>"
iso_image            = "<file-path>"       #e.g "local:iso/rocky-9-x86_64-boot.iso"
network_bridge       = "<network-bridge>"
pm_user              = "<account-name>"
pm_password          = "<your-password>"
ssh_public_key_path  = "<file-path-to-ssh-key>"
