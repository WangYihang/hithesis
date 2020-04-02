# 模板特点

## 呆萌的操作，傲娇的效果

* 极限程度实现了[《哈尔滨工业大学研究生学位论文撰写规范》](http://hitgs.hit.edu.cn/aa/fd/c3425a109309/page.htm)、[《哈尔滨工业大学本科生毕业论文撰写规范》](http://jwc.hit.edu.cn/2566/list.htm)
* 这是[**PlutoThesis**](https://github.com/dustincys/PlutoThesis)的终极进化，PlutoThesis废弃不再维护。
* 更傻更简单的选项，例如论文主文件，只需要在文档类的括号中填写本硕博选项，字体选项（设置弹性间距或者刚性间距），文科生选项（目录可以设成四级目录），非全日制类型等，轻松设定目标格式。
* 自适应格式，例如图题和标题，标题字号在字数超过两行时自动由五号变小五号，实现自适应（硕博规范规定，字数多时用五号）
* 自动化中英文索引（博士规范要求，有需要时候添加）
* 图书馆提交论文级的电子版
* ...

## 矫正PlutoThesis的不足

* 纠正PlutoThesis页面向下溢出
* 纠正PlutoThesis不符合规范要求的各层次题序及标题不得置于页面的最后两行，改为不得置于最后一行（孤行），从此解决了饱受诟病的空白大的问题。
* 纠正PlutoThesis行间距与标题段前段后距离统统设置为1.6倍行距的问题
* 更强大的版芯设置，满足所有需求
* 补充了PlutoThesis没有的符号表、索引两项
* 字体设置符合CTeX的自动识别系统功能
* 纠正PlutoThesis中图片中一些距离设置
* 添加了符合规范要求的“图注在图题之上的设置”
* 纠正PlutoThesis的双语图、表题中英语的非两端对齐问题
* 添加了PlutoThesis中没有的图题最后一行居中且两端对齐格式
* 添加了所有的图形排版格式
* 纠正了附录中标题错误
* 纠正了博士论文右翻页问题
* 添加扫描替换功能，替换之后、页码目录书签自动设置
* 添加思源宋体设置，再也不用害怕奇怪字打不出来了
* 添加文科生、非全日制同等学力封面格式
* 添加PlutoThesis没有的说明文档
* ...

## 为了我工的规格严格、功夫到家

* 行间距、段前后距离设置精确到小数后四位， 例如 1bp = 1.00374pt，1mm = 2.84526pt， 按照我工之要求, 行距在3mm～4mm之间，换算之后为20.50398～23.33863bp，严格符合规范要求，哪怕是显微镜级别
* 规范明确规定，数字间空格要求为汉字宽度的四分之一（形式类似与 12 2345 和 0.123 456 这样多于3位以上的整数或小数）。默认情况下在LaTeX中任何人工输入的空格均不正确（“\:”为4/18汉字宽度，“\;”为5/18汉字宽度，所以PlutoThesis中的数字间宽度错误)。hithesis模板中定义了精准的数字间宽度。
* 重写了一堆重要函数，例如章节标题由原来的`BiChapter{}{}`方式进化为`chapter{}[**`，极大简化，后面方括号中为可选括号，硕本可以不用，用了自动忽略
* 严格符合（满足）两个规范要求，由于规范中有矛盾之处，例如本科生的标题段前距离有两处不一样的规定，刚性行距尽量满足行数（要求约33行）要求。
* 规范中给出了行距区间，为了规格严格，设置了弹性行距
* ...