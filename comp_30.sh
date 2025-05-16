#!/bin/bash

# Set quality for WebP compression
QUALITY=30

# Define input and output directories
INPUT_DIR="."  # current directory
OUTPUT_DIR="./webp_output_$QUALITY"


# Create the output directory
mkdir -p "$OUTPUT_DIR"

# Convert images and preserve folder structure
find "$INPUT_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.tiff" \) | while read -r img; do
    # Relative path from input dir
    rel_path="${img#./}"
    rel_dir=$(dirname "$rel_path")
    filename=$(basename "$img")
    filename_no_ext="${filename%.*}"

    # Create output subdirectory if it doesn't exist
    mkdir -p "$OUTPUT_DIR/$rel_dir"

    # Set output path
    out_file="$OUTPUT_DIR/$rel_dir/$filename_no_ext.webp"
    out_file_location="$OUTPUT_DIR/$rel_dir/"

    #read width height <<< $(identify -format "%w %h" "$img")
    # Calculate the height-to-width ratio
    #ratio=$(echo "scale=4; $height / $width" | bc)




    #is_greater=$(echo "$ratio > 0.8" | bc)
    #if [ "$is_greater" -eq 1 ]; then
    #  # echo "The height-to-width ratio is greater than 0.8."
    #  magick "$img" -format "%h" info: | {
    #    read heightr
    #    widthr=$(awk "BEGIN { printf \"%.0f\", $heightr / 0.8 }")
    #    magick "$img" -gravity center -background white -extent ${widthr}x$heightr "$out_file"
    #  }

#--------------------------


#--------------------------



    #else
    #  cp "$img" "$out_file_location"
    #fi

    #magick "$out_file" -resize '1200x>' "$out_file"


    # Convert image
    echo "Converting: $img → $out_file"
    cwebp -q $QUALITY "$img" -o "$out_file"
done

# Zip the output directory
# ZIP_NAME="webp_output.zip"
# echo "Zipping $OUTPUT_DIR to $ZIP_NAME"
# zip -r "$ZIP_NAME" "$OUTPUT_DIR"

echo "Done!"

