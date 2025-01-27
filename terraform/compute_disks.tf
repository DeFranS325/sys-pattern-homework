resource "yandex_compute_disk" "disk-web-1" {
  name     = var.disk_vm_web1
  type     = var.type_network_hdd
  zone     = var.zone_a
  image_id = var.yc_image_id
  size     = var.disk_size_10  
}

resource "yandex_compute_disk" "disk-web-2" {
  name     = var.disk_vm_web2
  type     = var.type_network_hdd
  zone     = var.zone_b
  image_id = var.yc_image_id
  size     = var.disk_size_10  
}

resource "yandex_compute_disk" "disk-bastion" {
  name     = var.disk_vm_bastion
  type     = var.type_network_hdd
  zone     = var.zone_b
  image_id = var.yc_image_id
  size     = var.disk_size_10  
}

resource "yandex_compute_disk" "disk-zabbix" {
  name     = var.disk_vm_zabbix
  type     = var.type_network_hdd
  zone     = var.zone_b
  image_id = var.yc_image_id
  size     = var.disk_size_10  
}

resource "yandex_compute_disk" "disk-elastic" {
  name     = var.disk_vm_elastic
  type     = var.type_network_hdd
  zone     = var.zone_b
  image_id = var.yc_image_id
  size     = var.disk_size_20  
}

resource "yandex_compute_disk" "disk-kibana" {
  name     = var.disk_vm_kibana
  type     = var.type_network_hdd
  zone     = var.zone_b
  image_id = var.yc_image_id
  size     = var.disk_size_10  
}
