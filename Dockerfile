ARG VERSION=latest
FROM amitie10g/msys2:$VERSION

ARG MSYSTEM=MINGW64
ARG TOOLCHAIN=mingw-w64-x86_64-toolchain

ENV MSYSTEM=${MSYSTEM}

RUN setx path "C:\msys64\mingw64\bin;C:\msys64\mingw32\bin;%PATH%" && \
	bash -l -c " \
		pacman -S --needed --noconfirm --noprogressbar --disable-download-timeout \
			${TOOLCHAIN} \
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
		rm -r /var/cache/pacman/pkg/* \
	"

CMD ["bash", "-l"]
