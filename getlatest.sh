#!/bin/bash

case "$1" in
  "engine")
    cd engine
    ;;
  "monibuca")
    cd monibuca
    ;;
  *)
   cd plugin-$1
    ;;
esac
git push -f
# 获取最新的 commit hash 值
commit_hash=$(git rev-parse HEAD)

# 获取 go 模块名
go_module_name=$(grep -E "^module\s+" go.mod | awk '{print $2}')

# 切换到 ../monibuca 目录并执行 go get
cd ../monibuca || exit
go get ${go_module_name}@${commit_hash}