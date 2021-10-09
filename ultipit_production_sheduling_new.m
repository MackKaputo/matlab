function [ G1 G Flowresult lamda0] = ultipit_production_sheduling_new(P1,D,lamda2,infi,production,lamda0,del_lamda)
lamda1= lamda0;
 [G1 G Flowresult]=ultipit_price_new(P1,D,lamda1,lamda2,infi);
 
 k= length(G1);
 pr = k*50*50*10*2.86;
 
 while(pr < production )
 
       
    lamda0 = lamda0 + del_lamda ;
    lamda1=lamda0;
    [G1 G Flowresult]=ultipit_price_new(P1,D,lamda1,lamda2,infi);
    k= length(G1);  
    pr = k*50*50*10*2.86;
 end
        

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%end

