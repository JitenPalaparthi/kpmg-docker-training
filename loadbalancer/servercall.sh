#!/bin/sh

a=0
while [ "$a" -lt 100 ]    # this is loop1
do
  curl localhost:58081/ping
  a=`expr $a + 1`
done