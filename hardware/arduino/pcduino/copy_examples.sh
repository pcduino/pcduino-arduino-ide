#!/bin/bash
src_dir=$1
dst_dir=$2
TOP=`pwd`

pcduino_example_dir=${TOP}/${dst_dir}/00.pcDuino
cd $src_dir
for i in *.c ;
do
    dir=`echo $i | cut -d'.' -f1`
    mkdir -p ${pcduino_example_dir}/${dir}
    cp $i ${pcduino_example_dir}/${dir}/${dir}.ino
    #fix for tone_test
    if [ "$dir" = "tone_test" ]; then
        cp pitches.h ${TOP}/linux/work/hardware/arduino/pcduino/cores/arduino/ -f
    fi
done

cd ${pcduino_example_dir}
rm 0* -rf
mkdir -p 02.Linker_kits/
for i in linker_* ;
do
    mv $i 02.Linker_kits/
done

mkdir -p 03.Liquidcrystal/ && mv liquidcrystal* 03.Liquidcrystal/
mkdir -p 04.NFC/ && mv pn532* 04.NFC/
mkdir -p 01.Basics/ && mv *_test/ 01.Basics/
