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
├── run_docker.sh
└── zidane.jpg
```

In-depth information about how to set up the dataset will be found in the `setup` folder. Note that the `data`, `datasets`, `models`, `runs`, and `utils` will all be mounted to the docker container.

## Guide
### Using Docker
This repo will be using the docker image provided by ultralytics for YoloV5:
```
sudo docker pull ultralytics/yolov5:latest
```
Make the `run_docker.sh` executable:
```
chmod +x run_docker.sh
```
Then run:
```
bash ./run_docker.sh
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

## Dataset Setup and Training
Got to `/setup` and run the `train.ipynb` notebook. This will have steps to download and setup the dataset as well as train the model with the [Comet](https://www.comet.com/site/) logger.

If the dataset is already setup, the following could be used to train the model:
```
python train.py --img 640 --batch 4 --epochs 3 --data /usr/src/app/data/part-iv-project1/data.yaml --weights yolov5s.pt --cache
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



