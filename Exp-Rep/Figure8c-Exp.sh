#!/bin/bash

../FastQC/build/FastQC -f "../dataset/hyves.txt" -g 0.94 -u 23 >> Exp2c_res1.txt

../FastQC/build/FastQC -f "../dataset/hyves.txt" -g 0.92 -u 23 >> Exp2c_res1.txt

../FastQC/build/FastQC -f "../dataset/hyves.txt" -g 0.90 -u 23 >> Exp2c_res1.txt

../FastQC/build/FastQC -f "../dataset/hyves.txt" -g 0.88 -u 23 >> Exp2c_res1.txt

../FastQC/build/FastQC -f "../dataset/hyves.txt" -g 0.86 -u 23 >> Exp2c_res1.txt

../quick+/app_qc/run "../dataset/hyves.txt" 1 0.94 23 86400 >> Exp2c_res2.txt

../quick+/app_qc/run "../dataset/hyves.txt" 1 0.92 23 86400 >> Exp2c_res2.txt

../quick+/app_qc/run "../dataset/hyves.txt" 1 0.90 23 86400 >> Exp2c_res2.txt

../quick+/app_qc/run "../dataset/hyves.txt" 1 0.88 23 86400 >> Exp2c_res2.txt

../quick+/app_qc/run "../dataset/hyves.txt" 1 0.86 23 86400 >> Exp2c_res2.txt

rm output_0