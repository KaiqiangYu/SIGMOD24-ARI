#!/bin/bash

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.90 -u 22 >> Exp3a_res1.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.90 -u 23 >> Exp3a_res1.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.90 -u 24 >> Exp3a_res1.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.90 -u 25 >> Exp3a_res1.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.90 -u 26 >> Exp3a_res1.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.90 22 86400 >> Exp3a_res2.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.90 23 86400 >> Exp3a_res2.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.90 24 86400 >> Exp3a_res2.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.90 25 86400 >> Exp3a_res2.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.90 26 86400 >> Exp3a_res2.txt

rm output_0