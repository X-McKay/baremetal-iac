module "proxmox" {
  source = "./proxmox"
  # ssh_key       = var.proxmox_ssh_key
  proxmox_host  = var.proxmox_host
  template_name = var.proxmox_template_name
  nic_name      = var.proxmox_nic_name
  # vlan_num      = var.proxmox_vlan_num
  api_url      = var.proxmox_api_url
  token_secret = var.proxmox_token_secret
  token_id     = var.proxmox_token_id
}

module "tailscale" {
  source        = "./tailscale"
  api_key       = var.tailscale_api_key
  tailnet       = var.tailscale_tailnet
  nas_east_name = var.tailscale_nas_east_name
  nas_west_name = var.tailscale_nas_west_name
  client_prefix = var.tailscale_client_prefix
}

module "cloudflare" {
  source  = "./cloudflare"
  api_key = var.cloudflare_api_key
  email   = var.cloudflare_email

  nomad_client_ips   = module.tailscale.lab_clients
  nas_east_server_ip = module.tailscale.nas_east_server
  nas_west_server_ip = module.tailscale.nas_west_server
}
