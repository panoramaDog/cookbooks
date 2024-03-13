# Terraform

the documentation for the Proxmox provider can be found [here](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)

## Overview

In the terraform directory a credentials file needs to be created: `credentials.tf`

Contents of credentials file:

```terraform
do_api_token = "api_token_here"
```

In order to run the terraform, in the folder first issue the command `terraform init`. Next, you can use different `terraform` flags such as `terraform plan/validate/apply/destroy`.

## Importing Proxmox Resources

```bash
# import VM into terraform
# terraform import {{<resource mapping in .tf file>}} {{<node>/<type>/<vmid>}}
# remove brackets, those are placeholders for to show bounds of each variable
terraform import proxmox_vm_qemu.docker-host pve/vm/103

# import container into terraform
terraform import proxmox_lxc.twingate pve/lxc/102
```
