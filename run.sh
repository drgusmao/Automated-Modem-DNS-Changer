#!/bin/bash

CL187="187"
CL189="189"
CL201="201"
CL200="200"
CL186="186"
CL177="177"

while :;
do
for scan in $(seq 1 125)
  do
  sh by.sh $CL187.$scan
  sh by.sh $CL189.$scan
  sh by.sh $CL201.$scan
  sh by.sh $CL200.$scan
  sh by.sh $CL186.$scan
  sh by.sh $CL177.$scan
  done
done

rm -rf 1* 4*
exit 0;
