#!/bin/bash

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.94 -u 23 >> Exp2a_res1.txt

echo FastQC finished on 0.94 >> Exp8a_logs.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.92 -u 23 >> Exp2a_res1.txt

echo FastQC finished on 0.92 >> Exp8a_logs.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.90 -u 23 >> Exp2a_res1.txt

echo FastQC finished on 0.90 >> Exp8a_logs.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.88 -u 23 >> Exp2a_res1.txt

echo FastQC finished on 0.88 >> Exp8a_logs.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.86 -u 23 >> Exp2a_res1.txt

echo FastQC finished on 0.86 >> Exp8a_logs.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.94 23 86400 >> Exp2a_res2.txt

echo Quick+ finished on 0.94 >> Exp8a_logs.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.92 23 86400 >> Exp2a_res2.txt

echo Quick+ finished on 0.92 >> Exp8a_logs.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.90 23 86400 >> Exp2a_res2.txt

echo Quick+ finished on 0.90 >> Exp8a_logs.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.88 23 86400 >> Exp2a_res2.txt

echo Quick+ finished on 0.88 >> Exp8a_logs.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.86 23 86400 >> Exp2a_res2.txt

echo Quick+ finished on 0.86 >> Exp8a_logs.txt

rm output_0

echo Exp-8a finished with logs being removed
rm Exp8a_logs.txt