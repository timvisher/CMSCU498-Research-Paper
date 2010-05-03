#!/bin/bash
find . -name 'build' -type d -exec rm -r '{}' \;

TEX_FILE=researchPaper

if [ ! -z "$1" ] ; then
    echo $1;
    TEX_FILE=$1;
fi

#setup build structure
mkdir build
mkdir build/latex

#move required files in
find . \( -name '*.tex' -o -name '*.bib' -o -name '*.groovy' -o -name '*.png' -o -name '*.jpg' \)  -exec cp '{}' build/latex/ \;

#LaTeX
cd build/latex
pdflatex $TEX_FILE.tex 2>/dev/null
pdflatex $TEX_FILE.tex 2>/dev/null
bibtex $TEX_FILE.aux
pdflatex $TEX_FILE.tex
mv $TEX_FILE.pdf ../

if type open ; then
    open -a "/Applications/Adobe Acrobat 9 Pro/Adobe Acrobat Pro.app" ../$TEX_FILE.pdf;
fi

if [ ! -d ../../distro ] ; then
    mkdir ../../distro
fi
cp ../$TEX_FILE.pdf ../../distro/$TEX_FILE.pdf
