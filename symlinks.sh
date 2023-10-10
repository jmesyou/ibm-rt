#!/bin/bash

for jdk in jdk8 jdk11 jdk17
do
  ln -sf ../openj9 $jdk/openj9
  ln -sf ../omr    $jdk/omr
done
