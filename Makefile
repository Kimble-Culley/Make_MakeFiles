# Author name: Kimble Culley
# File name: Makefile
# Date: 2/16/2024
# Purpose: To compile the executable for employee

CC = g++ #The compiler

CFLAGS = -c -Wall -Wextra #Compile with all errors and warnings.

TARGET = employee #The executable "employee"

all: $(TARGET) #Target is dependancy

$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) $^ -o $(TARGET)
#Links all .o files to create binary $(TARGET)


main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp -o main.o
#Compiles main.o from source


Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp -o Employee.o
#Compiles Employee.o from source


Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp -o Officer.o
#Compiles Officer.o from source


Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp -o Supervisor.o
#Compiles Supervisor.o form source


clean:
	$(RM) *.o *~ $(TARGET)
#Removes .o, ~, and Executable files
