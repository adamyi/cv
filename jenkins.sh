CV_REV=$((`cat REVISION`+1))
echo $CV_REV > REVISION
make both
git clone git@github.com:adamyi/yiad.am
cp cv_screen.pdf yiad.am/src/cv.pdf
cd yiad.am
./update_cv.sh $CV_REV
git commit -am "Auto update CV to rev $CV_REV"
git push origin master
cd ..
\rm -rf yiad.am
git add *.pdf
git add REVISION
git commit -m "Auto bump to rev $CV_REV"
git push origin master
