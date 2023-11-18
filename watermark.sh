#!/bin/bash
watermark="© Robin Darlington | robindarlington.com"
output_dir="watermarked_images"
temp_text_file="temp_text.png"

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Create a temporary image with black text and blur
convert -size 800x200 xc:none \
  -gravity SouthWest -pointsize 36 -fill black -annotate +30+30 "$watermark" -channel A -blur 0x2 \
    -gravity SouthWest -pointsize 36 -fill black -annotate +30+30 "$watermark" -channel A -blur 0x1 \
  -gravity SouthWest -pointsize 36 -fill black -annotate +30+30 "$watermark" -channel A -blur 0x6 \
  "$temp_text_file"

# Overlay white text on the temporary image
convert "$temp_text_file" -gravity SouthWest -pointsize 36 -fill white -annotate +30+30 "$watermark" "$temp_text_file"


for file in *.jpg; do
    if [ -e "$file" ]; then
        output_file="$output_dir/watermarked_$file"

        # Overlay the combined text on the original image
        convert "$file" "$temp_text_file" -gravity SouthWest -composite "$output_file"

        echo "Watermark added to $file"
    fi
done

# Remove the temporary text image
rm "$temp_text_file"

echo "Watermarking process completed."
