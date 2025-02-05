#!/bin/bash
#
# Copyright (c) 2017-present,  Xilinx, Inc.
# All rights reserved.
#

if [ $# -lt 2 ]; then
	echo "$0: <w1> <w0>"
	exit
fi

w1=$1
w0=$2

let "w0 = $w0 + 0"
let "w1 = $w1 + 0"

printf '\n0x%08x 0x%08x\n\n' $w1 $w0

printf '\nW1 0x%08x:\n' $w1

let "v = ($w1 >> 15) & 0x1"
printf '[47]     (W1[15])     rsvd        0x%x\n' $v

let "v = ($w1 >> 11) & 0xF"
printf '[46:43]  (W1[14:11])  fetch_pnd   0x%x\n' $v

let "v = ($w1 >> 10) & 0x1"
printf '[42]     (W1[10])     evt_pnd     0x%x\n' $v

let "v = ($w1 >> 9) & 0x1"
printf '[41]     (W1[9])      idl_stp_b   0x%x\n' $v

let "v = ($w1 >> 8) & 0x1"
printf '[40]     (W1[8])      dsc_pnd     0x%x\n' $v

let "v = $w1 & 0xFF"
printf '[39:32]  (W1[7:0])    rsvd        0x%x\n' $v

printf '\nW0 0x%08x:\n' $w0

let "v = ($w0 >> 16) & 0xFFFF"
printf '[31:16]  (W0[31:16]   crd_use     0x%x\n' $v

let "v = $w0 & 0xFFFF"
printf '[15:0]   (W0[15:0]    cidx        0x%x\n' $v
