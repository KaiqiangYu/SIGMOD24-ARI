# Readme for reproducibility submission of Paper 30
This work, entitled "Fast Maximal Quasi-clique Enumeration: A Pruning and Branching Co-Design Approach", has been accepted by SIGMOD'2023. In this paper, we study the problem of enumerating all maximal $\gamma$-quasi-cliques (MQCs) with the number of vertices inside at least an integer $\theta$ in a given graph $G$. Thus, the inputs include a graph $G$, a real number $\gamma\in (0,1)$ and an integer $\theta>0$.


## 1. Algorithms
### Our proposed algorithm: DCFastQC
The source code of DCFastQC can be found in `./FastQC`

### Baseline method: Quick+
The source code of Quick+ is from the authors of "Parallel mining of
large maximal quasi-cliques. The VLDB Journal 31, 4 (2022), 649–674.", which is also publicly avaiable via "https://github.com/yanlab19870714/Tthinker".


## 2. Hardware info
Programming Language: `C++`
 
Compiler Info: `gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0 `

Memory: `128GB` & CPU: `Intel(R) Xeon(R) Gold 6230R CPU @ 2.10GH`

Packages/Libraries Needed: `CMake 2.8` (optional), `makefile` and `Python3` (including `numpy` and `matplotlib` for ploting figures)

## 3. Datasets info
All datasets used in our experiments are from the [KONECT](http://konect.cc/networks/ "KONECT") website. We provided four small datasets, i.e., Divorce, Cfat, Cities, and Writer, in the folder "./code/dataset". **You need to unzip the dataset first.**


## 4. Compile and Usage
### 4.1 Compile DCFastQC under folder `./FastQC/`
#### Option 1 (without CMake)
```shell
mkdir build
cd build
g++ ../main.cpp -O3 -o FastQC
```
#### Option 2 (using CMake)
```shell
mkdir build
cd build
cmake ..
make
```

### 4.2 Usage of DCFastQC
  ./FastQC {OPTIONS}

    DCFastQC, an efficient algorithm for enumerating MQCs

  OPTIONS:

      -h, --help                          Display this help menu
      -f[dataset], --file=[dataset]       Path to dataset
      -g[para gamma], --g=[para gamma]    The parameter gamma
      -u[para theta] --u=[para theta]     The threshold of number of vertices within a found MQC
      -q[quiet], --q=[quiet]              -q 0 (by default): without output; -q 1: output QCs to file

### 4.3 Compile Quick+ under folder `./quick+/app_qc/`

```
make
```

### 4.4 Usage of Quick+
We have provided the scripts for reproducing the results. If you want to learn the details of the usage of Quick+, please refer to "https://github.com/yanlab19870714/Tthinker".


## 5. Scripts for reproducing and visualizing the key results

We provide the scripts for reproducing and visualizing Figure 7, Figure 8 (a-d), and Figure 9 (a-d) in the folder `./Exp-Rep`. We remark that **before conducting this step, you need to ensure that both DCFastQC and Quick+ have been complied with successfully, and the datasets are unzipped**.

### 5.1. Reproducing and visualizing Figure 7 under folder `./Exp-Rep`

Step 1: Reproduce the results (Estimated time: **1-2 hours**)
```
chmod +x Figure7-Exp.sh
./Figure7-Exp.sh
```
Step 2: Visualizing Figure 7 (python 3.X)
```
python Plot_Fig7.py
```

You can find a PDF file `Figure7` under the current folder.

**Remark.** The provided scripts do not reproduce three datasets, including FullUSA, Kmer and UK2002, since they have the storage usage around 10GB and cannot be included into the package. They can be download from KONECT website and then the results can be reproduced easily following the provided scripts.

### 5.2. Reproducing and visualizing Figure 8 (a-d) under `./Exp-Rep`

#### 5.2.1. Figure 8(a)
Step 1: Reproduce the results (Estimated time: **2-3 hours**)
```
chmod +x Figure8a-Exp.sh
./Figure8a-Exp.sh
```
Step 2: Visualizing the figure (python 3.X)
```
python Plot_Fig8a.py
```
You can find a PDF file `Figure8a` under the current folder.


#### 5.2.2. Figure 8(b)
Step 1: Reproduce the results (Estimated time: **3 mins**)
```
chmod +x Figure8b-Exp.sh
./Figure8b-Exp.sh
```
Step 2: Visualizing the figure (python 3.X)
```
python Plot_Fig8b.py
```
You can find a PDF file `Figure8b` under the current folder.

#### 5.2.3. Figure 8(c)
Step 1: Reproduce the results (Estimated time: **10-20 mins**)
```
chmod +x Figure8c-Exp.sh
./Figure8c-Exp.sh
```
Step 2: Visualizing the figure (python 3.X)
```
python Plot_Fig8c.py
```
You can find a PDF file `Figure8c` under the current folder.


#### 5.2.4. Figure 8(d)
Step 1: Reproduce the results (Estimated time: **6-7 hours**)
```
chmod +x Figure8d-Exp.sh
./Figure8d-Exp.sh
```
Step 2: Visualizing the figure (python 3.X)
```
python Plot_Fig8d.py
```
You can find a PDF file `Figure8d` under the current folder.


### 5.3. Reproducing and visualizing Figure 9 (a-d) under `./Exp-Rep`

#### 5.3.1. Figure 9(a)
Step 1: Reproduce the results (Estimated time: **1 hour**)
```
chmod +x Figure9a-Exp.sh
./Figure9a-Exp.sh
```
Step 2: Visualizing the figure (python 3.X)
```
python Plot_Fig9a.py
```
You can find a PDF file `Figure9a` under the current folder.


#### 5.3.2. Figure 9(b)
Step 1: Reproduce the results (Estimated time: **20 mins**)
```
chmod +x Figure9b-Exp.sh
./Figure9b-Exp.sh
```
Step 2: Visualizing the figure (python 3.X)
```
python Plot_Fig9b.py
```
You can find a PDF file `Figure9b` under the current folder.

#### 5.3.3. Figure 9(c)
Step 1: Reproduce the results (Estimated time: **1-2 hours**)
```
chmod +x Figure9c-Exp.sh
./Figure9c-Exp.sh
```
Step 2: Visualizing the figure (python 3.X)
```
python Plot_Fig9c.py
```
You can find a PDF file `Figure9c` under the current folder.


#### 5.3.4. Figure 9(d)
Step 1: Reproduce the results (Estimated time: **24+ hours**)
```
chmod +x Figure9d-Exp.sh
./Figure9d-Exp.sh
```
Step 2: Visualizing the figure (python 3.X)
```
python Plot_Fig9d.py
```
You can find a PDF file `Figure9d` under the current folder.

## 6. Remark

We do not reproduce Figures 10-12 since they correspond to the ablation study of our proposed algorithm. We remark that the reproduced results, i.e., Figures 7-9, demonstrate the superiority of our algorithm DCFastQC against the state-of-the-art Quick+, and they also verify that our DCFastQC achieves better worst-case time complexity.
