cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(cmake_and_cuda LANGUAGES C CXX CUDA)
enable_language(CUDA)
set(CMAKE_CXX_STANDARD 14)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
#set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -O3")

set(HEADER_FILES net.hpp netW.hpp cuda_kernel.h cuda_net.h)
set(SOURCES net.cpp cuda_kernel.cu)


add_executable(
    main main.cpp ${HEADER_FILES} ${SOURCES}
)

#target_include_directories(main PRIVATE .)
