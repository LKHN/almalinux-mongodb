Install MongoDB Community Edition on AlmaLinux OS
=========

This role installs MongoDB Community Edition on AlmaLinux OS 8 and 9

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

```yaml
---
# defaults file for install-mongodb
mongodb_major_version: "5.0" # Major version of MongoDB
releasever: "8" # Use Mongo EL8 repositories. TODO: Delete it and change to $releasever after EL9 support.
enable_sha1: yes # Enable SHA1 for AlmaLinux OS 9's default crypto policy. TODO: Delete it after rpm packages signed with stronger than SHA-1.
install_atlas_cli: yes # Install the Atlas CLI
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - name: Install MongoDB on AlmaLinux OS
      hosts: all
      become: yes


      roles:
        - install-mongodb
License
-------

GPL-2.0-or-later

Author Information
------------------

Elkhan Mammadli | elkhan.mammadli@protonmail.com
