FILE=main
LATEX=${FILE}.tex
DVI=${FILE}.dvi
PS=${FILE}.ps
PDF=Proposta.pdf

forsure: all

all: pdf
	mv -f ${FILE}.pdf ${PDF} 
	[ -d logs ] || mkdir logs
	mv -f *.blg *.bbl *.aux *.log *.toc *.lof logs/

pdf: bib
	pdflatex ${FILE}

bib: ${LATEX}
	pdflatex ${LATEX}
	bibtex ${FILE}
	pdflatex ${LATEX}

clean:
	rm -rf *.blg *.bbl *.aux *.dvi *.log *.ps *.lof logs
