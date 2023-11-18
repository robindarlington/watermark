# watermark
Simple shell script for adding a text-based watermark to all jpg images in current directory thanks to ImageMagick.

Useful for batch watermarking images prior to upload to a website or social media etc.

## How to use
- Put the watermark.sh in the directory containing your .jpg images.
- Adjust permissions : 
    `chmod +x watermark.sh`
- Adjust the watermark variable to set your desired text:
    `watermark="YOUR TEXT HERE"`
- Run the script from the directory containing the images and watermark.sh file:
    `./watermark.sh`
- Go check your images in watermarked_images/ (unless you changed the name for that too!)
