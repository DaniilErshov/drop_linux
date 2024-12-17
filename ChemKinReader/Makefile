CXX = mpiicpx
CXXFLAGS = -O2 -std=c++17 -Wall -Wextra -Wno-unused-parameter -Wno-sign-compare -I./include -I../Boost_regex/include

AR := ar cr

HEADERS = $(wildcard include/*.h) 
FILES = $(wildcard src/*.cpp)

OBJS = ${FILES:.cpp=.o}
LIBNAME = ChemKinReader.a


all: ${LIBNAME}
clean:
	@echo "Cleaning ${LIBNAME} ... "
	rm -f src/*.o ${LIBNAME}

${LIBNAME}: ${OBJS}
	@echo "Building $@ ... "
	${AR} $@ ${OBJS}

${OBJS}: ${HEADERS}

.cpp.o:
	$(CXX) $(CXXFLAGS) -o $@ -c $<