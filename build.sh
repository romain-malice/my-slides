#!/sbin/bash

INPUT="content/$1.md"
OUTPUT="slides/$1.html"

if [ ! -f "$INPUT" ]; then
	echo "ERROR : file $INPUT not found"
	exit 1
fi

# For local use
pandoc -t revealjs -s "$INPUT" -o "$OUTPUT"\
	-V revealjs-url=./reveal.js\
	-V theme=moon\
	--slide-level 2\
	--mathjax

echo "✅ Built: $OUTPUT"

echo "Do I open it now ? [y/n]"
read answer

if [ $answer = "yes" -o $answer = "y" ]; then
	firefox "$OUTPUT"
fi
