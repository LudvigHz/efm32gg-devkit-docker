FROM gcc:10.2
MAINTAINER Ludvig Hozman <ludvig123@gmail.com>

RUN apt-get update
RUN apt-get -y install git curl libncurses5

RUN mkdir -p /tools
WORKDIR /tools

COPY eACommander ./eACommander

RUN ln -s /tools/eACommander/start-eACommander.sh /tools/eACommander/eACommander.sh

RUN curl -XPOST https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb \
  --data-raw 'accept_license_agreement=accepted&submit=Download+software' \
  -o JLink_Linux_x86_64.deb \
  && dpkg -i JLink_Linux_x86_64.deb \
  && apt-get install -f \
  && rm JLink_Linux_x86_64.deb


RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz \
    && tar xvf gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz \
    && rm gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz

ENV PATH $PATH:/tools/gcc-arm-none-eabi-9-2020-q2-update/bin:/tools/eACommander:/tools/JLink_Linux_x86_64
