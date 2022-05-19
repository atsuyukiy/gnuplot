# gnuplot
Alpine Linux based gnuplot v5.4.3

## Supported Tags
- `5.4.3`, `latest`

## Quick Start
```
docker run --rm -v /your/project:/var/gnuplot atsuyukiy/gnuplot plot.file
```

## Build Image with Specific Version
Pull dockerfile from GitHub repository
```
git pull https://github.com/atsuyukiy/gnuplot.git
```
Build docker image
```
docker build -t gnuplot --build-arg VERSION=x.x.x ./
```
