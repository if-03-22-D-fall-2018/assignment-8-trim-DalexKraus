CC					= g++
CCLINK				= g++
LIBS				=
CCOPTIONS			= -Wall -pedantic -g
LDOPTIONS			=
HDRS				= trim.h test_trim.h shortcut.h

TEST = test_trim
PROGRAM = trim_str															# to be added by student

TESTOBJECT = trim_test_driver.o
MAINOBJECT = trim_str.o				 									# to be changed by student
OBJS = shortcut.o trim.o test_trim.o

DOXY            = /Applications/Doxygen/Doxygen.app/Contents/Resources/doxygen

all: $(PROGRAM)
	./$(PROGRAM) "    My test string     "
# test string to be added by student

$(TEST): $(OBJS) $(TESTOBJECT)
	$(CCLINK) -o $@ $(LDOPTIONS) $(OBJS) $(TESTOBJECT)

$(PROGRAM): $(OBJS) $(MAINOBJECT)
	$(CCLINK) -o $@ $(LDOPTIONS) $(OBJS) $(MAINOBJECT)

.PHONY: clean cleanall doxy test setsample setassignment definesample defineassignment assignmentfolder

clean:
	rm -f $(PROGRAM) $(TEST) $(TESTOBJECT) $(MAINOBJECT) $(OBJS)

cleanall:
	rm -f $(PROGRAM) $(TEST) $(TESTOBJECT) $(MAINOBJECT) $(OBJS) index.html
	rm -R html

doxy:
	$(DOXY)
	ln -s html/index.html index.html

test: $(TEST)
	./$(TEST)

#sets project as sample solution
setsample:
	cp trim.cpp.sample trim.cpp
	cp trim.h.sample trim.h
	cp test_trim.cpp.sample test_trim.cpp
	cp trim_str.cpp.sample trim_str.cpp

#sets project as assignment
setassignment:
	cp trim.cpp.assignment trim.cpp
	cp trim.h.assignment trim.h
	cp test_trim.cpp.assignment test_trim.cpp
	cp trim_str.cpp.assignment trim_str.cpp

# defines current state of project as sample solution
definesample:
	cp trim.cpp trim.cpp.sample
	cp trim.h trim.h.sample
	cp test_trim.cpp test_trim.cpp.sample
	cp trim_str.cpp trim_str.cpp.sample

# defines current sate of project as assignment
defineassignment:
	cp trim.cpp trim.cpp.assignment
	cp trim.h trim.h.assignment
	cp test_trim.cpp test_trim.cpp.assignment
	cp trim_str.cpp trim_str.cpp.assignment

# creates a folder which can serve as a publishable assignment
assignmentfolder:
	make setsample
	make doxy
	make setassignment
	mkdir ../assignment
	cp -R * ../assignment
	rm ../assignment/*.sample
	rm ../assignment/*.assignment
	make cleanall
	@echo 'Please adapt makefile at three places where comments indicate!'

%.o: %.cpp $(HDRS)
	$(CC) $(CCOPTIONS) -c $<
