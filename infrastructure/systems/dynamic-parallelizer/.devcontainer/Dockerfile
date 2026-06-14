FROM fedora:39

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Stop warnings from dnf
ENV DNF_AUTOASSUME=yes

# Install packages
RUN dnf install -y --skip-unavailable \
    # dev dependencies
    make clang clang-format llvm-devel gdb git \
    # test dependencies
    gcc python3-cram file graphviz texlive-latex-base gcc-c++ \
    # bench dependencies
    cmake wget m4 \
    # misc
    ca-certificates sudo

# Create a non-root user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Clean up
RUN dnf autoremove -y \
    && dnf clean -y
