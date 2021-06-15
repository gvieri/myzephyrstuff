#!/bin/bash
#
# (c) 2021 Vieri Giovambattista 
# NO GUARANTEE AT ALL OF ANY SORT. THIS SCRITP MAY MAKE YOU BALD OR DELETE YOUR DATA
# license APACHE 2.0 
#

if [ $# -eq 0 ]
  then
    echo "plese insert relative path to the project to compile"
fi

echo 'This utility will try to compile for nrf5340 net core. If you need another target please modify the value of BOARD accordingly.'
echo 'If you need to make a test remember to disable one of loading method. You must choose between nrfjprog --program OR west flash' 


BOARD=nrf5340dk_nrf5340_cpunet
BUILD=~/build

rm -rf $BUILD/*

west build  -p auto -b $BOARD $1 -d $BUILD



echo "---------------------------------------------"
west flash -d $BUILD

echo "---------------------------------------------"
echo 'nrfjprog  --recover'
nrfjprog  --recover

echo "nrfjprog  --program  $BUILD/zephyr/zephyr.hex"

nrfjprog  --program  $BUILD/zephyr/zephyr.hex

echo "---------------------------------------------" 

nrfjprog -v 
echo "---------------------------------------------" 
echo "nrfjprog -i:"
nrfjprog -i 
echo "nrfjprog --deviceversion:"
nrfjprog --deviceversion
echo $'\n---------------------------------------------' 
uname -osrm
