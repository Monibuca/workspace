read -p "Enter the dir name: " dir
cd ${dir}
tag=$(git describe --tags `git rev-list --tags --max-count=1`)
echo $tag
git push --delete origin ${tag}
git tag -d ${tag}
git push -f
git tag ${tag}
git push --tag