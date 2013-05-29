#!/bin/sh
cd `dirname $0`/build
ant clean && ant build && echo "1.5.3_beta_pcDuino" | ant dist
