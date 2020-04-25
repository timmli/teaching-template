SHELL := /bin/bash

HAUSARBEIT_FILES =  myMacros.tex \
	settings/text-settings.tex \
	$(wildcard packages/*.sty) \
	examples/hausarbeit-examples.tex \
	$(wildcard bst/biblatex-sp-unified/[^.]*) \
	hausarbeit-template.tex \
	references.bib

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

ESSAY_FILES =  myMacros.tex \
	settings/text-settings.tex \
	settings/scrarticle-settings.tex \
	$(wildcard packages/*.sty) \
	examples/essay-examples.tex  \
	$(wildcard bst/biblatex-sp-unified/[^.]*) \
	references.bib \
  essay-template.tex

test_essay:
	rm -fr test
	mkdir test
	cp -r --parents $(ESSAY_FILES) test
	cd test; \
			latexmk -pdf essay-template.tex

release_essay:
	rm -fr tmp
	mkdir temp
	cp -r --parents $(ESSAY_FILES) temp
	cd temp; zip -r essay-template.zip *; mv essay-template.zip ..
	rm -fr temp


#-------------------------------------------------------------------------------

release_all: release_hausarbeit release_essay

test_all: test_hausarbeit test_essay
