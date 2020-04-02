# 杂项

## 我工规范有歧义之处

各位刀客一定要先看清楚我工规范两大歧义之处：[版芯歧义](http://yanshuo.name/cn/2017/06/hithesisregulation/)和[本科生行距歧义](http://yanshuo.name/cn/2017/06/hithesissiyuan/)。

另外注意几处小歧义：

- 在[规范](http://hitgs.hit.edu.cn/aa/fd/c3425a109309/page.htm)中规定和[研究生word排版范例](http://hitgs.hit.edu.cn/ab/1f/c3425a109343/page.htm)的中文目录中出现的“ABSTRACT”和“Abstract”的写法歧义（规格严格功夫大家！！！）。
- 本科生论文官方模板的页眉页码格式混乱，有的有页码横线有的没有，有的有页眉有的没有。

## 关于模板的命名和其他说明

### 模板的命名

本模板对PlutoThesis中的核心代码进行了彻底深入的修改。
PlutoThesis中没有采用cls，这种文档类的模式，代码与正文内容耦合程度大难以维护，本科模板和硕博模板难以融合。
由于冥王星已经不是太阳系C9之一，所以不继续使用PlutoThesis命名。

hithesis, 既含我工hit，也是说用的“嗨！”，读作“嗨thesis”。

### 关于查重

注意：我工的论文查重可以使用pdf查重！！！！！！！

另外一点注意：查重的pdf一定要确保能够正常复制汉字。有些系统自动识别的汉字字体，
会出现无法正常复制的情况（可能是系统的字体映射出现了误差）。一般需要在主文件的
选项中明确声明使用哪一种fontset。

### 其他相关项目

- [hithesis-alpha](https://github.com/Regulust/hithesis-alpha)
  - 在hithesis的基础上进行的改编尝试，尝试添加开题/中期报告样式。
- [hithesis-beta](https://github.com/specialpointcentral/hithesis-beta)
  - 在hithesis-alpha的基础上进行的改编尝试，修复了一些bug，满足威海校区本科的开题，同时更新到了最新的hithesis。
