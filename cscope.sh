#!/bin/bash
find /home/eemimaj/repos/bpu-up -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' > /home/eemimaj/repos/bpu-up/cscope.files

cd /home/eemimaj/repos/bpu-up
cscope -b
ctags -L cscope.files
