data "tailscale_device" "nas_east_server" {
  name = var.nas_east_name
}

data "tailscale_device" "nas_west_server" {
  name = var.nas_west_name
}

data "tailscale_devices" "nomad_clients" {
  name_prefix = var.client_prefix
}