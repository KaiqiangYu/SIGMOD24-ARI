import sys
import getopt
import numpy as np
import matplotlib.pyplot as plt

res1=[]
with open("Exp3c_res1.txt","r") as f:
	str1=f.readline()
	while str1 is not None and str1 != '':
		res1.append(float(str1))
		str1=f.readline()

f.close()

res2=[]
with open("Exp3c_res2.txt","r") as f:
	str1=f.readline()
	while str1 is not None and str1 != '':
		res2.append(float(str1))
		str1=f.readline()
f.close()

	

plt.rcParams['font.sans-serif'] = 'Times New Roman'


lineT=['k-o','k-^']

labels1 = ['25', '24', '23', '22','21']
legend = ['DCFastQC','Quick+']
y1=[res1,res2]
plt.ylim((0.1,1000))

labels=[]
y=[res1,res2]
for i in range(len(labels1)-1,-1,-1):
	labels.append(labels1[i])

x = np.arange(len(labels))
group=len(y)
for i in range(0,group):
	plt.plot(x,y[i],lineT[i],markerfacecolor='none',markersize='10',label=legend[i])

plt.yscale('log')
plt.ylabel('Running time (sec)',fontsize=12.5)
plt.xlabel('Value of $\\theta$',fontsize=12.5)

plt.xticks(x,labels,fontsize=12.5)
plt.yticks([0.1,1,10,100,1000],['$10^{-1}$','$10^0$','$10^1$','$10^2$','$10^3$'],fontsize=12.5)
plt.grid(axis='y',linestyle=':', linewidth=0.2)
plt.minorticks_off()
plt.legend(fontsize=12.5,frameon=False,ncol=2,loc=9)
fig=plt.gcf();
fig.tight_layout()
fig.set_size_inches(3.93,2.4622)
plt.savefig("./Figure9c.pdf",dpi=400,bbox_inches="tight")