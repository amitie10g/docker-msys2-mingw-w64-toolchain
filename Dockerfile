ARG TOOLCHAIN=mingw-w64-x86_64-toolchain
ARG MSYSTEM=MINGW64
ARG VERSION=latest
FROM amitie10g/msys2:$VERSION AS base

ARG MSYSTEM
ENV MSYSTEM=${MSYSTEM}

RUN setx path "C:\msys64\mingw64\bin;C:\msys64\mingw32\bin;%PATH%"

SHELL ["bash", "-l", "-c"]
RUN "pacman -S --needed --noconfirm --noprogressbar --disable-download-timeout \
    	make \
    	texinfo \
    	diffutils \
    	bison \
    	flex \
    	gperf \
    	automake \
    	autoconf\
    	intltool \
    	libtool \
    	python3 && \
    rm -r /var/cache/pacman/pkg/*"

FROM base AS toolchain
ARG MSYSTEM
ENV MSYSTEM=${MSYSTEM}
ARG TOOLCHAIN
RUN "pacman -S --needed --noconfirm --noprogressbar --disable-download-timeout ${TOOLCHAIN} && rm -r /var/cache/pacman/pkg/*"

CMD ["bash", "-l"]
