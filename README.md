# QA-practice
This repo and code is to practice test automation.

Requirements:
* linux host os
* python 3.7+ supported
* docker installed & user has sudo access and/or belongs to docker group
* git repo cloned to the host
* scripts and tests executed from the main directory 'QA-practice/'

Files:
* README.md (this file) for info about the project
* check-set-test-work.sh - script to check host env and set up the test work for docker
* test/ - test files for robot framework test execution inside docker container
* test/output/ - output folder for test execution results

Automatic test set up and execution is done using shell script & docker.
command steps from terminal:

1) execute script to check host env and set up the test work for docker
```
sh check-set-test-work.sh
```

2) run test container based on pulled docker image
```
docker run --rm -v $(pwd)/test/:/test --ipc=host marketsquare/robotframework-browser:latest bash -c "robot --outputdir /test/output /test"
```
3) check test results from host folder:
./test/output/report.html

NOTE.
* docker image is pulled from docker hub
* docker image is based on robot framework browser image
If the script for some reason does not work, manual set up is the following:
1) pull docker image
```
docker pull marketsquare/robotframework-browser:latest
```
2) check images on host
```
docker images
```
3) run test container based on pulled docker image
```
docker run --rm -
-v $(pwd)/test/:/test --ipc=host marketsquare/robotframework-browser:latest bash -c "robot --outputdir /test/output /test"
```

If you want to run test container in interactive mode, run:
```
docker run -it --rm -v $(pwd)/test/:/test --ipc=host marketsquare/robotframework-browser:latest bash
```
