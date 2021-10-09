function [ G1 G Flowresult ] = ultipit_production_sheduling_new_hars(P1,D,lamda2,infi,production,processing,lamda0,del_lamda)
lamda1= lamda0;
 [G1 G Flowresult]=ultipit_price_new(P1,D,lamda1,lamda2,infi);
 
 k= length(G1);
 k2=find(G1(:,4)~=0);
 k3=length(k2);
 po=k3*50*50*10*2.86;
 pr = k*50*50*10*2.86;
 
 while(pr < production && po < processing)
 
       
    %lamda0 = lamda0 + del_lamda ;
    [G1 G Flowresult]=ultipit_price_new(P1,D,lamda1,lamda2,infi);
    k= length(G1);  
    pr = k*50*50*10*2.86;
    k2=find(G1(:,4)~=0);
    k3=length(k2);
    po=k3*50*50*10*2.86;
    lamda1=lamda1+del_lamda;
 end
        

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%end

