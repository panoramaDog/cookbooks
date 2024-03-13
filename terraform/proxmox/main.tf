
# resource "proxmox_lxc" "twingate" {    
#     cores = 1
#     cpuunits = 1024
#     description = "macbook pw"
#     #hostname = "twingate"
#     memory = 512 # in MB
#     network {
#         name = "eth0"
#         bridge = "vmbr0"
#         firewall = true
#         gw = "10.100.10.1"
#         ip = "10.100.10.3/23"
#     }
#     onboot = true
#     rootfs {
#         size = "10G"
#         storage = "local-lvm"
#         #volume = "local-lvm:vm-102-disk-0"
#     }
#     swap = 512 # in MB
#     #vmid = 102
#     target_node = "pve"
#     unprivileged = true
# }   

resource "proxmox_lxc" "unifi-controller" {
    cores = 1
    description = "macbook pw\n"
    hostname = "unifi-controller"
    memory = 1024
    onboot = true
    ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    password = ""
    rootfs {
        size = "8G"
        storage = "local-lvm"
        #volume = "local-lvm:vm-106-disk-0"
    }
    start = true
    swap = 1024
    target_node = "pve"
    unprivileged = true
}

resource "proxmox_vm_qemu" "docker-host" {
    agent = 1
    ciuser = "root"
    cpu = "kvm64"
    cores = 4
    desc = "Ubuntu Server Focal Image with Docker pre-installed\n\n## Disk utilization command\n`gdu --ignore-dirs-pattern /mnt /`\n\n## Mount Media Share\n`mount -t cifs -o username=media,password=unraveled-deceptive-livable, //10.100.10.15/media //mnt/media`"
    full_clone = false
    memory = 12288 # in MB
    name = "docker-host"
    ipconfig0 = "ip=10.100.10.20/24,gw=10.100.10.1"
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }
    onboot = true
    qemu_os = "other"
    sockets = 1
    target_node = "pve"
    disks {
      virtio {
        virtio0 {
            disk{
                size = 200 # in GB
                storage = "storageSSD"
                replicate = true
                }
            }
        }
    }
    #vmid = "103"

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    scsihw = "virtio-scsi-pci"
}
