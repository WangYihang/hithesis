# 使用方法

1. 克隆仓库

    ```bash
    git clone https://github.com/WangYihang/hithesis
    ```

2. 修改 `main.tex`，配置所需的学位/校区信息

    ```tex
    % !Mode:: "TeX:UTF-8"
    \documentclass[
        ...
        type=bachelor,
        campus=harbin,
        stage=opening
    ]{hithesis}
    ```

3. 修改 `front/cover.tex` 修改论文题目、姓名、学号以及指导老师等信息

    ```tex
    \hitsetup{
        %******************************
        % 注意：
        %   1. 配置里面不要出现空行
        %   2. 不需要的配置信息可以删除
        %******************************
        ctitleone={局部多孔质气体静压},%本科生封面使用
        ctitletwo={轴承关键技术的研究},%本科生封面使用
        ctitlecover={局部多孔质气体静压轴承关键技术的研究},%放在封面中使用，自由断行
        ctitle={局部多孔质气体静压轴承关键技术的研究},%放在原创性声明中使用
        csubtitle={一条副标题}, %一般情况没有，可以注释掉
        cxueke={工学},
        csubject={机械制造及其自动化},
        caffil={机电工程学院},
        cauthor={于冬梅},
        csupervisor={某某某教授},
        % 日期自动使用当前时间，若需指定按如下方式修改：
        cdate={2024年04月01日},
        cstudentid={1200300101},
    }
    ```

4. 编写论文（建议每章在 body 中新建一个 tex 文件，便于逻辑上组织与后期维护）

    ```bash
    $ tree ./body/opening
    ├── 1-research-origin.tex
    ├── 2-research-background.tex
    ├── 3-research-content.tex
    ├── 4-research-plan.tex
    ├── 5-research-aim.tex
    ├── 6-research-requirements.tex
    └── 7-research-difficulties.tex
    ```

5. [编译论文](./COMPILE.md)
