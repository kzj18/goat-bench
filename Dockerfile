FROM nvidia/cudagl:11.8.0-devel-ubuntu20.04

RUN echo "\
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse\n\
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse\n\
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse\n\
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse\n\
" > /etc/apt/sources.list

RUN apt update && apt upgrade -y && apt install -y sudo bash-completion wget

RUN useradd -m -s /bin/bash kzj18

RUN echo "kzj18 ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/kzj18

USER kzj18

WORKDIR /home/kzj18

ENTRYPOINT [ "/bin/bash" ]

RUN mkdir -p /home/kzj18/Projects/goat-bench

COPY --chown=kzj18:kzj18 . /home/kzj18/Projects/goat-bench