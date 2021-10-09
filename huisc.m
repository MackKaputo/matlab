function [X G1 G3]=huisc(X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,conesize,lamda,dellam,infi,prtrg,std)

[P1]=bevcal(X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,std);
D=mincutslop(P1,nx,ny,nz,conesize);
S=0;

while (S<prtrg && lamda<=1)
[G G1 Flowresult]=ultipit(P1,D,X, lamda,infi);

if(~isempty(G1))
G2=[];
for i=1:length(G1(:,1))
    if G1(i,4)~=0
        %G2(i)=G1(i,7)*(nx*ny*nz)*(spgr*rec);
        G2(i)=(nx*ny*nz)*spgr;
    else G2(i)=0;
    end
end
G1=[G1 G2'];

S=sum(G1(:,8));
end
lamda=lamda+dellam;
end

k3=0;
if(~isempty(G1))
fnt1=front(G1,nx,ny,nz);
k2=sum(fnt1(:,8));
k3=S-k2;
end

while(k3>prtrg)
    ind2=[];
    for l=1:length(fnt1(:,1))
        ind=find((fnt1(l,1)==G1(:,1))& (fnt1(l,2)==G1(:,2)) & (fnt1(l,3)==G1(:,3)));
        ind2=[ind2;ind];
    end


    G1(ind2,:)=[];
    S=sum(G1(:,8));
    fnt1=front(G1,nx,ny,nz);
    k2=sum(fnt1(:,8));
    k3=S-k2;
end



    S1=S;
    G3=G1;
while (S1>prtrg)
       s2=[];s3=[];
    for n=1:length(fnt1(:,1))
        s21=fnt1(n,4)/S1;
        s31=fnt1(n,5)/S1;
        s2=[s2;s21];
        s3=[s3;s31];
    end
    s4=(s2-s3);
    fnt1=[fnt1 s4];
    
    fnt1=sortrows(fnt1,9);
    %ind4=[];
    %for n=1:10
    ind3=find((fnt1(1,1)==G3(:,1))& (fnt1(1,2)==G3(:,2))& (fnt1(1,3)==G3(:,3)));
    %ind4=[ind4;ind3];
    %end
    G3(ind3,:)=[];
    fnt1=fnt1(2:end,1:8);
    S1=sum(G3(:,8));
end

ind4=[];
if(~isempty(G1))
for u=1:length(G3(:,1))
    ind=find((G3(u,1)==X(:,1)) & (G3(u,2)==X(:,2)) & (G3(u,3)==X(:,3)));
    ind4=[ind4;ind];
end
end
X(ind4,:)=[];