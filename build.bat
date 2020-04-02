echo "Generating format files..."
lualatex hithesis.ins
echo "Building..."
xelatex -shell-escape main.tex
bibtex main
xelatex -shell-escape main.tex
xelatex -shell-escape main.tex
splitindex main -- -s hithesis.ist  # 自动生成索引
xelatex -shell-escape main.tex
echo "Finished..."
