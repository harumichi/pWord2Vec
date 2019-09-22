CC = g++
MPICC = mpic++
CFLAGS = -std=c++11 -fopenmp -O3 -D USE_MKL -Wall -xhost
LIBS = -L${MKLROOT}/lib/intel64 -Wl,--no-as-needed -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl

all: pWord2Vec pWord2Vec_mpi 

pWord2Vec: pWord2Vec.cpp
	$(CC) pWord2Vec.cpp -o pWord2Vec $(CFLAGS) $(LIBS)
pWord2Vec_mpi: pWord2Vec_mpi.cpp
	$(MPICC) pWord2Vec_mpi.cpp -o pWord2Vec_mpi $(CFLAGS) $(LIBS)
clean:
	rm -rf pWord2Vec pWord2Vec_mpi 
