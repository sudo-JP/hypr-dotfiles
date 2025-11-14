#!/bin/bash
if ! grep -q "#include <stdlib.h>" ./test.c; then 
    { echo "#include <stdlib.h>"; cat test.c; } > test2.c && mv test2.c test.c
fi
