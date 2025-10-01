SHELL      = /bin/bash
DESTDIR    = build
BASENAME   = $(shell basename "$$PWD" | sed -r 's/(^|-)([a-z])/\U\2/g')Tests
TESTFILE   = $(BASENAME).pas
EXECUTABLE = $(DESTDIR)/$(BASENAME)
COMMAND    = fpc -l- -v0 -Sehnw -Fu./lib "./$(TESTFILE)" -FE"./$(DESTDIR)"

test:
	@rm -fr "./$(DESTDIR)"
	@mkdir -p "./$(DESTDIR)"
	@cp -r ./lib "./$(DESTDIR)"
	@$(COMMAND) && "./$(EXECUTABLE)"
	@rm -fr "./$(DESTDIR)"
