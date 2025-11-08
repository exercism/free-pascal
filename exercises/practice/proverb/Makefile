SHELL       = /bin/bash
MAKEFLAGS  += --no-print-directory
DESTDIR     = build
EXECUTABLE  = $(DESTDIR)/test
COMMAND     = fpc -l- -v0 -g -gl -Sehnw -Fu./lib test.pas -FE"./$(DESTDIR)"

.ONESHELL:

test:
	@mkdir -p "./$(DESTDIR)"
	@cp -r ./lib "./$(DESTDIR)"
	@$(COMMAND) && ./$(EXECUTABLE) $(test)

clean:
	@rm -fr "./$(DESTDIR)"
