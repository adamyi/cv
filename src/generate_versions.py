#!/usr/bin/python
# -*- coding: UTF-8 -*- 

fo_src = open("src/cv.tex", "r")
fo_rev = open("REVISION", "r")
fo_print = open("build/cv_print.tex", "w")
fo_screen = open("build/cv_screen.tex", "w")
try:
    content = fo_src.read().replace('__REVISION__', fo_rev.read().strip())
    fo_print.write(content.replace('__VERSION__', ',print'))
    fo_screen.write(content.replace('__VERSION__', ''))
finally:
    fo_src.close()
    fo_print.close()
    fo_screen.close()
