#!/bin/bash
cd monibuca
git push -f
# 从最新的 tag 获取版本号
latest_tag=$(git describe --tags --abbrev=0)
version=${latest_tag%-beta*}

# 获取当前时间并格式化为月日时分
now=$(date +"%m%d%H%M")

# 拼接 tag 名称
tag_name="${version}-beta${now}"

# 打新的tag
git tag $tag_name

# 显示消息
echo "New tag created: $tag_name"

git push --tag
