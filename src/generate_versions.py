#!/usr/bin/python
# -*- coding: UTF-8 -*- 
import subprocess

fo_src = open("src/cv.tex", "r")
# fo_rev = open("REVISION", "r")
fo_print = open("build/cv_print.tex", "w")
fo_screen = open("build/cv_screen.tex", "w")
revision = subprocess.check_output(["git", "describe", "--dirty"]).strip().decode("utf-8") + "-n"
try:
    content = fo_src.read().replace('__REVISION__', revision)
    fo_print.write(content.replace('__VERSION__', ',print'))
    fo_screen.write(content.replace('__VERSION__', ''))
finally:
    fo_src.close()
    fo_print.close()
    fo_screen.close()
