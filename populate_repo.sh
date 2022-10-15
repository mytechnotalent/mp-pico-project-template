#!/bin/sh

rm -rf mp-template
cd ..
echo enter folder name:
read folder_name
mkdir $folder_name
cp mp-template/.gitignore
cp mp-template/LICENSE
cp mp-template/.vimrc $folder_name
cp mp-template/requirements.txt $folder_name
cp mp-template/bare_flash.sh $folder_name
cp mp-template/build.sh $folder_name
cp mp-template/copy_files_to_flash.sh $folder_name
cp mp-template/init.sh $folder_name
cd $folder_name
git init .
git config --global init.defaultBranch main
git branch -m main
./init.sh
