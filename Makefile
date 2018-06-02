BIN=/usr/local/bin

install:
	install apper $(BIN)

link:
	link apper $(BIN)/apper

uninstall:
	rm $(BIN)/apper
