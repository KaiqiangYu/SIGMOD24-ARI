import sys
import getopt
import numpy as np
import matplotlib.pyplot as plt

res1=[]
with open("Exp2b_res1.txt","r") as f:
	str1=f.readline()
	while str1 is not None and str1 != '':
		res1.append(float(str1))
		str1=f.readline()

f.close()

res2=[]
with open("Exp2b_res2.txt","r") as f:
	str1=f.readline()
	while str1 is not None and str1 != '':
		res2.append(float(str1))
		str1=f.readline()
f.close()

	

plt.rcParams['font.sans-serif'] = 'Times New Roman'


marks = ["","","///",""]
colors = ["gray","w","w","w","w"]
width = 0.25  # the width of the bars

labels1 = ['$\gamma$=0.94', '$\gamma$=0.92', '$\gamma$=0.80', '$\gamma$=0.88', '$\gamma$=0.86']
legend = ['DCFastQC','Quick+']
y1=[res1,res2]
plt.ylim((0.1,100))

labels=[]
y=[[],[]]
for i in range(len(labels1)-1,-1,-1):
	labels.append(labels1[i])
	y[0].append(y1[0][i])
	y[1].append(y1[1][i])

x = np.arange(len(labels))  # the label locations
fig1, ax = plt.subplots()
group=len(y);
for i in range(0,group):
    rects = ax.bar(x - (group-2*i-1)*width/2, y[i], width, label=legend[i],color=colors[i],edgecolor="k")
    #rects2 = ax.bar(x + width/2, y[1], width, label='Women',color="w",edgecolor="k")
    for bar in rects:
        bar.set_hatch(marks[i])


ax.set_ylabel('Running time (sec)',fontsize=12.5)
#ax.set_xlabel('Varying $k$ (DBLP)',fontsize=12.5)
ax.set_yscale('log')
ax.set_xticks(x)
ax.set_xticklabels(labels,fontsize=12.5)
ax.set_yticks([0.1,1,10,100])
ax.set_yticklabels(['$10^{-1}$','$10^0$','$10^1$','$10^2$'],fontsize=12.5)
ax.legend(fontsize=12.5,bbox_to_anchor=(1, 1),ncol=2)
fig=plt.gcf();
fig.tight_layout()
fig.set_size_inches(4.33,2.3622)
plt.savefig("./Figure8b.pdf",dpi=400,bbox_inches="tight")