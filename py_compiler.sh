#!/bin/bash

read -rp "请输入python版本(例如python3.10):" pyversion &&
    read -rp "请输入输出文件名:" outfile &&
    mkdir -p build_py/temp/c || exit

objs=()
for i in "$@"; do
    file_name="build_py/temp/$i.c"
    cython "$i" -o "$file_name" --embed --3str
    echo "$i 的C文件$file_name 已经生成"
    gcc -c $file_name "$("$pyversion-config" --ldflags --cflags --includes)"  -o "build_py/temp/c/$i.o"
    objs+="$i.o"
done

cd build_py/temp/c || exit

gcc "${objs[@]}" -o $outfile "$("$pyversion-config" --ldflags --cflags --includes)"  -l$pyversion
cp -- $outfile ../../..
echo "${outfile}已生成"
