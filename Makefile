PROJECT=guiamaker
SOURCE=guia-maker-da-impressao-3d.adoc
TARGETPDF=guia-maker-da-impressao-3d.pdf
TARGETHTML=guia-maker-da-impressao-3d.html
IMAGEOUTDIR=img
REQUIRES=asciidoctor-mathematical
ATTRIBUTES=stem
MATHFORMAT=svg

pdf: xhtml5
	asciidoctor-pdf -a $(ATTRIBUTES) -r $(REQUIRES) -a $(MATHFORMAT) $(SOURCE) -o $(TARGETPDF)

html: xhtml5

xhtml5: $(SOURCE)
	asciidoctor -b xhtml5 -a $(ATTRIBUTES) -r $(REQUIRES) $(SOURCE) -o $(TARGETHTML)

all: pdf

clean:
	rm $(TARGETPDF) $(TARGETHTML) $(IMAGEOUTDIR)/*
