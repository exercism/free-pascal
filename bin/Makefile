SHELL       = /bin/bash
MAKEFLAGS  += --no-print-directory
BASENAME    = verify-exercises
SOURCEFILE  = $(BASENAME).pas

$(BASENAME): $(SOURCEFILE)
	@fpc -Sehnw  $(SOURCEFILE)
	@rm -f $(BASENAME).o

test-all: $(BASENAME)
	@./$(BASENAME)
