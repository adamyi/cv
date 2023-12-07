both: cv_print.pdf cv_screen.pdf

print: cv_print.pdf

screen: cv_screen.pdf

cv_print.pdf: build/cv_print.pdf
	cp build/cv_print.pdf ./

cv_screen.pdf: build/cv_screen.pdf
	cp build/cv_screen.pdf ./

build/cv_print.pdf: build/cv_print.tex build/adamyi-cv.cls
	cd build; xelatex cv_print.tex
	cd build; xelatex cv_print.tex

build/cv_screen.pdf: build/cv_screen.tex build/adamyi-cv.cls
	cd build; xelatex cv_screen.tex
	cd build; xelatex cv_screen.tex

build/adamyi-cv.cls: src/adamyi-cv.cls build
	cp src/adamyi-cv.cls build/adamyi-cv.cls

build/cv_print.tex: src/cv.tex build REVISION
	python3 src/generate_versions.py

build/cv_screen.tex: src/cv.tex build REVISION
	python3 src/generate_versions.py

build:
	mkdir build

clean:
	\rm -r build
	rm cv_screen.pdf
	rm cv_print.pdf
