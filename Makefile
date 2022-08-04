SHELL := /bin/bash

ABSCHLUSSARBEIT_FILES =  myMacros.tex \
	settings/text-settings.tex \
	$(wildcard packages/*.sty) \
	examples/abschlussarbeit-examples.tex \
	$(wildcard bst/biblatex-sp-unified/[^.]*) \
	abschlussarbeit-template.tex \
	references.bib

test_abschlussarbeit:
	rm -fr test
	mkdir test
	cp -r --parents $(ABSCHLUSSARBEIT_FILES) test
	cd test; \
			latexmk -pdf abschlussarbeit-template.tex

release_abschlussarbeit:
	rm -fr temp
	mkdir temp
	cp -r --parents $(ABSCHLUSSARBEIT_FILES) temp
	cd temp; zip -r abschlussarbeit-template.zip *; mv abschlussarbeit-template.zip ..
	rm -fr temp

#-------------------------------------------------------------------------------

HAUSARBEIT_FILES =  myMacros.tex \
	settings/text-settings.tex \
	settings/scrarticle-settings.tex \
	$(wildcard packages/*.sty) \
	examples/hausarbeit-examples.tex  \
	$(wildcard bst/biblatex-sp-unified/[^.]*) \
	references.bib \
  hausarbeit-template.tex

test_hausarbeit:
	rm -fr test
	mkdir test
	cp -r --parents $(HAUSARBEIT_FILES) test
	cd test; \
			latexmk -pdf hausarbeit-template.tex

release_hausarbeit:
	rm -fr temp
	mkdir temp
	cp -r --parents $(HAUSARBEIT_FILES) temp
	cd temp; zip -r hausarbeit-template.zip *; mv hausarbeit-template.zip ..
	rm -fr temp


#-------------------------------------------------------------------------------

release_all: release_abschlussarbeit release_hausarbeit

test_all: test_abschlussarbeit test_hausarbeit
