svgs:
	@find . -name "*.eps" | while read eps; do \
		logoName=$$(echo $$eps | sed 's/.eps//'); \
		ps2pdf -dEPSCrop "$$eps" "$$logoName.pdf"; \
    echo "$$logoName.pdf"; \
		/usr/local/Cellar/inkscape/0.48.2-1/Inkscape.app/Contents/Resources/bin/inkscape -z -f "$$logoName.pdf" -l "$$logoName.svg" 2&>/dev/null; \
		/usr/local/Cellar/inkscape/0.48.2-1/Inkscape.app/Contents/Resources/bin/inkscape -f "$$logoName.svg" --verb FitCanvasToSelectionOrDrawing --verb FileSave --verb FileClose 2&>/dev/null; \
		svgo "$$logoName.svg"; \
    rm "$$logoName.pdf"; \
	done
