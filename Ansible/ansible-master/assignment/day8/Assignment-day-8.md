## The Assignment

 
1. Create 5 users with password, and these five users should have same permissions for a directory named ninja.(Directory can be created with the 5 users permmission.)
1. Create ssh key for each user so that  all those 5 users will be able to login through ssh.

1. Creat Logical Volume in any node machine.
1. need to installl lvm2 first using ansible.
1. Create ext4 type File System on the newly created logical volume.
1. Mount newly created file system.

## Resources

* [lvm](http://docs.ansible.com/ansible/latest/lvol_module.html)
* [file system](http://docs.ansible.com/ansible/latest/filesystem_module.html)
* [user](http://docs.ansible.com/ansible/latest/user_module.html)

 

