FILE=resume

all: compile

compile:
	xelatex $(FILE).tex

clean:
	rm -rf $(FILE).aux
	rm -rf missfont.log
	rm -rf $(FILE).fdb_latexmk
	rm -rf $(FILE).log
	rm -rf $(FILE).out
