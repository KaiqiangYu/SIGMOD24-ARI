import sys
import getopt
import numpy as np
import matplotlib.pyplot as plt

res1=[]
with open("Exp1_res1.txt","r") as f:
	str1=f.readline()
	while str1 is not None and str1 != '':
		res1.append(float(str1))
		str1=f.readline()

f.close()

res2=[]
with open("Exp1_res2.txt","r") as f:
	str1=f.readline()
	while str1 is not None and str1 != '':
		res2.append(float(str1))
		str1=f.readline()

f.close()

while len(res2)<11:
	res2.append(50000);
	

plt.rcParams['font.sans-serif'] = 'Times New Roman'


marks = ["","","///",""]
colors = ["gray","w","w","w","w"]
width = 0.28  # the width of the bars

labels = ['Ca-GrQc','Opsahl','Condmat','Enron','Douban','WordNet','Twitter', 'Hyves', 'Trec','Flixster','Pokec']
legend = ['DCFastQC','Quick+']
y=[res1,res2]

plt.ylim((0.01,50000))


x = np.arange(len(labels))  # the label locations
fig1, ax = plt.subplots()
group=len(y);
for i in range(0,group):
    rects = ax.bar(x - (group-2*i-1)*width/2, y[i], width, label=legend[i],color=colors[i],edgecolor="k")
    #rects2 = ax.bar(x + width/2, y[1], width, label='Women',color=colors[i],edgecolor="k")
    for bar in rects:
        bar.set_hatch(marks[i])


ax.set_ylabel('Running time (sec)',fontsize=14.5)
#ax.set_xlabel('$\\theta$',fontsize=14.5)
ax.set_yscale('log')
ax.set_xticks(x)
for tick in ax.get_xticklabels():
    tick.set_rotation(30)
ax.set_xticklabels(labels,fontsize=14.5)
ax.set_yticks([0.01,0.1,1,10,100,1000,10000])
ax.set_yticklabels(['$10^{-2}$','$10^{-1}$','$10^{0}$','$10^1$','$10^2$','$10^3$','$10^4$'],fontsize=14.5)
ax.legend(fontsize=14.5,ncol=1)
fig=plt.gcf();
fig.tight_layout()
fig.set_size_inches(8.53,2.6622)
plt.savefig("./Figure7.pdf",dpi=1200,bbox_inches="tight")
