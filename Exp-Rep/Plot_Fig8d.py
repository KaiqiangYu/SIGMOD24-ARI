import sys
import getopt
import numpy as np
import matplotlib.pyplot as plt

res1=[86400,86400,86400,86400,86400]
with open("Exp2d_res1.txt","r") as f:
	str1=f.readline()
	i=0
	while str1 is not None and str1 != '':
		res1[i]=float(str1)
		i=i+1
		str1=f.readline()

f.close()

res2=[86400,86400,86400,86400,86400]
with open("Exp2d_res2.txt","r") as f:
	str1=f.readline()
	i=0
	while str1 is not None and str1 != '':
		res2[i]=float(str1)
		i=i+1
		str1=f.readline()
f.close()

	

plt.rcParams['font.sans-serif'] = 'Times New Roman'


marks = ["","","///",""]
colors = ["gray","w","w","w","w"]
width = 0.25  # the width of the bars

labels1 = ['$\gamma$=0.94', '$\gamma$=0.92', '$\gamma$=0.90', '$\gamma$=0.88', '$\gamma$=0.86']
legend = ['DCFastQC','Quick+']
y1=[[192.236,229.543,257.261,272.366,341.439],
[14354.54,14845.65,15037.72,18454.34,21546.65]]
plt.ylim((1,1000000))

labels=[]
y=[res1,res2]
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
ax.set_yticks([100,1000,10000,86400])
ax.set_yticklabels(['$10^2$','$10^3$','$10^4$','INF'],fontsize=12.5)
ax.legend(fontsize=12.5,bbox_to_anchor=(1, 1),ncol=1)
fig=plt.gcf();
fig.tight_layout()
fig.set_size_inches(4.33,2.3622)
plt.savefig("./Figure8d.pdf",dpi=400,bbox_inches="tight")