#!/bin/bash

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.94 -u 14 >> Exp2b_res1.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.92 -u 14 >> Exp2b_res1.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.90 -u 14 >> Exp2b_res1.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.88 -u 14 >> Exp2b_res1.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.86 -u 14 >> Exp2b_res1.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.94 14 86400 >> Exp2b_res2.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.92 14 86400 >> Exp2b_res2.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.90 14 86400 >> Exp2b_res2.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.88 14 86400 >> Exp2b_res2.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.86 14 86400 >> Exp2b_res2.txt

rm output_0