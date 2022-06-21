# Install MongoDB Community Edition on AlmaLinux OS

## How to run

### AWS:

Use one of the authentication methods from [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)

You need to set these Terraform variables in the `provision/terraform.tfvars` file:

```hcl
key_name             = "EC2 KEY PAIR NAME"
ssh_private_key_path = "~/.ssh/YOUR_SSH_PRIVATE_KEY_FILE"
```
Check the `variables.tf` file for customizing other variables for your needs.

Create the EC2 Instances:

```bash
pushd provision
terraform init
terraform apply # Add -auto-approve for non-interactive
popd
``` 
After the provision the Terraform will generate an Ansible `configuration/inventory.yaml` inventory file.

Start the installation:

```bash
ansible-playbook -i configuration/inventory.yaml configuration/main.yaml
```

## Variables

### Terraform

Path: `provision/variables.tf`

`instance_type_amd64` : Instance type for the x86_64/amd64 AlmaLinux OS AMIs. default: `t2.small`

`instance_type_arch64` : Instance type for the x86_64/amd64 AlmaLinux OS AMIs. default: `t4g.small`

`security_groups` : List of the security groups for the instances. default: `TCP/22 0.0.0.0/0`



### Ansible

Path: `configuration/install-mongodb/defaults/main.yml`

```yaml
---
# defaults file for install-mongodb
mongodb_major_version: "5.0" # Major version of MongoDB
releasever: "8" # Use Mongo EL8 repositories. TODO: Delete it and change to $releasever after EL9 support.
enable_sha1: yes # Enable SHA1 for AlmaLinux OS 9's default crypto policy. TODO: Delete it after rpm packages signed with stronger than SHA-1.
install_atlas_cli: yes # Install the Atlas CLI
```
## How to run by groups:
There're currently two type of groups availaible, OS version and architecture

### OS version:

AlmaLinux OS 8:

```bash
ansible-playbook -i configuration/inventory.yaml configuration/main.yaml -l almalinux_8
```
AlmaLinux OS 9:

```bash
ansible-playbook -i configuration/inventory.yaml configuration/main.yaml -l almalinux_9
```

#### Architecure

`x86_64/amd64`:

```bash
ansible-playbook -i configuration/inventory.yaml configuration/main.yaml -l amd64
```

`AArch64`:

```bash
ansible-playbook -i configuration/inventory.yaml configuration/main.yaml -l aarch64
```

## Requirements
* Terraform `>= 0.15`
* Ansible `>= 2.12`
* AWS API Credentials
