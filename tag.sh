read -p "Enter the dir name: " dir

case "${dir}" in
  "engine")
    cd engine
    ;;
  "monibuca")
    cd monibuca
    ;;
  *)
   cd plugin-${dir}
    ;;
esac

latest=$(git describe --tags `git rev-list --tags --max-count=1`)
echo $latest
read -p "Enter the tag name: " tag
git tag v${tag}
git push origin v${tag}
git push