#!/bin/sh

pandoc -s -S --highlight-style=espresso -c html.css -f markdown -t html5 -o readme.html readme.md
# pandoc -s -S --highlight-style=espresso --epub-stylesheet=epub.css --epub-cover-image=images/cover.jpg --epub-metadata=metadata.xml -f markdown -t epub -o readme.epub readme.md

# TEMPLATE=/Users/youichikato/tools/template-kanji.latex
# pandoc -s -S --highlight-style=espresso --template=$TEMPLATE --latex-engin=xelatex -o readme.pdf readme.md
