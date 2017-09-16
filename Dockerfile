FROM ubuntu:16.04
RUN apt update
RUN apt install -y git curl autoconf libtool pkg-config python g++ libusb-1.0-0-dev
RUN git clone https://github.com/networkupstools/nut.git && \
    cd nut && \
    git checkout libusb-1.0 && \
    ./autogen.sh && \
    ./configure --with-usb && \
    make && \
    curl -F file="@drivers/usbhid-ups" https://filebin.ca/upload.php && \
    sha1sum drivers/usbhid-ups
