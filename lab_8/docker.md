docker run -d -P --name test_sshd rastasheep/ubuntu-sshd:14.04
docker port test_sshd 22
ssh -p 49155 root@localhost
0.0.0.0:49153
:::49153
пользователя - root, пароль – root

sshfs -p 49153 root@localhost:/tmp/media/ ./mount_folder/
umount ./mount_folder/