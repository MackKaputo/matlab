function [X G1 G3]=hueiprodsc(X,P1,D,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,conesize,lamda,dellam,infi,prtrg,prcstrg,std)

if (isempty(P1)==1)
[P1]=bevcal(X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,stdi);
end

if (isempty(D)==1)
D=mincutslop(P1,nx,ny,nz,conesize);
end
%prcstrg=15000000;
S1=0;
S2=0;

while ((S1<prtrg || S2<prcstrg) && lamda<=1)
[G G1 Flowresult]=ultipit(P1,D,X, lamda,1,infi);

if(~isempty(G1))
G2=[];
G3=[];
for i=1:length(G1(:,1))
    if G1(i,4)~=0
        %G2(i)=G1(i,7)*(nx*ny*nz)*(spgr*rec);
        G2(i)=(nx*ny*nz)*spgr;
    else G2(i)=0;
    end
        if G1(i,5)~=0
        %G2(i)=G1(i,7)*(nx*ny*nz)*(spgr*rec);
        G3(i)=(nx*ny*nz)*spgr;
    else G3(i)=0;
    end
end
G1=[G1 G2' G3'];

S1=sum(G1(:,8));
S2=sum(G1(:,9));
end
lamda=lamda+dellam;
end

k3=0;
if(~isempty(G1))
fnt1=front(G1,nx,ny,nz);
k21=sum(fnt1(:,8));
k22=sum(fnt1(:,9));
k31=S1-k21;
k32=S2-k22;
end

while(k31>prtrg && k32>prcstrg)
    ind2=[];
    for l=1:length(fnt1(:,1))
        ind=find((fnt1(l,1)==G1(:,1))& (fnt1(l,2)==G1(:,2)) & (fnt1(l,3)==G1(:,3)));
        ind2=[ind2;ind];
    end


    G1(ind2,:)=[];
    S1=sum(G1(:,8));
    S2=sum(G1(:,9));
    fnt1=front(G1,nx,ny,nz);
    k21=sum(fnt1(:,8));
    k22=sum(fnt1(:,9));
    k31=S1-k21;
    k32=S2-k22;
end



    S11=S1;
    S12=S2;
    G3=G1;
while (S11>prtrg || S12>prcstrg)
    %w1=k31/prtrg;
    %w2=k32/prcstrg;
    if S11<=prtrg
        alph1=0;
        alph2=1;
    else
    if S12<=prcstrg
            alph1=1;
            alph2=0;
    else
    w1=S11-prtrg;
    w2=S12-prcstrg;
    alph1=(w1/(w1+w2));
    alph2=(w2/(w1+w2));
    end
    end
    s2=[];
    for n=1:length(fnt1(:,1))
        s21=fnt1(n,8)*alph1+fnt1(n,9)*alph2;
        s2=[s2;s21]; 
    end
    
    fnt1=[fnt1 s2];
    
    fnt1=sortrows(fnt1,[-10 4]);
    %ind4=[];
    %for n=1:10
    ind3=find((fnt1(1,1)==G3(:,1))& (fnt1(1,2)==G3(:,2))& (fnt1(1,3)==G3(:,3)));
    %ind4=[ind4;ind3];
    %end
    G3(ind3,:)=[];
    %fnt1=fnt1(2:end,1:8);
    fnt1=front(G3,nx,ny,nz);
    S11=sum(G3(:,8));
    S12=sum(G3(:,9));
    %k21=sum(fnt1(:,8));
    %k22=sum(fnt1(:,9));
    %k31=S11-k21;
    %k32=S12-k22;
end

ind4=[];
if(~isempty(G1))
for u=1:length(G3(:,1))
    ind=find((G3(u,1)==X(:,1)) & (G3(u,2)==X(:,2)) & (G3(u,3)==X(:,3)));
    ind4=[ind4;ind];
end
end
%X(ind4,:)=[];