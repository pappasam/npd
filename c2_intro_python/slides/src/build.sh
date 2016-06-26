#!/bin/bash

source venv/bin/activate

SESSIONS="s1_functions s2_objects_classes s3_unit_testing s4_io_data s5_everything_object s6_func_programming s7_intro_web"

for SESSION in $SESSIONS; do
  j2=jinja2/$SESSION.md
  if [ -a $j2 ]; then
    echo $j2
    ./build.py $j2 > ../$SESSION.html
  fi
done
