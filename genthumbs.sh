#!/bin/bash

# genthumbs
# Check for dependencies
if ! type convert > /dev/null 2>&1; then 
	echo "Imagemagick suite (convert) required but not installed, please install it with your package manager"
	exit 1
fi

if ! type md5sum > /dev/null 2>&1; then 
  echo "md5sum required but not installed, please install it with your package manager"
  exit 1
fi

opti=1
if ! type optipng > /dev/null 2>&1; then 
	echo "optipng is not installed. Execution will continue but resulting thumbnails will be larger and unoptimized"
	echo "For optimal results, install optipng with your package manager"
	opti=0
fi

# Create subdirectories if needed
mkdir -p .sh_thumbnails/normal
mkdir -p .sh_thumbnails/large
# Loop files in current directory and generate thumbnails with proper metadata
for a in *.jp*; do 
	md5=`echo $a|md5sum|cut -d" " -f1` 
	mtime=`stat -c '%Y' "$a"`
	echo "Generating thumbnails for $a..."
	convert -thumbnail 128 -set Thumb::MTime "$mtime" -set Thumb::URI "$a" "$a" .sh_thumbnails/normal/$md5.png
	convert -thumbnail 256 -set Thumb::MTime "$mtime" -set Thumb::URI "$a" "$a" .sh_thumbnails/large/$md5.png
done

if [[ opti -eq 1 ]]; then
	echo "Optimizing thumbnail sizes..."
	optipng -o7 -quiet .sh_thumbnails/normal/*.png
	optipng -o7 -quiet .sh_thumbnails/large/*.png
fi

