YACC    	= bison
LEX     	= flex
RM      	= rm
CXX			= g++
CP			= cp
MKDIR   	= mkdir -p
LLVMCONFIG	= llvm-config

CXXFLAGS	= -g -Wall -std=c++11 `$(LLVMCONFIG) --cxxflags`
LIBS		= `$(LLVMCONFIG) --libs`
LDFLAGS		= `$(LLVMCONFIG) --ldflags` $(LIBS) -g -Wall -std=c++11 -lpthread -ldl -rdynamic

PROGRAM 	= uCML
PREFIX  	= /usr

TEST_D  	= ../tests
TESTER  	= run-tests.sh


objects = parser.o lexer.o nodes.o context.o tools.o main.o

default-target: help

build: $(PROGRAM)


all: $(PROGRAM) test install


$(PROGRAM): $(objects)
	@echo "############ Linking to build executable ############"
	$(CXX) -o $@ $(objects) $(LDFLAGS)
	@echo "############## Build finished: \"$(PROGRAM)\" ###############"

%.o: %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

parser.cpp: parser.y
	$(YACC) -v -d -o $@ $^

lexer.cpp: lexer.l
	$(LEX) -o $@ $^

clean:
	@$(RM) $(PROGRAM) parser.hpp parser.cpp parser.output lexer.cpp $(objects)

test:	$(PROGRAM) $(TEST_D) $(TESTER)
	@echo "################### Start Testing ###################"
	@./$(TESTER) $(PROGRAM) $(TEST_D)
	@echo "#################### End Testing ####################"

install: $(PROGRAM)
	@echo "Installing..."
	@$(MKDIR) $(PREFIX)/bin
	$(CP) $< $(PREFIX)/bin/
	@echo "Installed as \"$(PREFIX)/bin/$(PROGRAM)\""
	@echo ""

uninstall:
	@echo "Uninstalling..."
	$(RM) $(PREFIX)/bin/$(PROGRAM)
	@echo "Uninstalled \"$(PREFIX)/bin/$(PROGRAM)\""
	@echo ""

help:
	@echo "Usage:"
	@echo "  make help                   : Show this help."
	@echo "  make build                  : Build the executable compiler-frontend."
	@echo "  make test                   : Run tests against the .ml files."
	@echo "  make all                    : Build, run tests and install the executable."
	@echo "  make clean                  : Clean-up the source directory."
	@echo "  make install [PREFIX=dir]   : Install the executable in \"dir/bin/\" directory. Default PREFIX=$(PREFIX)"
	@echo "  make uninstall [PREFIX=dir] : Uninstall the executable from \"dir/bin/\" directory. Default PREFIX=$(PREFIX)"
	@echo ""


.PHONY: all build test help install uninstall
