# Project-specific variables
MAIN_PAPER = bare_jrnl
LETTER_DIR = response-letter
LETTER_FILE = response-letter
LATEX = pdflatex
BIBTEX = bibtex

.PHONY: all paper letter clean

all: paper letter

# Target to compile the main research article
paper: $(MAIN_PAPER).tex
	$(LATEX) $(MAIN_PAPER)
	$(BIBTEX) $(MAIN_PAPER)
	$(LATEX) $(MAIN_PAPER)
	$(LATEX) $(MAIN_PAPER)
	@echo "Main paper compiled: $(MAIN_PAPER).pdf"

# Target to compile the response letter
# Uses -output-directory to keep auxiliary files in the subdirectory
letter: $(LETTER_DIR)/$(LETTER_FILE).tex
	cd $(LETTER_DIR) && $(LATEX) $(LETTER_FILE)
	cd $(LETTER_DIR) && $(LATEX) $(LETTER_FILE)
	@echo "Response letter compiled: $(LETTER_DIR)/$(LETTER_FILE).pdf"

# Clean up auxiliary files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.pdf
	rm -f $(LETTER_DIR)/*.aux $(LETTER_DIR)/*.log $(LETTER_DIR)/*.out $(LETTER_DIR)/*.pdf
