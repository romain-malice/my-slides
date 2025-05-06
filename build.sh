#!/sbin/bash

INPUT="slides/$1.md"
OUTPUT="output/$1.html"

if [ ! -f "$INPUT" ]; then
	echo "ERROR : file $INPUT not found"
	exit 1
fi

pandoc -t revealjs -s "$INPUT" -o "$OUTPUT"\
	-V revealjs-url=./reveal.js\
	-V theme=moon\
	--mathjax

echo "Slideshow $OUTPUT successfully build !"

echo "Do I open it now ? [y/n]"
read answer

if [ $answer = "yes" -o $answer = "y" ]; then
	firefox "$OUTPUT"
fi
