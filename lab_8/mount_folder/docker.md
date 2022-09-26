docker run -d -P --name test_sshd rastasheep/ubuntu-sshd:14.04
docker port test_sshd 22
ssh -p 49153 root@localhost
0.0.0.0:49153
:::49153
пользователя - root, пароль – root