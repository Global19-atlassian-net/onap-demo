# Run this docker file from the top of the onap-demo repo with
# 
FROM ubuntu:xenial as libevel
RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev build-essential git
COPY . /opt/demo
WORKDIR /opt/demo
RUN patch -p1 < vnfs/vCPE/vpp-ves-agent-for-vgmux/src/patches/vCPE-vG-MUX-libevel-fixup.patch
WORKDIR /opt/demo/vnfs/VES5.0/evel/evel-library/bldjobs
RUN make

#FROM ubuntu:xenial
#WORKDIR /opt
#RUN apt-get install -y make wget libcurl4-openssl-dev patch git
#RUN git clone https://gerrit.fd.io/r/vpp -b stable/1704
#RUN wget -O https://git.onap.org/demo/plain/vnfs/vCPE/vpp-ves-agent-for-vgmux/src/patches/Hc2vpp-Add-VES-agent-for-vG-MUX.patch
#WORKDIR /opt/vpp
#RUN patch -p1 < ../Vpp-Add-VES-agent-for-vG-MUX.patch
#RUN make UNATTENDED=yes install-dep
#RUN make pkg-deb

