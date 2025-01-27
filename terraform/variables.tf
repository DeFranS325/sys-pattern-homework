variable "yc_token" {
    description = "Yandex Cloud OAuth Token"
    type = string
    sensitive = true
}

variable "yc_cloud_id" {
    description = "Yandex Cloud cloud id"
    type = string
}

variable "yc_folder_id" {
    description = "Yandex Cloud folder id"
    type = string
}

variable "yc_image_id" {
    description = "Yandex Cloud distrib image id"
    type = string
}

#Тип диска
variable "type_network_hdd" {
    description = "Тип диска ВМ"
    type = string
}

#Размер дисков
variable "disk_size_10" {
    description = "Size vm disk is 10Gb"
    type = number
}

variable "disk_size_20" {
    description = "Size vm disk is 20Gb"
    type = number
}

#Зоны
variable "zone_a" {
    description = "ru-central1-a"
    type = string
}

variable "zone_b" {
    description = "ru-central1-b"
    type = string
}

#Платформа
variable "standard_v3" {
    description = "id платформы для vm = standard-v3"
    type = string
}

#Имена дисков
variable "disk_vm_web1" {
    description = "Имя диск для сервера web1"
    type = string
}

variable "disk_vm_web2" {
    description = "Имя диск для сервера web2"
    type = string
}

variable "disk_vm_bastion" {
    description = "Имя диск для сервера bastion"
    type = string
}

variable "disk_vm_zabbix" {
    description = "Имя диск для сервера zabbix"
    type = string
}

variable "disk_vm_elastic" {
    description = "Имя диск для сервера elastic"
    type = string
}

variable "disk_vm_kibana" {
    description = "Имя диск для сервера kibana"
    type = string
}

#Протоколы
variable "protocol_any" {
    description = "ANY"
    type = string
}

variable "protocol_tcp" {
    description = "TCP"
    type = string
}

variable "protocol_icmp" {
    description = "ICMP"
    type = string
}