alias checkMem="valgrind --leak-check=yes --log-file=valgrind.rpt ./a.out"

# Compile all .cpp and run immediately
alias carp="g++ *.cpp -g -Wall && checkMem"

# Compile all .cpp AND .o files and run immediately
alias carpo="g++ *.cpp *.o -g -Wall && checkMem"

# Opens all the cpp and h files in a folder *IT WILL CRAWL DEEPER INTO FOLDERS*
alias vall="vim \$(find . -type f -name '*.cpp' -o -name '*.h') -p"
