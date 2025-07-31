#!/bin/bash
coqdog_root="/home/copland/repos/CoqDog/"
coqdog_upload_folder=$coqdog_root"/uploaded_dir/"
theorems_root="/home/copland/am-repos-2/my_theorem_demo/"
#theorems_root=$THEOREMS_ROOT
rm -rf $coqdog_upload_folder"/external/"
mkdir $coqdog_upload_folder"/external/"
cp $theorems_root"/my_theorems/ImportantTheorem.v" $coqdog_upload_folder"/external/"
echo "File submitted to CoqDog."