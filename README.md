# python编译器
## 作者：Sen
## email : tianhuzong@qq.com

# 简介

这个脚本利用cython把python编译成C语言，然后编译成可执行文件。

## 用法
准备一个python文件`a.py`
```python
#a.py
print("I am a.py!")
```
那么
```bash
$ ./py_compiler.sh a.py
请输入python版本(例如python3.10):python3.10
请输入输出文件名:main
a.py 的C文件build_py/temp/a.py.c 已经生成
main已生成
$ ls
main
$ ./main
I am a.py!
$
```

## 许可证
MIT
