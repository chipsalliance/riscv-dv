## Downloading and Installing EUVM

If you want to build/use the EUVM port, you need an EUVM installation. Please follow the instructions on https://github.com/coverify/euvm/releases to install and setup EUVM.

## Building EUVM port of RISCV-DV

A makefile to build and run the EUVM port is available in the euvm/build folder. To build the code, just run:

```bash
cd euvm/build
make -j 32
```

The optimal number of make threads depends on the the machine you are using to build. If your machine supports only 4 threads, use `make -j 4` instead. Due to heavy use of templated code, RISCV-DV EUVM compilation takes a lot of memory. If your machine is low on RAM (< 8GB), it is prudent to use only a couple of threads to build.

## Generating RISCV-DV tests

```bash
cd euvm/build
make run
```
