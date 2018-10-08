#!/bin/bash
cat loadserver1.txt | cut -d " " -f1 >> load1.txt
cat loadserver2.txt | cut -d " " -f1 >> load2.txt

