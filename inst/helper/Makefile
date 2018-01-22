.SUFFIXES: .tex .pdf .Rnw .R .Rmd .html
.PHONY: force
INCLUDES = chapter1 chapter2 chapter3 chapter4 chapter5 chapter6
RMD = $(INCLUDES:=.Rmd)
HTML = $(INCLUDES:=.html)

CACHES = $(INCLUDES:=_cache)
FILES = $(INCLUDES:=_files)

force:  $(HTML)

.Rmd.html:
	Rscript -e "rmarkdown::render('$<')"

clean:
	rm -fvr $(HTML) $(CACHES) $(FILES)
	rm -fv *.aux *.dvi *.log *.toc *.bak *~ *.blg *.bbl *.lot *.lof
	rm -fv  *.nav *.snm *.out *.pyc \#*\# _region_* _tmp.* *.vrb
	rm -fv Rplots.pdf *.RData d.csv.gz mygraph.* knitr.sty

cleaner:
	make clean
	rm -fvr auto/

