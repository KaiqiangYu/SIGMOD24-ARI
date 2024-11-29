#include<iostream>
#include<string>
#include<time.h>
#include<list>
#include<vector>
#include<cstring>
#include "args.hxx"
#include"Util.h"
#include"FastQC.h"
#include"Corepruning.h"

#define FILELEN 1024



int main(int argc, char** argv) {

	char filepath[1024] = ".";
	args::ArgumentParser parser("DCFastQC, an algorithm for enumerating maximal quasi-cliques\n");
    args::HelpFlag help(parser, "help", "Display this help menu",{'h', "help"});
    args::Group required(parser, "", args::Group::Validators::All);
    args::ValueFlag<std::string> benchmark_file(parser, "dataset", "Path to dataset", {'f', "file"},"");
    args::ValueFlag<int> Threshold(parser, "Lower Bound", "The lower bound of the size of MQC", {'u', "u"}, 1);
    args::ValueFlag<int> Quiete(parser, "quiete", "output to file", {'q', "q"}, 0);
	args::ValueFlag<double> Gamma(parser, "para Gamma", "The parameter Gamma", {'g', "g"}, 0.9);

    try {
        parser.ParseCLI(argc, argv);
    } catch (args::Help) {
        std::cout << parser;
        return 0;
    } catch (args::ParseError e) {
        std::cerr << e.what() << std::endl;
        std::cerr << parser;
        return 0;
    } catch (args::ValidationError e) {
        std::cerr << e.what() << std::endl;
        std::cerr << parser;
        return 0;
    }

	strncpy(filepath, args::get(benchmark_file).c_str(), FILELEN);
    int theta = args::get(Threshold);
    int quiete = args::get(Quiete);
    double gamma = args::get(Gamma);


	if (gamma<=0.5||gamma>1||theta<0) {
		fprintf(stderr, "parameter error\n");
		exit(-1);
	}


	Util util;
    int *degree=NULL;
    int **Graph=NULL;
    int graph_size=util.ReadGraph(filepath,Graph,degree);
//	for (int i=0;i<graph_size;++i){
//	cout<<i;
//	for(int j=0;j<degree[i];++j) cout<<" "<<Graph[i][j];
//	cout<<endl;
	
//	}	

    	

   CoreLocate Core(Graph,degree,graph_size,std::ceil(gamma*(theta-1)));
   Core.Coredecompose();
   Core.GetMaxcore();
    int **pG, *pd, pgs;
    pgs=Core.CorePrune(pG,pd);
   //  pG=Graph; pd=degree; pgs=graph_size;   


    set<int> *setG=new set<int>[pgs];
    for(int i=0;i<pgs;++i){
        for(int j=pd[i]-1;j>=0;--j)
            setG[i].insert(pG[i][j]);
    }
    
    	
    FastQC miner(pG,pd,pgs,gamma,theta,setG,quiete);
   
    time_t s1 = clock();
    miner.DCStrategy();
   //miner.QCMiner();
    time_t s2 = clock();
    //cout<<"# of returned QCs: "<<miner.res_num<<endl;
    //cout<<"Running Time: "<<(double)(s2-s1)/CLOCKS_PER_SEC<<endl;
	cout<<(double)(s2-s1)/CLOCKS_PER_SEC<<"\n";
	return 0;
}
