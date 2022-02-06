#!/bin/bash

set -eu

#export LABEL="I9W" ; export ZONE="EAST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
#export LABEL="I9W" ; export ZONE="WEST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt

#export LABEL="I9W1" ; export ZONE="EAST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
#export LABEL="I9W1" ; export ZONE="WEST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt

#export LABEL="I9L1" ; export ZONE="EAST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
#export LABEL="I9L1" ; export ZONE="WEST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt

export LABEL="ACE" ; export ZONE="EAST"  ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
export LABEL="ACE" ; export ZONE="WEST"  ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
export LABEL="ACE" ; export ZONE="LOCAL" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
export LABEL="ACE" ; export ZONE="DEV"   ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt

export LABEL="I9W2" ; export ZONE="EAST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
export LABEL="I9W2" ; export ZONE="WEST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt

export LABEL="I9L2" ; export ZONE="EAST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
export LABEL="I9L2" ; export ZONE="WEST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt

#export LABEL="P340" ; export ZONE="EAST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt
#export LABEL="P340" ; export ZONE="WEST" ; ./run.bash "${LABEL}/" | tee -i /dev/tty > ${LABEL}_${ZONE}.txt

#./run.bash "GC1/" | tee -i /dev/tty > gc1.txt
#./run.bash "GC2/" | tee -i /dev/tty > gc2.txt
#./run.bash "GRAV/" | tee -i /dev/tty > gravenstein.txt
#./run.bash "SAND/L/" | tee -i /dev/tty > sandman_wsl.txt
#./run.bash "SIDE/L/" | tee -i /dev/tty > sidekick_wsl.txt
#./run.bash "SAND/W/" | tee -i /dev/tty > sandman_win.txt
#./run.bash "SIDE/W/" | tee -i /dev/tty > sidekick_win.txt
#./run.bash "TACO/" | tee -i /dev/tty > taco.txt
#./run.bash "MAUD/" | tee -i /dev/tty > maude.txt
#./run.bash "WEST/" | tee -i /dev/tty > west.txt
#./run.bash "iPad/" | tee -i /dev/tty > ipad.txt
