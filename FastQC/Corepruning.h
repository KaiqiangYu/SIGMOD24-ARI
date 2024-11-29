#include<iostream>
#include<list>
#include<algorithm>

using std::cout;
using std::endl;
using std::sort;


class CoreLocate{

    public:
        CoreLocate(int **Graph, int *degree, int graph_size, int K);
        ~CoreLocate();
        int CorePrune(int **&new_graph, int *&degree);
        void Coredecompose();
        int GetMaxcore();
        void CoreOrdering(int **&new_graph, int *&new_degree);
        void Bipartite_CoreOrdering(int **&new_graph, int *&new_degree);
        void Bipartite_R_CoreOrdering(int **&new_graph, int *&new_degree);
        int *G_order;
        int *G_index;
        int *G_label;

    private:
        int **Graph;
        int *degree;
        int *G_temp;
        
        
        int K;
        int graph_size;
        int max_degree;

};

CoreLocate::~CoreLocate(){
    delete [] G_temp;
    delete [] G_label;
    delete [] G_order;
    delete [] G_index;
}

CoreLocate::CoreLocate(int **Graph, int *degree, int graph_size, int K){
    this->Graph=Graph;
    this->degree=degree;
    this->graph_size=graph_size;
    this->K=K;

    int max=0;
    G_temp=new int[graph_size];
    G_label=new int[graph_size];
    G_order=new int[graph_size];
    G_index=new int[graph_size];
    for(int i=0;i<graph_size;++i){
        G_index[i]=-1;
        G_label[i]=0;
        G_temp[i]=degree[i];
        if(degree[i]>max){
            max=degree[i];
        }
    }
    this->max_degree=max;
}

void CoreLocate::Coredecompose(){

    int *bin=new int[max_degree+1];
    for(int i=0;i<=max_degree;++i){
        bin[i]=0;
    }
    for(int i=0;i<graph_size;++i){
        bin[degree[i]]+=1;
    }
    

    int start=0;
    for(int d=0;d<=max_degree;++d){
        int num=bin[d];
        bin[d]=start;
        start+=num;
    }

    int *pos=new int[graph_size+1];
    int *vert=new int[graph_size+1];
    for(int i=0;i<graph_size+1;++i){
        pos[i]=0;
        vert[i]=0;
    }
    for(int i=0;i<graph_size;++i){
        pos[i]=bin[degree[i]];
        vert[pos[i]]=i;
        bin[degree[i]]+=1;
    }

    for(int i=max_degree;i>=1;--i){
        bin[i]=bin[i-1];
    }
    bin[0]=1;
    

    for(int i=0;i<graph_size;++i){
        int node=vert[i];
        G_order[node]=i;
        G_label[node]=G_temp[node];
        for(int j=0;j<degree[node];++j){
            int neg=Graph[node][j];
            if(G_temp[neg]>G_temp[node]){
                int du=G_temp[neg]; int pu=pos[neg];
                int pw=bin[du]; int w=vert[pw];
                if(neg!=w){
                    pos[neg]=pw; vert[pu]=w;
                    pos[w]=pu; vert[pw]=neg;
                }
                bin[du]+=1;
                G_temp[neg]-=1;
            }
        }
    }

    delete [] pos;
    delete [] vert;
}

int CoreLocate::GetMaxcore(){
    int max=0;
    for(int i=0;i<graph_size;++i){
        if(G_label[i]>max){
            max=G_label[i];
        }
    }

    int temp_count=0;
    for(int i=0;i<graph_size;++i){
        if(G_label[i]>=max){
            temp_count++;
        }
    }
    //cout<<"------------ Statistics -------------"<<endl;
    //cout<<"MaxCore Num: "<<max<<endl;
    //cout<<"# of vertices in MaxCore: "<<temp_count<<endl;
    //cout<<"# of vertices in Graph: "<<graph_size<<endl;
    //cout<<"Per. of vertices in MaxCore: "<<(1.0*temp_count/graph_size)<<endl;
    //cout<<"-------------------------------------"<<endl;

    return max;
}



int CoreLocate::CorePrune(int **&new_graph, int *&new_degree){

    int min_order=graph_size;
    for(int i=0;i<graph_size;++i){
        if(G_label[i]>=K){
            min_order=min_order>G_order[i]?G_order[i]:min_order;
        }
    }

    int count=0;
    for(int i=0;i<graph_size;++i){
        if(G_label[i]>=K){
            G_index[i]=G_order[i]-min_order;
            count++;
        }else{
            G_index[i]=-1;
        }
    }

    new_degree=new int[count];
    new_graph=new int*[count];
    for(int i=0;i<graph_size;++i){
        if(G_index[i]>=0){
            int temp_count=0;
            for(int j=0;j<degree[i];++j){
                if(G_index[Graph[i][j]]>=0){
                    temp_count++;
                }
            }
            int *neg=new int[temp_count];
            new_degree[G_index[i]]=temp_count;
            temp_count=0;
            
            for(int j=0;j<degree[i];++j){
                if(G_index[Graph[i][j]]>=0){
                    neg[temp_count]=G_index[Graph[i][j]];
                    temp_count++;
                }
            }
            sort(neg,neg+new_degree[G_index[i]]);
            new_graph[G_index[i]]=neg;
        }
    }
    return count;
}

void CoreLocate::CoreOrdering(int **&new_graph, int *&new_degree){
    new_degree=new int[graph_size];
    new_graph=new int*[graph_size];
    for(int i=0;i<graph_size;++i){    
        int *neg=new int[degree[i]];
        new_degree[G_order[i]]=degree[i];
        for(int j=0;j<degree[i];++j){   
            neg[j]=G_order[Graph[i][j]];  
        }
        sort(neg,neg+degree[i]);
        new_graph[G_order[i]]=neg;
    }
}




