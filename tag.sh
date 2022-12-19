read -p "Enter the dir name: " dir
cd ${dir}
latest=$(git describe --tags `git rev-list --tags --max-count=1`)
echo $latest
read -p "Enter the tag name: " tag
git tag ${tag}
git push origin ${tag}