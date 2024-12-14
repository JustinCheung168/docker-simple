# docker-simple-cpp

Simple docker image for containerized C++ development using CMake.

## Setting Up Your Project With This Image

This 

Include it as a top-level git submodule to your new C++ project. It will live in the `docker` folder of that project:
```bash
git submodule add git@github.com:JustinCheung168/docker-simple-cpp.git docker
```

## Using This Project To Build

Assuming you are at your project's top-level:
```bash
./docker/enterContainer.sh
```
