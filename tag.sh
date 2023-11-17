case "${1}" in
  "engine")
    cd engine
    ;;
  "monibuca")
    cd monibuca
    ;;
  *)
   cd plugin-${1}
    ;;
esac

latest=$(git describe --tags `git rev-list --tags --max-count=1`)
echo $latest
read -p "Enter the tag name: " tag
git tag v${tag}
git push origin v${tag}
git push
# 获取 go 模块名
go_module_name=$(grep -E "^module\s+" go.mod | awk '{print $2}')
# 切换到 ../monibuca 目录并执行 go get
cd ../monibuca || exit
go get ${go_module_name}@v${tag}