all: compile

compile:
	xelatex resume.tex

deploy: compile
	scp resume.pdf sws:/home/sumnerevans/sumnerevans.com/static/
