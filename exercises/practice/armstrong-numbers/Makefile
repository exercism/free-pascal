SHELL       = /bin/bash
MAKEFLAGS  += --no-print-directory
DESTDIR     = build
EXECUTABLE  = $(DESTDIR)/test
COMMAND     = fpc -l- -v0 -Sehnw -Fu./lib test.pas -FE"./$(DESTDIR)"

.ONESHELL:

test:
	@$(MAKE) clean
	@mkdir -p "./$(DESTDIR)"
	@cp -r ./lib "./$(DESTDIR)"
	@$(COMMAND) && ./$(EXECUTABLE) $(test) || $(MAKE) clean
	@$(MAKE) clean

clean:
	@rm -fr "./$(DESTDIR)"
