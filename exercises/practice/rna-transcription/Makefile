SHELL       = /bin/bash
MAKEFLAGS  += --no-print-directory
DESTDIR     = build
BASENAME    = $(shell basename "$$PWD" | sed -r 's/(^|-)([a-z])/\U\2/g')Tests
TESTFILE    = $(BASENAME).pas
EXECUTABLE  = $(DESTDIR)/$(BASENAME)
COMMAND     = fpc -l- -v0 -Sehnw -Fu./lib "./$(TESTFILE)" -FE"./$(DESTDIR)"

.PHONY: test clean

test:
	@$(MAKE) clean
	@mkdir -p "./$(DESTDIR)"
	@cp -r ./lib "./$(DESTDIR)"
	@$(COMMAND) && "./$(EXECUTABLE)"

clean:
	@rm -fr "./$(DESTDIR)"
