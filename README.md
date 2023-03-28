# ParallelPrefixAdder-BrentKung
Parallel Prefix Adder - BKA
对于BK型并行前缀加法器，关键是树形结构的构造。上图中每个黑点表示做一次运算: 
![image](https://user-images.githubusercontent.com/74367745/228293979-464da668-d9cd-4a37-bae3-8b7dd89df914.png)
首先通过计算p和g，再按照树形结构计算G和P，根据G、P、cin计算每一位的进位信号C，从而得到s与cout。
组合逻辑较复杂，部分代码能够循环生成，剩余的直接手动生成。
