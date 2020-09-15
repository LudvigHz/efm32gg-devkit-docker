# EFM32GG devkit in a docker container

> A container containing all the tools you need for developing on an EFM32GG.

## Installation

```sh
docker pull ludvighz/efm32gg-devkit
```

## Usage

You can use the container just by entering the container and running commands. ex.

Assuming you are running the command from the project folder and your development board is connected
at `/dev/ttyUSB0`.

```sh
docker run -it -v $(pwd):/work --device=/dev/ttyUSBX ludvighz/efm32gg-devkit
```

Now you can use `gdb`, compile your code, or flash your board.
