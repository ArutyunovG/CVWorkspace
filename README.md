# CVWorkspace
CVWorkspace is a collection of scripts, which simplify the process of simultaneous installation of various computer vision frameworks.

Please note, that this work targets computer vision developers with experience in different deep learning and computer vision frameworks, various build tools and so on. If you are a beginner, it is recommended to use official installation instructions.

## Introduction

### Motivation
Different deep learning frameworks provide different functionality for computer vision tasks, be it research or production. Having experience with many of open source tools, we know their advantages and drawbacks and that one computer vision tool is nearly never enough to fully solve challenging real world task.<br><br> 
Most of the frameworks come with their own pre-built packages or dockerfiles which are supposed to be built separately. 
While being natural, such situation obstructs use of all the strong sides of different frameworks at once.
<br><br>
This work aims to be a small step towards placing the great open source tools together.<br>
### Concept and Structure 
This section presents a list of core design concepts with their rationale and introduces the scripts' organisation structure.
<hr>
<h4>Design concepts</h4>
1) <i>Almost everything is being built from source</i><br>
Building from source is the only way to get rid of inconsistency issues with dependencies of pre-built packages.<br>
2) <i>Scripts are written in bash</i><br>
Bash is available for clearly-installed Ubuntu and is relatively low-level choice. <br>
3) <i>Supported system is Ubuntu 22.04</i><br>
These is presumably one of the mostly used operating systems in computer vision community.
<hr>
<h4>Scripts organisation structure</h4>

The collection of scripts is organised as follows
1) Top level scripts<br><br>
```config.sh``` &ndash; configuration script<br>
``` install.sh``` &ndash; the main installation script<br>
``` versions.sh``` &ndash; specifies versions of libraries to be installed<br>
  
2) Folders<br><br>
``` base deps ``` &ndash; contains scripts which install base dependencies of the frameworks to be built<br>
``` frameworks``` &ndash; contains scripts which target deep learning frameworks and their computer vision ecosystems<br>
``` additional ``` &ndash; provides various additional installation scripts for tools, which are not necessary for deep learning frameworks, but are of common usage in computer vision community<br>
``` production ``` &ndash; provides production specific installation scripts.

## Docker
You can download prebuilt docker image, based on the provided Dockerfile by running
```
docker pull arutyunovgrigory/cvworkspace:latest
```
```nvidia-container-toolkit``` is needed to access GPUs inside the container.
## Usage
<h4>Operating system</h4>
Before installing components, make sure you don't have conflicts on your Ubuntu system with the software to be built and installed. The scripts presented here do not delete anything from your system in order to allow them working.<br>
The workability of the scripts was tested only on clear Ubuntu 22.04 and that is the ideal condition.<br>

<h4>Some of the core configuration variables</h4>

```config.sh``` has the core variable ```WORKSPACE_BASE``` which specifies the installation folder for your frameworks and their dependencies.<br>
The other important variable in ```config.sh``` to note is ```SOURCE_SETUP_SCRIPT_IN_BASHRC```. Export it to 1, if you want the CVWorkspace environment to be immediately initialised on every new bash terminal.

<h4>CVWorkspace installation steps</h4>

The usage of CVWorkspace consists of four installation steps:
1) CUDA
2) Base dependencies
3) Frameworks with their computer vision ecosystems
4) Additional and production components.

Suppose, you have clear Ubuntu 22.04.<br>
The following sections separately describe each of the steps.

### CUDA

<h4>CUDA and cuDNN</h4>

CUDA is being installed separately from the main script ```install.sh```.<br>
```cd``` to ```CVWorkspace/additional/cuda``` and run

```
sudo bash -i install_cuda.sh
```

It will install CUDA 12.4, cudnn 9 for that CUDA version and appropriate nvidia driver, all at the same time.<br>
Please, restart your computer afterwards for the changes to take effect.<br>

### Base dependencies

To install base dependencies export ```WITH_BASE_DEPS``` with value 1

```
export WITH_BASE_DEPS=1
```

Installing base dependencies is performed with running the command

```
bash -i install.sh
```

### Frameworks

To install a deep learning framework, say Pytorch, export its option variable with value 1

```
export WITH_PYTORCH=1
```

and run

```
bash -i install.sh
```

The same applies for the framework-specific computer vision ecosystems, say Detectron2. First the appropriate variables are set

```
export WITH_TORCHVISION=1
export WITH_FVCORE=1
export WITH_DETECTRON2=1
```

and then ```install.sh``` is called

```
bash -i install.sh
```


The following table summarises frameworks and the appropriate switches

| Target  | Option  |
|---|---|
|  Caffe | WITH_CAFFE |
| Caffe SSD  | WITH_CAFFE_SSD  |
| Pytorch  | WITH_PYTORCH  |
| Tensorflow  |  WITH_TENSORFLOW |

The following table summaries computer vision environments on top of deep learning frameworks and the appropriate switches

| Target  | Option  | Base framework |
|---|---|---|
| Detectron2  | WITH_TORCHVISION, WITH_FVCORE, WITH_DETECTRON2 | Pytorch |
| OpenMMLab libraries  | WITH_MIM, WITH_MMENGINE, WITH_MMCV, WITH_MMPRETRAIN, WITH_MMDETECTION, WITH_MMSEGMENTATION, WITH_MMDEPLOY | Pytorch |

### Additional and production components

The additional and production components target specific use cases, which are common in computer vision research and industry.

Installation of additional and production components is performed in the same fashion, as frameworks. Say, to install FFmpeg, first the option has to be set

```
export WITH_FFMPEG=1
```

and then ```install.sh``` ran

```
bash -i install.sh
```

The additional components include

1) Dataset Converters &ndash; a conversion toolset between different object detection and instance segmentation dataset formats
2) FFmpeg &ndash; vast software and library suite to handle, in particular, video streams
3) OpenVINO &ndash; a toolset to deploy trained models on Intel devices (CPU, HD Graphics, Myriad X based).

The following table summarises additional components and their switch options

| Target  | Option |
|---|---|
| Dataset Converters | WITH_DATASET_CONVERTERS |
| FFmpeg| WITH_FFMPEG |
| OpenVINO | WITH_OPENVINO |

<b>Note.</b> ffmpeg executable is being searched by torchvision's setup script. If you have FFmpeg installed before torchvision, you may face torchvision build issues.<br>

<b>Note.</b> It is recommended to use official OpenVINO installers, provided by Intel. One cannot reproduce them from source, because of lack of special tools. OpenVINO build is workable only on Ubuntu 18.04.<br>

The production components include

CryptoPP &ndash; a C++ library to encrypt your trained models, when deploying them in production

The following table summarises production components and their switch options


| Target  | Option |
|---|---|
| CryptoPP | WITH_CRYPTOPP |

### Activating built workspace

To activate built workspace, source ``LIBS_BASE/setup.sh`` script, by default located in ```WORKSPACE_BASE/libs```

```
source $LIBS_BASE/setup.sh
```

## Notes on base components

The base components are
1) Git, Wget, GNU build essentials
2) CMake and Bazel build systems
3) Python with framework dependency packages 
4) Various C++ libs required for framework build.

Git, Wget, GNU build essentials (gcc, g++, gfortran), as well as Python are installed globally at root level. 

Python version installed is 3.7.

The Python packages are being installed in ```WORKSPACE_BASE``` folder as a virtual environment via pipenv. 
All the C++ deps, as well as CMake and Bazel are locally installed in ```WORKSPACE_BASE```.

Such separation of environment allows user to choose different python packages, C++ libraries and build tools between different installations of CVWorkspace.

For more advanced understanding of the installed CVWorkspace structure, please refer to file ```LIBS_BASE/setup.sh```.

## Advanced frameworks configuration

<b>Note.</b> The options in the files described here are for advanced research development and not recommended to change if you feel unconfident with their meaning.

Deep learning frameworks are often changed by the user in projects, where some new techniques are invented.
If you are doing serious research or production development, you know, that reproducibility of results is a must. That includes reproducibility of the environment, where the result were achieved. Given how much changes are often done and in different tools this environment reproducibility task is often not trivial.

To solve it, the advanced configuration files are presented in the folder

```
frameworks/advanced_config
```
```set_checkout_targets.sh``` &ndash; allows to checkout concrete branch and even commit by its hash<br>
``` set_patches.sh``` &ndash; allows to systematize your patches done to the framework during development on top of the branch/commit hash<br>
``` set_urls.sh``` &ndash; allows to use your private forks as a base framework url in case of serious changes.

To reproduce concrete python environment, it can be specified with Pipfile, which is passed to CVWorkspace with ```WITH_PIPFILE``` option.

To specify concrete CVWorkspace revision, which was used to generate the experiment environment, please export ```CVWORKSPACE_CHECKOUT_TARGET``` variable.

Sometimes CVWorkspace can be useful for the experiment environment specification, but lacks some functionality. One can pass needed modifications as a patch on top of ```CVWORKSPACE_CHECKOUT_TARGET``` by exporting ```CVWORKSPACE_PATCH``` variable.

<b>Note.</b> Additionally ```frameworks/advanced_config``` contains ```set_build_types.sh```. It defines variables to build frameworks and some ecosystems with debugging symbols to simplify understanding and debugging of complicated implementation details.

## Contributing

CVWorkspace is intended to be non-commercial work with open source spirit and contributions are highly welcome.

The expected contribution conditions are

<ul>
<li> you agree, that your contributions are MIT-licensed
<li> contributed code is written from scratch and does not have parts copied from other repositories.
</ul>

