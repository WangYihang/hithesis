# 使用说明

## 关于模板的下载地址

模板有三个下载地址：

1. [github](https://github.com/dustincys/hithesis)
2. [gitee](https://gitee.com/dustincys/hithesis)
3. [CTAN](https://ctan.org/pkg/hithesis)

github和gitee的版本是同步且是最新的模板。
CTAN的版本一般会比较落后，但在每年年底会同步为最新版本。

## 模板版本要求

LaTeX 中的ctex package版本要求：

* ctex >= v2.4.3 (2016年9月份发布)

注意，如果下载最新版本（>= 2018）的texlive或Miktex或Mactex，如果使用自带的模板，可能会出现一些错误，因为自带的版本老。
查看自带版本的命令是

* `texdoc hithesis`

## 模板的编译方法

1. 生成论文格式文件(**第一步要生成 *.cls，*.cfg，*.ist，然后再生成论文**)

   * 如果是Linux/Mac执行 （此处作者没测试过Mac，如遇到问题到谈论区可以问一下热心刀客大侠们，比如陈登泰教授、郭大侠等）

   ```bash
   latex hithesis.ins
   ```

   * 如果是Windows执行（作者没测试过，如遇问题同上）

   ```bash
   lualatex hithesis.ins
   ```

   * 如果喜欢玩 make

   ```bash
   make cls
   ```

2. 如果你修改了论文的 stage （如：从 opening 修改为 interim，则需要重新根据步骤 1 生成论文格式文件）

3. 生成论文的方式

   * 手动狙击（源文件更改后每次编译逐行命令输入一轮）

   ```bash
   xelatex -shell-escape main.tex
   bibtex main
   xelatex -shell-escape main.tex
   xelatex -shell-escape main.tex
   splitindex main -- -s hithesis.ist  # 自动生成索引
   xelatex -shell-escape main.tex
   ```

   * 半自动精确射击（源文件更改后每次编译敲一次）

   ```bash
   make thesis
   ```

   * 全自动火力覆盖（只需要输入一次命令，源文件更改后自动识别更改自动编译）

   ```bash
   latexmk
   ```

4. 生成文档（没什么用，因为有文档也基本没人看）

   * 手动狙击（逐行命令输入一轮）

   ```bash
   xelatex hithesis.dtx
   makeindex -s gind.ist -o hithesis.ind hithesis.idx
   makeindex -s gglo.ist -o hithesis.gls hithesis.glo
   xelatex hithesis.dtx
   xelatex hithesis.dtx
   ```

   * 半自动精确射击（编译敲一次）

   ```bash
   make doc
   ```

## 打印版、电子版

注意，一般情况下，博士论文的打印版要求双面打印，本硕单面。
博士论文在双面打印成册时，规范中没有明确规定是否要右翻页（右翻页是每一章的起始位
置位于书的右侧页面），所以会出现DIY（或身不由己DIY）哪一处右翻页。
`openright`选项设置为真时，会将所有章（即所有部分，包括前文和后文）起始设置成右翻页。
如果想DIY（或身不由己DIY）在什么地方右翻页，将这个选项设置为false，然后在目标位
置添加`\cleardoublepage`命令即可。

最后向图书管提交的电子版不是右翻页且要求没有任何空白页，这时只需要设置选项`library=true`
即可，这时候会强制`openright=false`。然后什么都不用做，就会出现如同`Sirius`同学
的这种“书签还没整明白，论文居然已经通过了”的情况。

## 幻灯片

有些强迫症刀客喜欢用Beamer，推荐[progressbar主题](https://github.com/dustincys/progressbar)，
能够使用[pympress](https://github.com/Cimbali/pympress)播放双屏提示。
