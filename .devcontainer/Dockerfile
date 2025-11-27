FROM espressif/idf:v5.5.1

ARG DEBIAN_FRONTEND=nointeractive
ARG CONTAINER_USER=ubuntu

RUN apt-get update \
  && apt install -y -q \
  cmake \
  git \
  libglib2.0-0 \
  libnuma1 \
  libpixman-1-0 \
  udev \
  libusb-1.0-0

# ESP clang
# https://github.com/espressif/llvm-project
# this is a specific clang build for xtensa target.
# clang will be used by clang extension and may be used by other C/cpp check tools.
ENV ESP_CLANG_SHA256=88910c21350c06a521f243304d1a3adbdb78447123b3f8e27493aab75e3cc07f
ENV ESP_CLANG_DIST=clang-esp-20.1.1_20250829-x86_64-linux-gnu.tar.xz
ENV ESP_CLANG_URL=https://github.com/espressif/llvm-project/releases/download/esp-20.1.1_20250829/${ESP_CLANG_DIST}

RUN wget --no-verbose ${ESP_CLANG_URL} \
  && echo "${ESP_CLANG_SHA256} *${ESP_CLANG_DIST}" | sha256sum --check --strict - \
  && tar -xf $ESP_CLANG_DIST -C /opt \
  && rm ${ESP_CLANG_DIST}

# These files are used for development container to format and check code
RUN apt-get install -qq \
  clang-format \
  cmake-format \
  python3-pip \
  pre-commit \
  cppcheck \
  cpplint \
  zsh

RUN apt-get purge --autoremove -qq \
  && rm -rf /var/lib/apt/lists/*

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN usermod -a -G root $CONTAINER_USER && usermod -a -G dialout $CONTAINER_USER

RUN chmod -R 775 /opt/esp/python_env/

USER ${CONTAINER_USER}
ENV USER=${CONTAINER_USER}
WORKDIR /home/${CONTAINER_USER}

RUN echo "source /opt/esp/idf/export.sh > /dev/null 2>&1" >> ~/.bashrc

ENTRYPOINT [ "/opt/esp/entrypoint.sh" ]

CMD ["/bin/bash", "-c"]
