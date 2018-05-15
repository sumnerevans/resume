all: resume.pdf

%.pdf: %.tex
	xelatex $<

clean:
	rm -rf *.aux missfont.log *.fdb_latexmk *.log *.out
