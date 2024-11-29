cmake_minimum_required (VERSION 2.8) 
set(CMAKE_CXX_COMPILER g++) 
set(CMAKE_CXX_STANDARD 11)
project (FastQC)

aux_source_directory(. DIR_SRCS)
set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3")
add_executable(FastQC ${DIR_SRCS})

