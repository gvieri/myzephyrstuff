#!/bin/bash 
# (c) 2021 Giovambattista Vieri 
# NO GUARANTEE AT ALL
# LICENSE APACHE 2.0


SPEED=115200

i=1
for line in `nrfjprog --com`: 
do
	
	if [ $i -eq 2 ]; then
		echo $line	
		mate-terminal -e "/bin/bash -c \" cu -l $line -s $SPEED\""
	fi 
	if [ $i -eq 3 ]; then
		i=0
	fi
	(( i++ ))

done
