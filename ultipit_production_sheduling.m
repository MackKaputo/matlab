function [ G1_best G_best Flowresult K2_best K3_best lamda0] = ultipit_production_sheduling(P1,D,lamda2,infi,production,lamda0,del_lamda,blocks,yr)
lamda1= lamda0;
 [G1 G Flowresult]=ultipit_price_new(P1,D,lamda1,lamda2,infi);
 %K2= G((yr-1)*blocks+1:yr*blocks,:);
 K2= G(1:blocks,:);
 K3=find(K2(:,6)~=-1);
 k=length(K3);
 %k= length(G1);
 pr = k*50*50*10*2.86;
       G1_best=G1;
        G_best=G;
        K2_best=K2;
        K3_best=K3;
 
 while(pr < production && lamda1 <= 1)
 
    [G1 G Flowresult]=ultipit_price_new(P1,D,lamda1,lamda2,infi);
    %K2= G((yr-1)*blocks+1:yr*blocks,:);
     K2= G(1:blocks,:);
    K3=find(K2(:,6)~=-1);
    k=length(K3);
    pr = k*50*50*10*2.86;
    if (pr < production)
        G1_best=G1;
        G_best=G;
        K2_best=K2;
        K3_best=K3;
       
    end
    lamda0 = lamda0 + del_lamda ;
    lamda1=lamda0;
 end
        

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%end

