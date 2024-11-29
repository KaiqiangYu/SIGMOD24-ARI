#!/bin/bash

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.94 -u 32 >> Exp2d_res1.txt

echo FastQC finished on 0.94 >> Exp8d_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.92 -u 32 >> Exp2d_res1.txt

echo FastQC finished on 0.92 >> Exp8d_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.90 -u 32 >> Exp2d_res1.txt

echo FastQC finished on 0.90 >> Exp8d_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.88 -u 32 >> Exp2d_res1.txt

echo FastQC finished on 0.88 >> Exp8d_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.86 -u 32 >> Exp2d_res1.txt

echo FastQC finished on 0.86 >> Exp8d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.94 32 86400 >> Exp2d_res2.txt

echo Quick+ finished on 0.94 >> Exp8d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.92 32 86400 >> Exp2d_res2.txt

echo Quick+ finished on 0.92 >> Exp8d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.90 32 86400 >> Exp2d_res2.txt

echo Quick+ finished on 0.90 >> Exp8d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.88 32 86400 >> Exp2d_res2.txt

echo Quick+ finished on 0.88 >> Exp8d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.86 32 86400 >> Exp2d_res2.txt

echo Quick+ finished on 0.86 >> Exp8d_logs.txt

rm output_0

echo Exp-8d finished with logs being removed
rm Exp8d_logs.txt