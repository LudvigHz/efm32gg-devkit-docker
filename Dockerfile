FROM gcc:10.2
MAINTAINER Ludvig Hozman <ludvig123@gmail.com>

RUN dpkg --add-architecture i386

RUN apt-get update
RUN apt-get -y install git curl libncurses5 lib32z1 libqtgui4:i386 libusb-0.1:i386 libelf1:i386 vim

RUN mkdir -p /tools
WORKDIR /tools

COPY eACommander ./eACommander

COPY .gdbinit /root/

RUN ln -s /opt/eACommander/start-eACommander.sh /opt/eACommander/eACommander.sh

COPY JLink ./JLink
COPY libjlink.conf /etc/ld.so.conf.d/

COPY profiler ./profiler
COPY libprofiler.conf /etc/ld.so.conf.d/

RUN ldconfig

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz \
    && tar xvf gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz \
    && rm gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz

WORKDIR /work

ENV PATH $PATH:/tools/gcc-arm-none-eabi-9-2020-q2-update/bin:/tools/eACommander:/tools/JLink:/tools/profiler
