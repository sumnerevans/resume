all: resume.pdf

%.pdf: %.tex
	xelatex -shell-escape $<

clean:
	rm -rf *.aux missfont.log *.fdb_latexmk *.log *.out
