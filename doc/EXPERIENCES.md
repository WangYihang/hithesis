# LaTeX 坑与经验

本文将会介绍笔者在完成毕业设计（论文）中期报告中遇到的一些坑以及发现的可以提高效率的方法。笔者将会以**提问+回答**的方式来行文。本文面向具有一定 LaTeX 经验的用户，如果您第一次听说/接触 LaTeX，不妨移步文章末尾，在末尾处提供了许多优秀/经典的 LaTeX 入门教材。

> 广告时间：如果碰巧你也是工大的学生，在做毕业设计（论文）的时候不妨试试增强版的 [hithesis](https://github.com/WangYihang/hithesis)

### LaTeX 应该怎么读？

> [LaTeX, which is pronounced **«Lah-tech»** or **«Lay-tech»** (to rhyme with «blech» or «Bertolt Brecht»), is a document preparation system for high-quality typesetting.]([https://www.latex-project.org/about/](https://www.latex-project.org/about/)
)

### LaTeX 如何拼写？

- [x] LaTeX
- [ ] latex
- [ ] LaTex
- [ ] ...

### 有什么趁手的编辑器吗？

- VSCode
- LaTeX Workshop

### 为什么我插入的表格/图片没有乖乖呆在我插入的地方呢？

导致这个问题的原因是 LaTeX 的[**浮动体**](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions)以及其复杂的布局算法。

解决方案是：

1. **忘记**在 word 中的 `如下图`、`如上表` 的说法，而是使用 `\label` 与 `\ref` 的方式来引用表格/图片。
2. **不去管它们，布局在哪儿就是哪儿，拥抱 LaTeX 的浮动体布局算法。**

### 如何在论文中插入代码块？

插入代码块一般有两个模块可以使用：lstlisting 与 minted。

1. lstlisting  
    可以直接使用，但是功能较为简陋。
2. minted  
    依赖于 Python 以及 [Python Pygments](https://pygments.org/)，
    可以直接使用 `pip install pygments` 进行安装，并且需要将 `pygmentize.exe` 加入环境变量 `PATH` 中。
    由于 minted 会直接调用外部命令 `pygments` ，
    因此在编译的时候需要添加 `-escape-shell` 参数
    （注意这里 `-escape-shell` 中只有一个 `-` 而不是一般常见的 `--`）。
    另外 Minted 的功能更加全面，例如添加行号、支持过长的行自动换行、高亮制定行以及设置行号的起始值等（具体可参考文档 `texdoc minted`）。

示例：

1. 使用 `lstlisting` 宏包

    ```tex
    \begin{lstlisting}
    #!/usr/bin/env python

    def main():
        print("Hello world!")

    if __name__ == "__main__":
        main()
    \end{lstlisting}
    ```

2. 使用 `minted` 宏包

    ```tex
    \begin{minted}[breaklines,linenos,highlightlines={3-4,6-7},firstnumber=1]{python}
    #!/usr/bin/env python

    def main():
        print("Hello world!")

    if __name__ == "__main__":
        main()
    \end{minted}
    ```

### 如何在论文中插入算法伪代码？

笔者暂时未找到合适的伪代码宏包，可临时使用流程图代替（关于如何插入流程图请见后文）。

### 如何在论文中插入并排图片？

在插入并排图片的时候笔者遇到的**最大的坑**就是 LaTeX 中的换行机制。
在 LaTeX 中，想要另起一行有多种方式（如：在 `tex` 文件中增加一个空行；输入 `\\` 等）。因此如果需要插入 `M` 行 `N` 列的图片，只需要在第 `N` 个图片插入完成后，增加一个空行即可实现多行图片排列。

笔者在这里坑了好久，究其原因还是因为经常写 `Python`，在 `Python` 语言的规范中，函数与函数之间最好有空行，笔者就直接把这个规范迁移到了 `tex` 文件中，因此导致了结果不符合预期的情况。

下面给出两个例子

1. 插入两行两列的图片，带子标题

    ```tex
    \begin{figure}[htbp]
        \centering
        \subfigure{
            \begin{minipage}[t]{0.4\linewidth}
            \centering
            \includegraphics[width=\textwidth]{images/giao.png}
            \caption{第一行第一列}
            \end{minipage}
        }
        \subfigure{
            \begin{minipage}[t]{0.4\linewidth}
            \centering
            \includegraphics[width=\textwidth]{images/giao.png}
            \caption{第一行第二列}
            \end{minipage}
        }

        \subfigure{
            \begin{minipage}[t]{0.4\linewidth}
            \centering
            \includegraphics[width=\textwidth]{images/giao.png}
            \caption{第二行第一列}
            \end{minipage}
        }
        \subfigure{
            \begin{minipage}[t]{0.4\linewidth}
            \centering
            \includegraphics[width=\textwidth]{images/giao.png}
            \caption{第二行第二列}
            \end{minipage}
        }
        \caption{两行两列图片（带子标题）}
        \label{fig:2r2c}
    \end{figure}
    ```

2. 插入两行两列的图片，不带子标题

    ```tex
    \begin{figure}[htbp]
        \centering
        \subfigure{
            \begin{minipage}[t]{0.4\linewidth}
            \centering
            \includegraphics[width=\textwidth]{images/giao.png}
            \end{minipage}
        }
        \subfigure{
            \begin{minipage}[t]{0.4\linewidth}
            \centering
            \includegraphics[width=\textwidth]{images/giao.png}
            \end{minipage}
        }

        \subfigure{
            \begin{minipage}[t]{0.4\linewidth}
            \centering
            \includegraphics[width=\textwidth]{images/giao.png}
            \end{minipage}
        }
        \subfigure{
            \begin{minipage}[t]{0.4\linewidth}
            \centering
            \includegraphics[width=\textwidth]{images/giao.png}
            \end{minipage}
        }
        \caption{两行两列图片（不带子标题）}
        \label{fig:2r2c}
    \end{figure}
    ```

### 如何在论文中插入矢量图（如：流程图、系统架构图、UML图等）？

正牌做法应该是使用 `Tikz` 来进行图像的绘制。

但是笔者暂时没有充足的时间对其进行学习，因此采用了一种较为取巧的方法，下面对这种方法进行详细介绍。

使用的工具为 [Processon](https://www.processon.com/) 与 [InkScape](https://inkscape.org/)

**ProcessOn** 是一个在线协作绘图平台,为用户提供最强大、易用的作图工具!支持在线创作流程图、思维导图、组织结构图、网络拓扑图、BPMN、UML图、UI界面原型设计等。ProcessOn 在线画图比较舒服，也可以对节点进行批量对齐，和 draw.io 类似，创作结束之后可以导出为各种格式（如 SVG/PNG 等）。
该平台免费用户可以创建的文件数量有所限制，可以通过邀请好友、分享自己的作品等来扩充容量。

**InkScape** 是一款开源矢量图形编辑软件，与Illustrator、Freehand、CorelDraw、Xara X 等其他软件相似。

具体步如下：

1. 在 ProcessOn 上绘制出所需的图（所见即所得，简单高效）
2. 在 ProcessOn 上导出为 svg 格式
3. 使用 InkScape 中打开导出的 svg 文件
4. 调整 InkScape 文档属性（CTRL+SHIFT+D），选择**缩放到页面内容**
5. 在 InkScape 中将该 svg 文件另存为 PDF 格式
6. 使用 LaTeX 的 includegraphics` 命令来导入对应的图（矢量图）

### 如果学校没有提供校徽/Logo的矢量图应该怎么办？

由于笔者所在的学校官方并没有提供 LaTeX 模版，笔者经过一番搜索也没有找到学校 Logo 的矢量图，再加之实在是没有时间重新绘制，因此只好出此下策，具体方法如下：

- 首先在学校的官方网站中找到 Logo 的图片资源（一般是 PNG 文件），尽可能找清晰度较高的。
- 下载之后使用 Photoshop 把不需要的背景删掉，得到一个透明底纯黑色 Logo 的 PNG 图像。
- 使用 TeXLive 自带的工具 `bitmap2eps.exe` 对处理后的图片进行转换。
- 在图像文件上点击右键，打开方式，选择 `bitmap2eps.exe`，运行结束后会在被转换的 PNG 文件的同一目录中生成 eps 文件。
- 然后就可以在 tex 文件中使用 `\includegraphics[]{}` 命令来引入该 eps 文件了。

**eps** 是用 PostScript 语言描述的一种 ASCII 图形文件格式，在 PostScript 图形打印机上能打印出高品质的图形图像，最高能表示32位图形图像。

在一些教程中提到：不要再使用 eps 文件（笔者暂时还没有弄清楚为什么，因为教程里也没有说明原因，猜测可能是 eps 技术已经过时了的缘故？），而推荐使用 PDF 来插入矢量图。
但由于 hithesis 中本身学校的 Logo 与毕业设计（论文）的标题都使用了 eps 文件，这里也继承这种做法。

### 遇到了奇怪的问题，应该遵循什么样的流程来解决？

1. 查看终端错误日志

    查看编译器的输出日志，由于 LaTeX workshop 的默认配置中添加了 `` 参数，导致编译器在第一次出错之后不会立即停止，这样得到的报错信息会非常混乱（不得不吐槽 TeX 的报错信息，非常难看（不容易定位关键信息））。因此尽可能**在外部终端中手动编译**。

2. 阅读文档（Read the Fucking Manual）

    ```bash
    texdoc [package name]
    ```

    大部分的情况下，遇到报错可能是你没有仔细阅读对应的文档，导致对某些包的使用方式错误。

3. 求助身边的师兄/姐
4. [LaTeX 工作室 - 问答社区](https://wenda.latexstudio.net/)
5. [Stack Exchange](https://tex.stackexchange.com)

### 如何加快编译速度？

笔者暂时的做法是在**逐章节编译**，即在编写某一个具体章节的时候在 `main.tex` 中将对其他章节的引用全部注释掉。

### LaTeX 与 Word 以及 LaTeX (Beamer) 与 PPT 以及 LaTeX 与 Markdown 有些哪些区别呢？

用一句话来概括大概就是：
> 所见即所得与所见即所想这两种思想的区别

- Word 与 PPT 的缺点
  - Word 与 PPT 对数学公式的支持并不好（不容易编辑与修改）
  - PPT 在制作的时候没有良好的交叉引用与设置目录的功能（说白了就是对结构化的支持非常差）

- Markdown 的优点
  - 简易（同时也是缺点）
  - 支持一定程度的结构化（同时也是缺点）
  - 插入图片非常方便
  - 插入代码非常方便
  - 某些编辑器的功能可以扩展（例如添加绘制流程图的功能）

### LaTeX 有那些缺点呢？

1. LaTeX 的语法有点啰嗦（**功能强大**和**语法简洁**的互斥性），语法不如 Markdown 简洁（例如：插入代码，在 Markdown 中只需要使用三个反引号标记代码段的边界即可；LaTeX 中通常需要比较复杂的设置（如果你使用的是 Minted 并且想要高亮具体范围的行的话）
2. 插入图片比较麻烦，相比于成熟的 Markdown 编辑器可以直接从剪切板自动插入图片，LaTeX 需要将图片首先保存到硬盘，接着使用特殊的语法（`\includegraphics`）引用该图片，并且通常情况下需要手动调整图片尺寸。
3. 不支持动图（主要在 Beamer 中，对标 PPT）
4. 想自定义模版的显示效果比较麻烦（不像 PPT 那样可以直接修改，并且**所见即所得**）
5. 编译慢
6. 报错非常用户不友好（看得人眼瞎）
7. 不同的宏包有兼容性问题

### 如何判断当前场景是否适合使用 LaTeX？

- 适合使用 LaTeX 的场景

  1. 涉及大量数学公式（公式和）
  2. 大量参考文献需要进行引用
  3. 对排版的格式有严格要求（如：期刊、会议等论文投稿，毕业设计论文等）
  4. 涉及大量交叉引用

- 适合使用 Beamer 的场景
  - 教学（尤其是理论教学，如数学课）
    - Slides 中有大量数学公式（击中 PPT 对数学公式支持差的软肋）
    - Slides 中图片较少
    - 在教学结束后希望可以根据 Slides 生成讲义分发给听众

- 适合使用 PPT 的场景
  1. 为客户做汇报（如：科技公司发布会）
  2. PPT 中需要展示动图/视频等
  3. 没有特别需要页面间交叉引用的场景

- 适合使用 Word 的场景
  - 学校/公司明确要求使用 Word

- 适合使用 Markdown 的场景
  - 整理思路（草稿）
  - 技术文档

总之，要**在不同的场景选择最合适的工具**。

### 笔者遇到了哪些还未解决的问题？

1. Beamer 包与 hyperref 包的冲突

    在 Beamer 中，如果想要引用的 URL 中存在 Hashtag 部分，那么在编译的时候会报错。
    如果手动将 URL 中用于标记 hashtag 的井号（`#`）进行 URL 编码，则可以通过编译，但是 `%` 会被二次编码成为 `%2523`，导致原本想要引用的 URL 不能正确打开。（场景：引用 GitHub 仓库中某段指定行号的代码块）

    如：

    > [https://github.com/WangYihang/hithesis/blob/master/main.tex#L11-L13](https://github.com/WangYihang/hithesis/blob/master/main.tex#L11-L13)

2. minted 自动换行
当使用 Beamer （不确定其他文档类是否存在相同的问题）的时候并且某一行代码**过于长**（大约超过两倍 \textwidth）以至于需要进行两次以上换行才可以正常显示的时候，minted 会错误地**只进行一次换行**。

### LaTeX 有哪些高质量的学习资料？

- 视频教程
  - [刘海洋 · LaTeX 不快速的入门 - 跟着大神学习最纯正的 LaTeX 知识](https://www.bilibili.com/video/BV1s7411U7Pr)
  - [LaTeX 工作室](https://space.bilibili.com/209746320)
  
- 书籍/文字资料
  - [LaTeX 学习资料（分享密码：9mn2）](https://www.lanzous.com/b015bk95c)
    - **复旦大学 - 现代 LaTeX 入门讲座 - 曾祥东.pdf**
    - **漫谈 LaTeX 排版常见概念误区.pdf**
    - 清华大学未来通信兴趣团队 - 如何使用 LaTeX 排版论文.pdf
    - 上海交通大学致远学院 LaTeX 资料.zip
    - 武汉大学 - LaTeX 入门教程.zip
    - 西北农林科技大学 - LaTeX 科技排版 - 耿楠.zip
    - **一份不太简短的 LaTeX2e 介绍 - Tobias Oetiker.pdf**
    - Beamer Appearance Cheat Sheet.pdf
    - Combining LaTeX with Python.pdf
    - FontAwesome5 Icons.pdf
    - Fun with Beamer.pdf
    - India Tex users Group - LaTeX Tutorials.pdf
    - LaTeX 流程图.zip
    - LaTeX 入门 - 简版 - 刘海洋 - 只有一章多一点.pdf
    - **LaTeX 入门 - 刘海洋.pdf**
    - LaTeX Notes 雷太赫排版系统简介 - 包太雷.pdf
    - Tips and Tricks with Beamer for Economists.pdf