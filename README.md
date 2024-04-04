# object-detection

This repo contains the setup for our training and evaluation of models for  behaviour classification using [yolov5](https://github.com/ultralytics/yolov5). Currently, this supports the [custom cow dataset](https://app.roboflow.com/part-iv-project/cow-dataset/1) dataset but more datasets may be added later.

Clone recursively for yolov5:
```
git clone --recurse https://github.com/prototaip-134/object-detection.git
```

<div align="center">
  <div style="float:left;margin-right:10px;">
  <img src="https://github.com/prototaip-134/object-detection/assets/67076071/43d2a067-8652-46d3-9529-bd36722ff5e3"
  height=auto
  ><br>
    <p style="font-size:1.5vw;">Object Detection for Cattle</p>
  </div>
</div>



## Directory
**After** downloading and extracting the dataset, the directory for a `RawframeDataset` should look like below:
```
root-repo
├── data
│   └── part-iv-project1
│       ├── test
│       │   ├── labels
│       │   │   ├── 1_png.rf.21412412412.txt
│       │   │   └── ...
│       │   └── images
│       │       ├── img_00001.jpg
│       │       └── ...
│       ├── train
│       │   ├── labels
│       │   │   └── ...
│       │   └── images
│       │       └── ...
│       └── valid
│       │   ├── labels
│       │   │   └── ...
│       │   └── images
│       │       └── ...
│       ├── data.yaml
│       ├── README.dataset.txt
│       └── README.roboflow.txt
├── datasets
│   └── ...
├── setup
│   └── ...
├── models
│   └── ...
├── runs
│   └── ...
├── utils
│   └── ...
├── yolov5
│   └── ...
├── README.md
└── zidane.jpg
```

In-depth information about how to set up the dataset will be found in the `setup` folder. Note that the `data`, `datasets`, `models`, `runs`, and `utils` will all be mounted to the docker container.

## Guide
### Using Docker
This repo will be using the docker image provided by ultralytics for YoloV5:
```
sudo docker pull ultralytics/yolov5:latest
```
Then run the following to run a container:
```
sudo docker run --ipc=host --gpus all --shm-size=24g -it -p 8888:8888 -v /home/sadat/Desktop/object-detection/datasets:/usr/src/datasets -v /home/sadat/Desktop/object-detection/data:/usr/src/app/data ultralytics/yolov5:latest
```
Change the variables as necessary from the bash file. The default settings will have a shared memory of 24GB, use GPU, and mount the folders in the repo to the docker container.

### Running Jupyter Notebook from Container
Run the following:
```
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
```
On local browser, go to:
```
http://localhost:8888/
```
And, copy the token from the terminal to the box to use the notebook.

## Training
From `src/app`, run:
```
python train.py --img 640 --batch 4 --epochs 3 --data /usr/src/app/data/part-iv-project1/data.yaml --weights yolov5s.pt --cache
```
Example: Train a pretrained 3CD model on wlasl with periodic validation.
```
python mmaction2/tools/train.py models/c3d/c3d_16x16x1_sports1m_wlasl100_rgb.py --validate --seed 0 --deterministic --gpus 1
```

More details can be found in [here](https://docs.ultralytics.com/yolov5/quickstart_tutorial/#inference-with-detectpy).

## Citations
```
@software{glenn_jocher_2020_4154370,
author = {Glenn Jocher},
title = {{ultralytics/yolov5: v3.1 - Bug Fixes and
Performance Improvements}},
month = oct,
year = 2020,
publisher = {Zenodo},
version = {v3.1},
doi = {10.5281/zenodo.4154370},
url = {https://doi.org/10.5281/zenodo.4154370},
howpublished = {\url{https://github.com/ultralytics/yolov5}}
}
```



