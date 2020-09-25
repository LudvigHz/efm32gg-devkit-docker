# EFM32GG devkit in a docker container

> A container containing all the tools you need for developing on an EFM32GG.

## Installation

```sh
# For a version using the codesourcery toolchain (recommended)
docker pull ludvighz/efm32gg-devkit:codesourcery

# For a version using the latest gcc arm toolchain
docker pull ludvighz/efm32gg-devkit
```

## Usage

You can use the container just by entering the container and running commands. ex.

Assuming you are running the command from the project folder.

```sh
docker run -it --privileged -v $(pwd):/work -v /dev/bus/usb:/dev/bus/usb ludvighz/efm32gg-devkit
```

Now you can use `gdb`, compile your code, or flash your board.

### Running GUI applications

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
