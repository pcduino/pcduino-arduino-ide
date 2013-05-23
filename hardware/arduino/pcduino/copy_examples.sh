#!/bin/bash
src_dir=$1
dst_dir=$2
TOP=`pwd`

cd $src_dir
for i in *.c ;
do
    dir=`echo $i | cut -d'.' -f1`
    mkdir -p ${TOP}/${dst_dir}/pcDuino/${dir}
    cp $i ${TOP}/${dst_dir}/pcDuino/${dir}/${dir}.ino
done

