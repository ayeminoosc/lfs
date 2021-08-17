FROM ayeminoosc/lfs-ubuntu-host:10.1

# image info
LABEL description="Image for building essential toolchain that is needed to start building LFS binaries  \n this image contains the work from chapter 5 until the end of chapter 7 from LFS 10.1 book"
LABEL version="LFS-10.1"
LABEL maintainer="ayeminoosc@gmail.com"

ENV MAKEFLAGS="-j 1"
# LFS mount point
ENV LFS=/mnt/lfs

# set bash as default shell
WORKDIR $LFS/sources

USER root
#copy sources from host image to toolchain image
RUN mv /bin/*.tar.* $LFS/sources/ && mv /bin/*.patch $LFS/sources/

COPY scripts /opt/scripts
RUN chmod +x /opt/scripts/toolchain/5-cross-toolchain/*.sh              \
    && chmod +x /opt/scripts/toolchain/6-temorary-tools/*.sh            \
    && chmod +x /opt/scripts/toolchain/7-additional-temp-tools/*.sh     \
 && chmod +x /opt/scripts/generic-compile.sh                                    \
 && chmod +x /opt/scripts/5-build-cross-toolchain.sh                            \
 && chmod +x /opt/scripts/6-build-temporary-tools.sh                            \
 && chmod +x /opt/scripts/7-build-additional-tools.sh

# If a separate working directory was created as suggested, give user lfs ownership of this directory:
RUN chown -v lfs $LFS/sources

# login as lfs user
USER lfs
#RUN /opt/scripts/5-build-cross-toolchain.sh
#RUN /opt/scripts/6-build-temporary-tools.sh
#RUN /opt/scripts/7-build-additional-tools.sh