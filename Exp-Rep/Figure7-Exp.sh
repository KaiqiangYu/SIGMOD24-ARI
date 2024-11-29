#!/bin/bash

../FastQC/build/FastQC -f "../dataset/ca-GrQc.txt" -g 0.9 -u 10 >> Exp1_res1.txt

echo FastQC finished on ca-GrQC >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/ca-GrQc.txt" 1 0.9 10 86400 >> Exp1_res2.txt

echo Quick+ finished on ca-GrQC >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/opsahl.txt" -g 0.9 -u 20 >> Exp1_res1.txt

echo FastQC finished on opsahl >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/opsahl.txt" 1 0.9 20 86400 >> Exp1_res2.txt

echo Quick+ finished on opsahl >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/condmat.txt" -g 0.9 -u 10 >> Exp1_res1.txt

echo FastQC finished on condmat >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/condmat.txt" 1 0.9 10 86400 >> Exp1_res2.txt

echo Quick+ finished on condmat >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/Enron.txt" -g 0.9 -u 23 >> Exp1_res1.txt

echo FastQC finished on Enron >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/Enron.txt" 1 0.9 23 86400 >> Exp1_res2.txt

echo Quick+ finished on Enron >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/douban.txt" -g 0.9 -u 12 >> Exp1_res1.txt

echo FastQC finished on douban >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/douban.txt" 1 0.9 12 86400 >> Exp1_res2.txt

echo Quick+ finished on douban >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/Wordnet.txt" -g 0.9 -u 14 >> Exp1_res1.txt

echo FastQC finished on Wordnet >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/Wordnet.txt" 1 0.9 14 86400 >> Exp1_res2.txt

echo Quick+ finished on Wordnet >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/twitter.txt" -g 0.9 -u 6 >> Exp1_res1.txt

echo FastQC finished on twitter >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/twitter.txt" 1 0.9 6 86400 >> Exp1_res2.txt

echo Quick+ finished on twitter >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/hyves.txt" -g 0.9 -u 23 >> Exp1_res1.txt

echo FastQC finished on hyves >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/hyves.txt" 1 0.9 23 86400 >> Exp1_res2.txt

echo Quick+ finished on hyves >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/trec.txt" -g 0.96 -u 50 >> Exp1_res1.txt

echo FastQC finished on trec >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/trec.txt" 1 0.96 50 86400 >> Exp1_res2.txt

echo Quick+ finished on trec >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/Flixster.txt" -g 0.96 -u 35 >> Exp1_res1.txt

echo FastQC finished on Flixster >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/Flixster.txt" 1 0.96 35 86400 >> Exp1_res2.txt

echo Quick+ finished on Flixster >> Exp1_logs.txt

../FastQC/build/FastQC -f "../dataset/pokec.txt" -g 0.9 -u 32 >> Exp1_res1.txt

echo FastQC finished on pokec >> Exp1_logs.txt

../quick+/app_qc/run "../dataset/pokec.txt" 1 0.9 32 86400 >> Exp1_res2.txt

echo Quick+ finished on pokec >> Exp1_logs.txt

rm output_0
echo Exp-1 finished with logs being removed
rm Exp1_logs.txt


