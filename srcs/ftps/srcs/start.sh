#! /bin/sh

# start Telegraf
telegraf --config telegraf.conf &

echo root:pass | chpasswd

vsftpd etc/vsftpd/vsftpd.conf 