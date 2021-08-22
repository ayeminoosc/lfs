FROM ubuntu:21.10

# image info
LABEL description="Host OS Image for Building LFS System  \n this image contains the work until the end of chapter 4 from LFS 10.1 book"
LABEL version="LFS-10.1"
LABEL maintainer="ayeminoosc@gmail.com"

ENV PATH=/tools/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV MAKEFLAGS="-j 1"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="America/New_York"
ARG LFS_SOURCES="http://www.linuxfromscratch.org"
# LFS mount point
ENV LFS=/mnt/lfs
# install required packages
RUN apt-get update && apt-get install -y \
    bash                                 \
    binutils                             \
    bison                                \
    bzip2                                \
    coreutils                            \
    diffutils                            \
    findutils                            \
    gawk                                 \
    gcc                                  \
    g++                                  \
    glibc-source                         \
    grep                                 \
    gzip                                 \
    m4                                   \
    make                                 \
    patch                                \
    perl                                 \
    python3                              \
    sed                                  \
    tar                                  \
    texinfo                              \
    xz-utils                             \
    genisoimage                          \
    wget                                 \
 && apt-get -q -y autoremove

# set bash as default shell
WORKDIR /bin
RUN rm sh && ln -s bash sh

# create sources directory as writable and sticky
RUN mkdir -pv     $LFS/sources \
 && chmod -v a+wt $LFS/sources

#download sources and check md5sums
COPY "scripts/download-sources.sh" "$LFS/sources/"
RUN chmod +x $LFS/sources/download-sources.sh
RUN $LFS/sources/download-sources.sh


COPY "scripts/version-check.sh" "$LFS/sources/"
RUN chmod +x $LFS/sources/version-check.sh
RUN $LFS/sources/version-check.sh

#4.2 creating a limited direcotry layout in LFS filesystem
RUN mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var}sudo
RUN case $(uname -m) in                 \
      x86_64) mkdir -pv $LFS/lib64 ;;   \
    esac

# In order to separate this cross-compiler from the other programs, it will be installed in a special directory.
RUN mkdir -pv $LFS/tools

#4.3 Adding the LFS User
# create lfs user with 'lfs' password
RUN groupadd lfs                                    \
 && useradd -s /bin/bash -g lfs -m -k /dev/null lfs \
 && echo "lfs:lfs" | chpasswd
RUN adduser lfs sudo

# Grant lfs full access to all directories under $LFS by making lfs the directory owner:
RUN chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
RUN case $(uname -m) in                       \
      x86_64) chown -v lfs $LFS/lib64 ;;      \
    esac

RUN mv /bin/*.tar.* $LFS/sources/ && mv /bin/*.patch $LFS/sources/

#4.4 Setting Up the Environment
#Copy bash_profile and .bashrc to home directory of the container
COPY [ "config/.bash_profile", "config/.bashrc", "/home/lfs/" ]
USER lfs
#Finally, to have the environment fully prepared for building the temporary tools, source the just-created user profile:
RUN source ~/.bash_profile