#!/usr/bin/env $SHELL
#
# Hey you, looking at this shell script!
# This script is supposed to set up the env where you can build/compile the
# code for this particular hardware.
#
#
# TODO: add a `--complete-setup` flag or something like that, where the build
# dependencies, and the archive tools are also installed... Also wget.
#
#
#
#
#
#

WORKDIR="${WORKDIR:-~/a9g}"

EXPECTED_BINARIES="7z unzip python"

for ii in ${EXPECTED_BINARIES} ; do
  which $ii 2>&1>/dev/null
  if test $? -ne 0 ; then
    >&2 echo "No ${ii} executable on available!"
    exit 1
  fi
done

mkdir -p $WORKDIR
cd $WORKDIR
if test ! -d "projects/GPRS_C_SDK" ; then
  mkdir projects
  [[ ! -f "GPRS_C_SDK_V2129.zip" ]] && wget https://github.com/ZakKemble/GPRS_C_SDK/releases/download/v2.129/GPRS_C_SDK_V2129.zip
  unzip GPRS_C_SDK_V2129.zip
  mv GPRS_C_SDK/ projects/
  chmod +x projects/GPRS_C_SDK/platform/compilation/elfCombine.pl
fi
if test ! -d "software/CSDTK42" ; then
  [[ ! -f "CSDTK42_Linux.tar.gz" ]] && wget https://github.com/ZakKemble/GPRS_C_SDK/releases/download/v2.129/CSDTK42_Linux.tar.gz
  [[ ! -f "CSDTK42_Update2_18_7_27.7z" ]] && wget https://github.com/ZakKemble/GPRS_C_SDK/releases/download/v2.129/CSDTK42_Update2_18_7_27.7z
  tar xzf CSDTK42_Linux.tar.gz
  mv CSDTK/ CSDTK42/
  7z x CSDTK42_Update2_18_7_27.7z -y
  mkdir software
  mv CSDTK42/ software/CSDTK42/
  cd software/CSDTK42/
  ./setup.sh ./ $WORKDIR/projects
fi


