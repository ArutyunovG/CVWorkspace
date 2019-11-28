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
3) <i>Supported systems are Ubuntu 16.04 and Ubuntu 18.04</i><br>
These are presumably the mostly used operating systems in computer vision community.
<hr>
<h4>Scripts organisation structure</h4>

The collection of scripts is organised as follows
1) Top level scripts<br><br>
```config.sh``` &ndash; configuration script<br>
``` install.sh``` &ndash; the main installation script<br>
  
2) Folders<br><br>
``` base deps ``` &ndash; contains scripts which install base dependencies of the frameworks to be built<br>
``` frameworks``` &ndash; contains scripts which target deep learning frameworks and their computer vision ecosystems<br>
``` additional ``` &ndash; provides various additional installation scripts for tools, which are not necessary for deep learning frameworks, but are of common usage in computer vision community<br>
``` production ``` &ndash; provides production specific installation scripts.

## Usage
<h4>Operating system</h4>
Before installing components, make sure you don't have conflicts on your Ubuntu system with the software to be built and installed. The scripts presented here do not delete anything from your system in order to allow them working.<br>
The workability of the scripts was tested only on clear Ubuntu 16.04 or Ubuntu 18.04 and that is the ideal condition.<br>

<h4>Some of the core configuration variables</h4>

```config.sh``` has the core variable ```WORKSPACE_BASE``` which specifies the installation folder for your frameworks and their dependencies.<br>
The other important variable in ```config.sh``` to note is ```SOURCE_SETUP_SCRIPT_IN_BASHRC```. Set it to 1, if you want the CVWorkspace environment to be immediately initialised on every new bash terminal.

<h4>CVWorkspace installation steps</h4>

The usage of CVWorkspace consists of four installation steps:
1) CUDA
2) Base dependencies
3) Frameworks with their computer vision ecosystems
4) Additional and production components.

Suppose, you have clear Ubuntu 16.04 or Ubuntu 18.04.<br>
The following sections separately describe each of the steps.

### CUDA

<h4>CUDA</h4>

CUDA is being installed separately from the main script ```install.sh```.<br>
```cd``` to ```CVWorkspace/additional/cuda``` and run

```
sudo bash -i install_cuda.sh
```

It will install CUDA 10.1 and appropriate nvidia driver at the same time.<br>
Please, restart your computer afterwards for the changes to take effect.<br>

<h4>cuDNN</h4>

Installing cuDNN is perhaps the most inconvinient job for the CVWorksapce user.<br> 
Please, download the latest cudnn archive compatible with CUDA 10.1 from official NVIDIA <a href = "https://developer.nvidia.com/rdp/cudnn-archive">web site</a>. NVIDIA wants users to be logged in before accessing it. 

Once cuDNN archive has been downloaded, please modify ```install_cudnn.sh```, so that the variable ```CUDNN_ARCHIVE``` referes to your cuDNN archive. 
Afterwards the installation is performed with the command

```
sudo bash -i install.sh
```
### Base dependencies

Modify ```CVWorkspace/config.sh```, so that option ```BUILD_BASE_DEPS``` is set

```
BUILD_BASE_DEPS=1
```

Installing base dependencies is performed with running the command

```
sudo bash -i install.sh
```

### Frameworks

To install a deep learning framework, say Pytorch, user switches its option in ```config.sh``` to 1

```
BUILD_PYTORCH=1
```

and runs

```
bash -i install.sh
```

The same applies for the framework-specific computer vision ecosystems, say Detectron2. First the appropriate variables are set

```
# Build torchvision
BUILD_TORCHVISION=1

# Instal fvcore
INSTALL_FVCORE=1

# Build Detectron
BUILD_DETECTRON2=1
```

and then ```install.sh``` is called

```
bash -i install_cudnn.sh
```


The following table summarises frameworks and the appropriate switches in the ```config.sh```

| Target  | Option  |
|---|---|
|  Caffe | BUILD_CAFFE |
| Caffe SSD  | BUILD_CAFFE_SSD  |
| Caffe2  |  BUILD_CAFFE2 |
|  MXNet | BUILD_MXNET |
| Pytorch  | BUILD_PYTORCH  |
| Tensorflow  |  BUILD_TENSORFLOW |

<b>Note.</b> Please note, that Python bindings of Caffe2 are automatically installed with Pytorch and ```BUILD_PYTORCH``` is the recommended option to install Caffe2. ```BUILD_CAFFE2``` option is separated to provide CMake and C++ oriented Caffe2 build, which can be useful for production deployment.

The following table summarises computer vision environments on top of deep learning frameworks and the appropriate switches in the ```config.sh```

| Target  | Option  | Base framework |
|---|---|---|
| Detectron (deprected) | BUILD_DETECTRON | Caffe2 |
| Detectron2  | BUILD_TORCHVISION, INSTALL_FVCORE, BUILD_DETECTRON2 | Pytorch |
|  GluonCV | BUILD_GLUON | MXNet |
| TF OD API  | BUILD_TF_OD_API  | TensorFlow |

### Additional and production components

The additional and production components target specific use cases, which are common in computer vision research and industry.

Installation of additional and production components are performed in the same fashion, as frameworks. Say, to install FFmpeg, first the option has to be set

```
BUILD_FFMPEG=1
```

and then ```install.sh``` ran

```
bash -i install_cudnn.sh
```

The additional components include

1) Dataset Converters &ndash; a conversion toolset between different object detection and instance segmentation dataset formats
2) FFmpeg &ndash; vast software and library suite to handle, in particular, video streams
3) OpenVINO &ndash; a toolset to deploy trained models on Intel devices (CPU, HD Graphics, Myriad X based).

The following table summarises additional components and their switch options

| Target  | Option |
|---|---|
| Dataset Converters | INSTALL_DATASET_CONVERTERS |
| FFMpeg| BUILD_FFMPEG |
| OpenVINO | BUILD_OPENVINO |

<b>Note.</b> ffmpeg executable is being searched by torchvision's setup script. If you have FFmpeg installed before torchvision, you may face torchvision build issues.<br>

<b>Note.</b> It is recommended to use official OpenVINO installers, provided by Intel. One cannot reproduce them from source, because of lack of special tools. OpenVINO build passes with GCC 5.4.0, shipped with Ubuntu 16.04. Trying to build it with other compiler may cause build errors.<br>

The production components include

1) CryptoPP &ndash; a C++ library to encrypt your trained models, when deploying them in production
2) Qt &ndash; a huge C++ framework, in particular targeting GUI implementation of desktop applcations.

The following table summarises production components and their switch options


| Target  | Option |
|---|---|
| CryptoPP | BUILD_CRYPTOPP |
| Qt| INSTALL_QT |

<b>Note.</b> CryptoPP is being built from source, Qt is not.

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

## Contributing

CVWorkspace is intended to be non-commercial work with open source spirit and contributions are highly welcome.

The expected contribution conditions are

<ul>
<li> you agree, that your contributions are MIT-licensed
<li> contributed code is written from scratch and does not havve parts copied from other repositories.
</ul>

