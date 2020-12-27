PROJECT=guia-maker-da-impressao-3d
SOURCE=$(PROJECT).adoc
TARGETPDF=$(PROJECT).pdf
TARGETHTML=$(PROJECT).html
IMAGEOUTDIR=img
REQUIRES=asciidoctor-mathematical
ATTRIBUTES=stem
MATHFORMAT=svg
LOG=guia-maker-da-impressao-3d.log

pdf: xhtml5
	@echo -n "Formatando o livro em PDF... "
	@asciidoctor-pdf -a $(ATTRIBUTES) -r $(REQUIRES) -a $(MATHFORMAT) $(SOURCE) -o $(TARGETPDF) > $(LOG) 2>&1
	@echo "pronto."

html: xhtml5

xhtml5: $(SOURCE)
	@echo -n "Formatando o livro em HTML... "
	@asciidoctor -b xhtml5 -a $(ATTRIBUTES) -r $(REQUIRES) $(SOURCE) -o $(TARGETHTML) > $(LOG) 2>&1
	@echo "pronto."

all: pdf

clean:
	@echo -n "Apagando os arquivos criados... "
	@rm -rf $(TARGETPDF) $(TARGETHTML) $(IMAGEOUTDIR) $(LOG)
	@echo "pronto."
