TEX_PATH=lualatex
TEX_PARAMS=-interaction=nonstopmode -file-line-error
TEX=$(TEX_PATH) $(TEX_PARAMS)

PACKAGE_NAME=cv

BUILD_FOLDER=./build

all: clean build screenshot

clean:
	rm -rf $(BUILD_FOLDER)

build: clean
	mkdir $(BUILD_FOLDER) && \
	cd $(BUILD_FOLDER) && \
	cp ../$(PACKAGE_NAME).tex ../altacv.cls . && \
	$(TEX) $(PACKAGE_NAME).tex && \
	$(TEX) $(PACKAGE_NAME).tex && \
	cd .. && \
	cp $(BUILD_FOLDER)/$(PACKAGE_NAME).pdf .
	echo "🥳 PDF successfully built! 🥳"

# Requires Imagemagick
screenshot: build
	convert -density 300 $(BUILD_FOLDER)/$(PACKAGE_NAME).pdf -resize 30% $(PACKAGE_NAME).png

# lets not think about that
.phony: all clean build screenshot
