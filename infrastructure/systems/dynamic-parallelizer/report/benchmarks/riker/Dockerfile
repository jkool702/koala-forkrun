FROM hs

WORKDIR /

RUN dnf install -y --skip-unavailable make clang llvm git gcc python3-cram file graphviz
RUN git clone --recursive https://github.com/curtsinger-lab/riker.git

WORKDIR /riker
RUN make
RUN sudo make install