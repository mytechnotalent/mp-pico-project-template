#!/bin/sh

cd ..
echo enter folder name:
read folder_name
mkdir $folder_name
cp mp-pico-project-template/.gitignore $folder_name
cp mp-pico-project-template/LICENSE $folder_name
cp mp-pico-project-template/.vimrc $folder_name
cp mp-pico-project-template/requirements.txt $folder_name
cp mp-pico-project-template/flash.sh $folder_name
cp mp-pico-project-template/build.sh $folder_name
cp mp-pico-project-template/copy_files_to_flash.sh $folder_name
cp mp-pico-project-template/populate_submodules_on_clone.sh $folder_name
cp mp-pico-project-template/init.sh $folder_name
cd $folder_name
git init .
git config --global init.defaultBranch main
git branch -m main
./init.sh
