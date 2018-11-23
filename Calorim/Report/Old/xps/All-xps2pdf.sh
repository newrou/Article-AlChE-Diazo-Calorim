
find . *.xps -maxdepth 0 -type f -exec xpstopdf {} \;
mkdir -p ../pdf
mv *.pdf ../pdf
