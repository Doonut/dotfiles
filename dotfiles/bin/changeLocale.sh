ssh $1 "locale-gen en_US.UTF-8"
ssh $1 "echo 'LANG=en_US.UTF-8' > /etc/default/locale"
ssh $1 "reboot"

