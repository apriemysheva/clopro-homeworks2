resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-public" {
  name           = "public"
  zone           = var.a-zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "subnet-private" {
  name           = "private"
  zone           = var.a-zone
  network_id     = yandex_vpc_network.network-1.id
  route_table_id = yandex_vpc_route_table.nat-route-table.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}

resource "yandex_vpc_route_table" "nat-route-table" {
  network_id = yandex_vpc_network.network-1.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat-instance-ip
  }
}
