# Run on Linux
- Ensure that you have cuda installed by running 
```
nvcc --version
```
- Run run.bash
```
bash run.bash
```
# bnn_on_gpu
- First set the path to the CUDA Runtime Library of your system in ```Makefile``` 
(currently commented out: the path on my personal PC on line 5, and the path on the server on line 7)

- Change desired batch size in ```utils.h```

### Default starting configuration: 
- Layer 1, 2, 4, 5, 8, 10 on GPU using *PROFILE XYZ*
- Layer 3, 6, 7, 9 on CPU.

## Run layers on CPU only:
in ```net.cpp``` (```X``` layer number):
-   comment ```/* Layer X GPU */``` lines
-   comment out immediate ```/* Layer X CPU */``` lines

## Run layers on GPU in different parallel configurations:
- Revert previous steps in case they were performed

### Available parallel configurations:
- *PROFILE X* – data-images
- *PROFILE Y* – windows
- *PROFILE Z* – neurons
- *PROFILE XY* – data-images + windows
- *PROFILE XZ* – data-images + neurons
- *PROFILE YZ* – windows + neurons
- *PROFILE XYZ* – data-images + windows + neurons

in ```cuda_kernel.cu```:
- Each layer is specifically implemented for every profile iteratively
- Each profile can be found between delimiting lines: ```=============```
- Search for desired profile using CTRL+F, comment out all lines of coude between delimiting lines
- Don't forget to comment-in previously used profiles (e.g. default profile XYZ at the bottom of the file)

## Run benchmark
```
$ make
$ fashion_prof.o
```

