#!/sbin/bash

INPUT="slides/$1.md"
OUTPUT="docs/$1.html"
REVEAL_URL=""

if [ ! -f "$INPUT" ]; then
	echo "ERROR : file $INPUT not found"
	exit 1
fi

if [ $2 = "--local" ]; then
	if [ ! -d docs/reveal.js ]; then
		echo "No Reveal.js found"
		exit 1
	fi
	REVEAL_URL="reveal.js"
elif [ $2 = "--cdn" ];then
	REVEAL_URL="https://cdn.jsdelivr.net/npm/reveal.js@4"
else
	echo "Please use either --local to use local revealjs or --cdn to use content delivery network"
fi

pandoc -t revealjs -s "$INPUT" -o "$OUTPUT"\
	-V revealjs-url=$REVEAL_URL\
	-V theme=moon\
	--mathjax

echo "✅ Built: $OUTPUT"

echo "Do I open it now ? [y/n]"
read answer

if [ $answer = "yes" -o $answer = "y" ]; then
	firefox "$OUTPUT"
fi
