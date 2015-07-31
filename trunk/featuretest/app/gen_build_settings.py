#!/usr/bin/python

import sys

f = open('./src/main/java/com/mi/vtalk/business/utils/Constants.java', 'r')

s = ''

for line in f:
  line = line.replace("@SHIP.TO.2A2FE0D7@", sys.argv[1])
  s += line

f.close()

f = open('./src/main/java/com/mi/vtalk/business/utils/Constants.java', 'w')
f.write(s)