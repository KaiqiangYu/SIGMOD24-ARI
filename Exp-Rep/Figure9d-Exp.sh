#!/bin/bash

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.90 -u 26 >> Exp3d_res1.txt

echo FastQC finished on 26 >> Exp9d_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.90 -u 28 >> Exp3d_res1.txt

echo FastQC finished on 28 >> Exp9d_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.90 -u 30 >> Exp3d_res1.txt

echo FastQC finished on 30 >> Exp9d_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.90 -u 32 >> Exp3d_res1.txt

echo FastQC finished on 32 >> Exp9d_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.90 -u 34 >> Exp3d_res1.txt

echo FastQC finished on 34 >> Exp9d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.90 26 86400 >> Exp3d_res2.txt

echo Quick+ finished on 26 >> Exp9d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.90 28 86400 >> Exp3d_res2.txt

echo Quick+ finished on 28 >> Exp9d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.90 30 86400 >> Exp3d_res2.txt

echo Quick+ finished on 30 >> Exp9d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.90 32 86400 >> Exp3d_res2.txt

echo Quick+ finished on 32 >> Exp9d_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.90 34 86400 >> Exp3d_res2.txt

echo Quick+ finished on 34 >> Exp9d_logs.txt

rm output_0

echo Exp-9d finished with logs being removed
rm Exp9d_logs.txt