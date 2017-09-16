FROM ubuntu:16.04
RUN apt update
RUN apt install -y git curl autoconf libtool pkg-config python g++ libusb-1.0-0-dev
RUN git clone https://github.com/networkupstools/nut.git
RUN cd nut
RUN git checkout libusb-1.0
RUN ./autogen.sh
RUN ./configure --with-usb
RUN make
RUN curl -F file="@drivers/usbhid-ups" https://filebin.ca/upload.php
RUN sha1sum drivers/usbhid-ups
