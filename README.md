# EFM32GG devkit in a docker container

> A container containing all the tools you need for developing on an EFM32GG.

## Installation

There are a couple different versions of the container. Mainly, there is one with JLink, the
codesourcery toolchain and gcc 10 for simple embedded programming. In addition, there is a container
with `ptxdist` and the OSELAS.Toolchain() for embedded linux programming. See instructions for each
of the containers below.

### Gcc/codesourcery toolchain

```sh
# For a version using the codesourcery toolchain (recommended)
docker pull ludvighz/efm32gg-devkit:codesourcery

# For a version using the latest gcc arm toolchain
docker pull ludvighz/efm32gg-devkit
```

### uClinux development with OSELAS.Toolchain()

There is also a container with the tools to compile and build uClinux for usage on the EFM32GG.
This contains `ptxdist` and the OSELAS.Toolchain() project.

```sh
docker pull ludvighz/efm32gg-devkit:uclinux
```

## Usage

You can use the container just by entering the container and running commands. ex.

Assuming you are running the command from the project folder.

#### Linux

```sh
docker run -it --privileged -v $(pwd):/work -v /dev/bus/usb:/dev/bus/usb ludvighz/efm32gg-devkit
```

#### MacOS

```sh
docker run -it --privileged -v $(pwd):/work -v /dev/bus/usb:/dev/bus/usb ludvighz/efm32gg-devkit
```

Now you can use `gdb`, compile your code, or flash your board.

### Running GUI applications (Linux only)

The container contains the `eAprofiler` to profile the board. In order to run it, the container will
need access to the host machine X server.

> You can also run eAcommander in GUI mode wit this method

**Give docker access to your x server**

```sh
xhost +local:docker
```

**Run the container with access to your X11 socket and `$DISPLAY`**

```sh
docker run -it --privileged -v $(pwd):/work -v /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix/:/tmp/.X11-unix -e DISPLAY=$DISPLAY ludvighz/efm32gg-devkit
```

You can now run GUI applications

```sh
eAprofiler # Will open eAprofiler in a window on your machine
```
