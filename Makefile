BIN=/usr/local/bin
SCRIPT=apper

install:
	install $(SCRIPT) $(BIN)

link:
	link $(SCRIPT) $(BIN)/$(SCRIPT)

uninstall:
	rm $(BIN)/$(SCRIPT)
