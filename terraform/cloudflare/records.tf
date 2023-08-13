resource "cloudflare_record" "lab_wildcard" {
  for_each = var.nomad_client_ips

  name            = "*.lab"
  value           = each.key
  type            = "A"
  ttl             = 3600
  zone_id         = data.cloudflare_zone.almckay_io.id
  allow_overwrite = true
}

resource "cloudflare_record" "lab" {
  for_each = var.nomad_client_ips

  name            = "lab"
  value           = each.key
  type            = "A"
  ttl             = 3600
  zone_id         = data.cloudflare_zone.almckay_io.id
  allow_overwrite = true
}

resource "cloudflare_record" "www_lab" {
  for_each = var.nomad_client_ips

  name            = "www.lab"
  value           = each.key
  type            = "A"
  ttl             = 3600
  zone_id         = data.cloudflare_zone.almckay_io.id
  allow_overwrite = true
}

resource "cloudflare_record" "nas_east_server" {
  name            = "nas-east"
  value           = var.nas_east_server_ip
  type            = "A"
  ttl             = 3600
  zone_id         = data.cloudflare_zone.almckay_io.id
  allow_overwrite = true
}

resource "cloudflare_record" "www_nas_east" {
  name            = "www.nas-east"
  value           = var.nas_east_server_ip
  type            = "A"
  ttl             = 3600
  zone_id         = data.cloudflare_zone.almckay_io.id
  allow_overwrite = true
}

resource "cloudflare_record" "nas_west_server" {
  name            = "nas-west"
  value           = var.nas_west_server_ip
  type            = "A"
  ttl             = 3600
  zone_id         = data.cloudflare_zone.almckay_io.id
  allow_overwrite = true
}

resource "cloudflare_record" "www_nas_west" {
  name            = "www.nas-west"
  value           = var.nas_west_server_ip
  type            = "A"
  ttl             = 3600
  zone_id         = data.cloudflare_zone.almckay_io.id
  allow_overwrite = true
}