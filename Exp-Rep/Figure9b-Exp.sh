#!/bin/bash

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.90 -u 10 >> Exp3b_res1.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.90 -u 12 >> Exp3b_res1.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.90 -u 14 >> Exp3b_res1.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.90 -u 16 >> Exp3b_res1.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.90 -u 18 >> Exp3b_res1.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.90 10 86400 >> Exp3b_res2.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.90 12 86400 >> Exp3b_res2.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.90 14 86400 >> Exp3b_res2.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.90 16 86400 >> Exp3b_res2.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.90 18 86400 >> Exp3b_res2.txt

rm output_0
