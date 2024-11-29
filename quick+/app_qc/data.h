#pragma once 

#pragma warning (disable:4996)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define INIT_TRANS_LEN  200

struct Transaction
{
	int length;
	int *t;
};

class Data
{
public:
	Transaction* mptransaction;
	int micapacity;

	
	Data(char *filename);
	~Data();

	int isOpen();
	void reOpen(char *filename);
	Transaction *getNextTransaction();
	Transaction *getNextTransaction2();
	int gsz;
private:
  
	ifstream in;
};


Data::Data(char *filename)
{
	in.open(filename);
	// if(in.fail)
	// {
	// 	printf("Error: cannot open file %s for read\n", filename);
	// 	exit(-1);
	// }
	string temp;
	in>>temp;
	gsz=stoi(temp);
	in>>temp;
	mptransaction = new Transaction;
	mptransaction->t = new int[INIT_TRANS_LEN]; // transaction container; one transaction is the adj-list of one node
	mptransaction->length = 0;
	micapacity = INIT_TRANS_LEN;

}

Data::~Data()
{
	in.close();
	// if(in)
	// 	fclose(in);
	if(mptransaction!=NULL)
	{
		delete []mptransaction->t;
		delete mptransaction;
	}
}

int Data::isOpen()
{
	if(in)
		return 1;
	else
		return 0;
}
void Data::reOpen(char *filename)
{
	in.close();
	in.open(filename);
	string temp;
	in>>temp;
	in>>temp;
}

// Transaction *Data::getNextTransaction()
// {
// 	char c;

// 	mptransaction->length = 0;

// 	// read list of items
// 	do {
// 		int item=0, pos=0;
// 		c = getc(in);
// 		while((c >= '0') && (c <= '9'))
// 		{
// 			item *=10;
// 			item += int(c)-int('0');
// 			c = getc(in);
// 			pos++;
// 		}
// 		if(pos)
// 		{
// 			if(mptransaction->length < micapacity)
// 			{
// 				mptransaction->t[mptransaction->length] = item;
// 				mptransaction->length++;
// 			}
// 			else
// 			{
// 				int *ptrans;
// 				micapacity = 2*micapacity; // like std::vector, capacity reached so double the capacity
// 				ptrans = new int[micapacity];
// 				memcpy(ptrans, mptransaction->t, sizeof(int)*mptransaction->length);
// 				delete []mptransaction->t;
// 				mptransaction->t = ptrans;
// 				mptransaction->t[mptransaction->length] = item;
// 				mptransaction->length++;
// 			}
// 		}
// 	}while(c != '\n' && !feof(in)); // one line per transaction

// 	if(feof(in) && mptransaction->length==0)
// 	{
// 		rewind(in);
// 		return 0;
// 	}
// 	else
// 		return mptransaction;

// }


Transaction *Data::getNextTransaction()
{
	//cout<<"ffff"<<endl;
	char c;

	mptransaction->length = 0;

	// read list of items
	string temp;
    //int index=0;
    vector<int> neg;
    char a;
    int temp_count=0;
    bool first=true;
    while(!in.eof()){
        if(first){
            in>>temp;
            first=false;
			if(temp=="") return 0;
        }       
        in.get(a);
        
        if(a=='\r'){
            // if(index>=gsz)
            //     break;
            //degree[index]=temp_count;
			mptransaction->length=temp_count;
            mptransaction->t=new int[temp_count];
            for(int i=0;i<temp_count;++i){
                mptransaction->t[i]=neg[i];
		//cout<<neg[i]<<endl;
            }
	        //cout<<"*****"<<endl;
			//cout<<"eeeee"<<endl;
			return mptransaction;
            //temp_count=0;
            //index++;
            //first=true;
            //continue;
        }
        in>>temp;
        neg.push_back(stoi(temp));
        temp_count++;
        
    }
    // return graph_size;

	// if(feof(in) && mptransaction->length==0)
	// {
	// 	rewind(in);
	// 	return 0;
	// }
	// else
	// 	return mptransaction;
	return 0;

}
