#!/bin/bash

sftp_transfer() {
  echo "sftp_transfer start"
# 使用解密後的密碼 SFTP
#暫時註解
#sftp --password="${PASS}" $USER@$HOST <<EOF
#put $LOCAL_DIR/$FILE_TO_TRANSFER $REMOTE_DIR
#get $REMOTE_DIR/$FILE_TO_TRANSFER $LOCAL_DIR
#quit
#EOF

}

sftp_transfer_by_cert() {
# 使用 SSH 密鑰進行 sftp 傳輸
sftp -oIdentityFile=~/.ssh/id_rsa $USER@$HOST <<EOF
cd $REMOTE_DIR
put $LOCAL_DIR/$FILE_TO_TRANSFER
get $FILE_TO_TRANSFER $LOCAL_DIR
quit
EOF
}

transfer_to_sftp(){
  echo "transfer_to_sftp start"
# 使用解密後的密碼 SFTP
#暫時註解
#sftp --password="${PASS}" $USER@$HOST <<EOF
#put $LOCAL_DIR/$FILE_TO_TRANSFER $REMOTE_DIR
#get $REMOTE_DIR/$FILE_TO_TRANSFER $LOCAL_DIR
#quit
#EOF
}