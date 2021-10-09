function [ G1_best G_best Flowresult K2_best K3_best S1_best S2_best lamda1] = ultipit_production_sheduling_pros(P1,D,lamda2,infi,production,processing,lamda0,del_lamda,blocks,yr)
lamda1= lamda0;
 [G1 G Flowresult]=ultipit_price_new(P1,D,lamda1,lamda2,infi);
 K2= G((yr-1)*blocks+1:yr*blocks,:);
 K3=find(K2(:,6)~=-1);
 k=length(K3);
 s1=find(G1(:,4)~=0);
 s2=length(s1);
 po=s2*50*50*10*2;
 %k= length(G1);
 pr = k*50*50*10*2.86;
       G1_best=G1;
        G_best=G;
        K2_best=K2;
        K3_best=K3;
        S1_best=s1;
        S2_best=s2;
        
 
 while(pr < production && po < processing && lamda1 <= 1)
 
    [G1 G Flowresult]=ultipit_price_new(P1,D,lamda1,lamda2,infi);
    K2= G((yr-1)*blocks+1:yr*blocks,:);
    K3=find(K2(:,6)~=-1);
    k=length(K3);
    pr = k*50*50*10*2.86;
    s1=find(G1(:,4)~=0);
    s2=length(s1);
    po=s2*50*50*10*2.86;
    if (pr < production && po < processing && lamda1 <= 1 )
        G1_best=G1;
        G_best=G;
        K2_best=K2;
        K3_best=K3;
        S1_best=s1;
        S2_best=s2;
    end
    lamda0 = lamda0 + del_lamda ;
    lamda1=lamda0;
 end
        