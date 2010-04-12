#!/bin/bash

if [ -d build ] ; then
    rm -r build
fi

TEX_FILE=researchPaper

#setup build structure
mkdir build
mkdir build/latex

#move required files in
find . -name '*.tex'  -exec cp '{}' build/latex/ \;
find . -name '*.bib' -exec cp '{}' build/latex/ \;
find . -name '*.groovy' -exec cp '{}' build/latex/ \;

#LaTeX
cd build/latex
latex $TEX_FILE.tex 2>/dev/null
latex $TEX_FILE.tex 2>/dev/null
bibtex $TEX_FILE.aux
latex $TEX_FILE.tex 2>/dev/null
pdflatex $TEX_FILE.tex
mv $TEX_FILE.pdf ../

if type open ; then
    open ../$TEX_FILE.pdf;
fi

#if [! -d ../../distro] ; then
#    mkdir ../../distro
#fi
#
#cp $TEX_FILE.pdf ../../distro
