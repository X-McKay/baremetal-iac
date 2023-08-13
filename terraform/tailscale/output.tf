output "lab_clients" {
  value = [
    for client in data.tailscale_devices.nomad_clients.devices : element(client.addresses, 0)
  ]
}

output "lab_servers" {
  value = [for client in data.tailscale_devices.nomad_clients.devices : element(client.addresses, 0)]
}

output "nas_east_server" {
  value = element(data.tailscale_device.nas_east_server.addresses, 0)
}

output "nas_west_server" {
  value = element(data.tailscale_device.nas_west_server.addresses, 0)
}
