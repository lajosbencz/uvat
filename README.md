# uvat
Universal Vehicle Attitude Tracker

## Libraries

[ZakKemble's release](https://github.com/ZakKemble/GPRS_C_SDK/releases/tag/v2.129)

## Workspace setup

```
WORKDIR=~/a9g
[ ! -d "$WORKDIR" ] && mkdir -p $WORKDIR
cd $WORKDIR
if [! -d "projects/GPRS_C_SDK" ]; then
  mkdir projects
  [ ! -f "GPRS_C_SDK_V2129.zip" ] && wget https://github.com/ZakKemble/GPRS_C_SDK/releases/download/v2.129/GPRS_C_SDK_V2129.zip
  unzip GPRS_C_SDK_V2129.zip
  mv GPRS_C_SDK/ projects/
fi
if [! -d "software/CSDTK42" ]; then
  [ ! -f "CSDTK42_Linux.tar.gz" ] && wget https://github.com/ZakKemble/GPRS_C_SDK/releases/download/v2.129/CSDTK42_Linux.tar.gz
  [ ! -f "CSDTK42_Update2_18_7_27.7z" ] && wget https://github.com/ZakKemble/GPRS_C_SDK/releases/download/v2.129/CSDTK42_Update2_18_7_27.7z
  tar xzf CSDTK42_Linux.tar.gz
  mv CSDTK/ CSDTK42/
  7z x CSDTK42_Update2_18_7_27.7z -y
  mkdir software
  mv CSDTK42/ software/CSDTK42/
  cd software/CSDTK42/
  ./setup.sh ./ $WORKDIR/projects
fi
```
