#!/bin/bash

# Simple script to convert images to TIFF 300 DPI
# Converts JPG, JPEG, PNG, and HEIC files from Input/ to output/

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null && ! command -v convert &> /dev/null; then
    echo -e "${RED}Error: ImageMagick is not installed.${NC}"
    echo "Please install it first. See README.md for installation instructions."
    exit 1
fi

# Use 'magick' command if available (ImageMagick 7), otherwise 'convert' (ImageMagick 6)
if command -v magick &> /dev/null; then
    CONVERT_CMD="magick"
else
    CONVERT_CMD="convert"
fi

# Create output directory if it doesn't exist
mkdir -p output

# Counter for converted files
converted=0
skipped=0

echo -e "${GREEN}Starting image conversion to TIFF 300 DPI...${NC}"
echo ""

# Enable nullglob to handle cases where no files match
shopt -s nullglob

# Find and convert all images
for file in Input/*.{jpg,JPG,jpeg,JPEG,png,PNG,heic,HEIC}; do
    # Check if file exists (glob may not match anything)
    if [ ! -f "$file" ]; then
        continue
    fi
    
    # Get filename without path and extension
    filename=$(basename "$file")
    name="${filename%.*}"
    
    # Output file path
    output_file="output/${name}.tiff"
    
    echo -e "Converting: ${YELLOW}$filename${NC} -> ${GREEN}${name}.tiff${NC}"
    
    # Convert image to TIFF with 300 DPI
    if $CONVERT_CMD "$file" -density 300 -units PixelsPerInch -compress lzw "$output_file" 2>/dev/null; then
        ((converted++))
    else
        echo -e "${RED}Failed to convert: $filename${NC}"
        ((skipped++))
    fi
done

echo ""
echo -e "${GREEN}Conversion complete!${NC}"
echo "Files converted: $converted"
if [ $skipped -gt 0 ]; then
    echo -e "${YELLOW}Files skipped/failed: $skipped${NC}"
fi

if [ $converted -eq 0 ]; then
    echo -e "${YELLOW}No images found in Input/ directory.${NC}"
    echo "Please add JPG, JPEG, PNG, or HEIC files to the Input/ folder."
fi

