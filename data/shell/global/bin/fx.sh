#!/bin/bash

# Server伺服器環境變數路徑，這邊原則上是固定的位置/data，本地環境測試需依照實際路徑調整
# FX_DIR='/data'
FX_DIR="/c/Users/yuiwe/fcb_doc/Batch_Shell_Doc/batch_shell_template/fx-batch"

# 將/data路徑添加到PATH環境變數中
export PATH="${PATH}:${FX_DIR}"

# 可再擴充其他全域變數，例如uat
export SPRING_PROFILE="systexlocal"

# 模擬API key存放
export API_KEY=""
