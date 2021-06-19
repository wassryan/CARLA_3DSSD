# 3DSSD for Carla Simulation data

This repo is used to apply 3DSSD (tf-code) to Carla Simulation data and visulize the prediction result in BEV and FOV.

### Requirements
All the codes are tested in the following environment:
* Ubuntu 16.04
* Python 3.6
* tensorflow 1.4.0
* CUDA 9.0 & CuDNN 7.0.0


### Installation

(1) Clone this repository.
```
git clone https://github.com/tomztyang/3DSSD
cd 3DSSD
```

(2) Setup Python environment.
```
conda create -n 3dssd python=3.6
source activate 3dssd
pip install -r requirements.txt
```

Download and install tensorflow-1.4.0 [here](https://drive.google.com/file/d/142fwmiq8skVUcEqxXny9zA4bNG7YULGn/view?usp=sharing) which is compiled with CUDA-9.0 and CuDNN-7.0.0.
```
pip install tensorflow-1.4.0-cp36-cp36m-linux_x86_64.whl
```

(3) Compile and install 3DSSD library. Note that only GCC no later than version 5.0 can compile CUDA-9.0 code, make sure you install gcc-5. 
```
bash compile_all.sh /path/to/tensorflow /path/to/cuda
```

(4) Add **3DSSD/lib** to PYTHONPATH and redirect CUDA path if needed.

```
see the cmd in config_env.sh
```

### Data Preparation

Currently we only support KITTI dataset, and NuScenes dataset will be supported as soon as possible. 

(1) Please download the KITTI dataset and arrange it as below (please also download road planes at [here](https://drive.google.com/file/d/1d5mq0RXRnvHPVeKx6Q612z0YRO1t2wAp/view), which are useful in data augmentation).

```
.                                           (root directory)
|-- lib                                     (3DSSD library file)
|-- configs                                 (model configurations folder)
|-- ...
|-- dataset
    |-- KITTI                               (dataset directory)
    |   |-- object
    |       |-- train.txt                   (KITTI train images list (3712 samples))                              
    |       |-- val.txt                     (KITTI val images list (3769 samples))
    |       |-- test.txt                    (KITTI test images list (7518 samples))
    |       |-- trainval.txt                (KITTI images list (7481 samples))
    |       |-- training
    |       |   |-- calib
    |       |   |-- image_2
    |       |   |-- label_2
    |       |   |-- planes
    |       |   |-- velodyne
    |       |-- testing
    |-- NuScenes
    |   |-- ...
    |-- ...
```

### Train/Val/Predict
refer to **trainval.sh**

#### Train
```
CUDA_VISIBLE_DEVICES=1,2 python lib/core/trainer.py --cfg configs/kitti/3dssd/3dssd.yaml
```

#### Evaluation
```
CUDA_VISIBLE_DEVICES=1 python lib/core/evaluator.py \
   --cfg configs/kitti/3dssd/3dssd.yaml 
   --restore_model_path /home/zhengkai/3DSSD/log/2021-02-27\ 17:33:44.597504/ 
```

#### Prediction
```
CUDA_VISIBLE_DEVICES=1 python lib/core/data_preprocessor.py --cfg configs/kitti/3dssd/3dssd_carla.yaml --split training --img_list val
CUDA_VISIBLE_DEVICES=1 python lib/core/tester.py --cfg configs/kitti/3dssd/3dssd_carla.yaml --restore_model_path log/CARLA/v2
```

then the prediction will be formated as `txt` file, and be saved under `./result/log/CARLA/v2/kitti_result/`

#### Visualization
see another [repo](https://github.com/wassryan/kitti_vis_tool)




