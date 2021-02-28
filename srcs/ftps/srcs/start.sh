#! /bin/sh

echo root:pass | chpasswd

vsftpd etc/vsftpd/vsftpd.conf 