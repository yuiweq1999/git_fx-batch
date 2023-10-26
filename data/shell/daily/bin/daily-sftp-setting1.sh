#!/bin/bash

# 用來解密密碼的密碼
ENC_PASS="123456"
# 這是加密過的密碼
SFTP_PASS="加密過的密碼"

# 加密密碼
# ENCRYPTED_PASSWORD=$(echo "${SFTP_PASS}" | openssl enc -aes-256-cbc -a -salt -pass pass:${ENC_PASS})

# SFTP 連線參數
# SFTP_UAT
HOST="10.20.206.xxx"
USER="sysadm1"




