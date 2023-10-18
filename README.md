# MSYS2 MinGW-W64 toolchain Docker image under Windows

This is an attemp to bring several toolchains for MSYS2, under [Microsoft® Windows® Server Core](https://hub.docker.com/_/microsoft-windows-servercore) Docker image, intended to be used in my own projects.

## Tags
The fillowing toolchains are provided, with the ``MSYSTEM`` env properly configured.

* ``gcc-x86_64``  ``gcc`` ``latest`` provides [GCC x86_64 (MINGW64)](https://packages.msys2.org/groups/mingw-w64-x86_64-toolchain)
* ``ucrt`` provides [GCC x86_64 (UCRT64)](https://packages.msys2.org/groups/mingw-w64-ucrt-x86_64-toolchain)
* ``gcc-i686`` provides [GCC i686 (MINGW32)](https://packages.msys2.org/groups/mingw-w64-i686-toolchain)
* ``clang-x86_64`` provides [Clang x86_64 (CLANG64)](https://packages.msys2.org/groups/mingw-w64-clang-x86_64-toolchain)
* ``clang-i686`` provides [Clang i686 (CLANG32)](https://packages.msys2.org/groups/mingw-w64-clang-i686-toolchain)
* ``clang-aarch64`` provides [Clang arm64 (CLANGARM64)](https://packages.msys2.org/groups/mingw-w64-clang-aarch64-toolchain)
* ``clang-x86_64-riscv64`` provides [Clang riscv64 (CLANG64)](https://packages.msys2.org/groups/mingw-w64-clang-x86_64-riscv64-unknown-elf-toolchain)
* ``clang-i686-riscv64`` provides [Clang riscv64 (CLANG32)](https://packages.msys2.org/groups/mingw-w64-clang-i686-riscv64-unknown-elf-toolchain)
* ``x86_64-riscv64`` provides [GCC riscv64 (MINGW64)](https://packages.msys2.org/groups/mingw-w64-x86_64-riscv64-unknown-elf-toolchain)
* ``ucrt-x86_64-riscv64`` provides [GCC riscv64 (UCRT64)](https://packages.msys2.org/groups/mingw-w64-ucrt-x86_64-riscv64-unknown-elf-toolchain)
* ``i686-riscv64`` provides [GCC riscv64 (MINGW32)](https://packages.msys2.org/groups/mingw-w64-i686-riscv64-unknown-elf-toolchain)
* ``cross-gcc`` ``cross``  provides [Cross GCC (MINGW32)](https://packages.msys2.org/groups/mingw-w64-cross-toolchain)
* ``cross-clang`` provides [Cross Clang (MINGW32)](https://packages.msys2.org/groups/mingw-w64-cross-clang-toolchain)


Under Windows Server Core versions ``ltsc2022`` and ``ltsc2019 ``

## Usage
MSYS Bash interactive shell (default)
```
docker run -it -v host-src:container-dest --workdir="container-dest" amitie10g/msys2-mingw-w64-toolchain
```

x86_64 toolchain using ``make install``
```
docker run -e MSYSTEM=MINGW64 --volume=host-src:container-dest --workdir="container-dest" amitie10g/msys2-mingw-w64-toolchain make install
```

i686 toolchain using ``make install``
```
docker run -e MSYSTEM=MINGW32 -e --volume=host-src:container-dest --workdir="container-dest" amitie10g/msys2-mingw-w64-toolchain make install
```

Windows CMD interactive shell
```
docker run -it --volume=host-src:container-dest --workdir="container-dest" amitie10g/msys2-mingw-w64-toolchain cmd
```

Windows Powershell interactive shell
```
docker run -it --volume=host-src:container-dest --workdir="container-dest" amitie10g/msys2-mingw-w64-toolchain powershell
```

If you want to use the MinGW32 environment, you must append ``C:\msys64\mingw32\bin``(under CMD shell) to the PATH environment at runtime, or set in an Entrypoint script.

The default workdir is ``C:\msys64``. Set another workdir is recommended only for runing non-interactive building process like ``make``.

## Using this base image
### Dockerfile

```
ARG VERSION=latest
FROM amitie10g/msys2-mingw-w64-toolchain:$VERSION

<your code>
```

### Command line

x86_64 toolchain
```
docker build --build-arg -t <your tag> .
```

i686 toolchain
```
docker build --build-arg VERSION=i686 -t <your tag> .
```

## Packages and dependencies
This image depends on the [MSYS2 base image](https://hub.docker.com/repository/docker/amitie10g/msys2) ([Dockerfile](https://github.com/Amitie10g/docker-msys2/blob/servercore/Dockerfile)), where the following packages are installed:

* autoconf
* automake
* bison
* diffutils
* flex
* gperf
* intltool
* libtool
* make
* texinfo

## Caveats
Due the Windows Server Core base image, this image is HUGE. I'm researching how to use Nano Server instead.

## Licensing
* The **Dockerfile** has been released into the **public domain** (the Unlicense)

* The MSYS2, MinGW-w64 and the packages included in the container are licensed under several licenses (including the **[GNU General Public License](https://en.wikipedia.org/wiki/GNU_General_Public_License)** and other open source licenses). Please refer to them.

* The Windows container base image usage is subjected to the **[Microsoft EULA](https://docs.microsoft.com/en-us/virtualization/windowscontainers/images-eula)**.
