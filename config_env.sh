#!/usr/bin/zsh
# take the reference from https://github.com/tensorflow/tensorflow/issues/16750 to solve the problem: 
#ImportError: libcublas.so.9.0: cannot open shared object file: No such file or directory
#cuz the cuda symbolic link is not direct to cuda-9.0
set -x
# should do iit mannualy
export PYTHONPATH=$PYTHONPATH:/home/zhengkai/3DSSD/lib:/home/zhengkai/3DSSD/mayavi
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64 # to fix the libcublas.so 9.0 error
