function [G1 G3]=stochas_sched(P1,D,X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,conesize,lamda,dellam,infi,prtrg,prcstrg,cutgrd,std,flag)

%% Stochastic production scheduling with hueristics
if(isempty(P1)==1)
[P1]=bevcal(X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,std);
end

if(isempty(D)==1)
D=mincutslop(P1,nx,ny,nz,conesize);
end
%prcstrg=15000000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S1=0;
S2=0;
%lamda=0.01;
while ((S1<prtrg || S2<prcstrg) && lamda<=1)
[G G1 Flowresult]=ultipit(P1,D,X, lamda,1,infi);

if(~isempty(G1))
[m n]=size(G1);
G3=[];
G2=[];
for l=1:num
for i=1:length(G1(:,1))
    %G1(i,n+1)=sum(G1(i,7:num+6))/num;
        if G1(i,6+l)>cutgrd
        %G2(i)=G1(i,7)*(nx*ny*nz)*(spgr*rec);
        G2(i)=(nx*ny*nz)*spgr;
        else G2(i)=0;
        end
end
G1=[G1 G2'];
clear G2;
end
for l=1:num
for i=1:length(G1(:,1))
    %G1(i,n+1)=sum(G1(i,7:num+6))/num;
        if G1(i,6+l)<=cutgrd
        %G2(i)=G1(i,7)*(nx*ny*nz)*(spgr*rec);
        G3(i)=(nx*ny*nz)*spgr;
        else G3(i)=0;
        end
end
G1=[G1 G3'];
clear G3;
end

%S1=mean(sum(G1(:,6+num+1:6+(2*num))));
%S2=mean(sum(G1(:,6+(2*num)+1:end)));
S1=min(sum(G1(:,6+num+1:6+(2*num))));
S2=min(sum(G1(:,6+(2*num)+1:end)));
end
lamda=lamda+dellam;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if flag==1

k3=0;
if(~isempty(G1))
fnt1=front(G1,nx,ny,nz);
k21=mean(sum(fnt1(:,6+num+1:6+(2*num))));
k22=mean(sum(fnt1(:,6+(2*num)+1:end)));
k31=S1-k21;
k32=S2-k22;
end

%if (k31<=prtrg || k32<=prcstrg)
 %   k31=S1;
  %  k32=S2;
%end

while(k31>prtrg && k32>prcstrg)
    ind2=[];
    for l=1:length(fnt1(:,1))
        ind=find((fnt1(l,1)==G1(:,1))& (fnt1(l,2)==G1(:,2)) & (fnt1(l,3)==G1(:,3)));
        ind2=[ind2;ind];
    end


    G1(ind2,:)=[];
    S1=mean(sum(G1(:,6+num+1:6+(2*num))));
    S2=mean(sum(G1(:,6+(2*num)+1:end)));
    fnt1=front(G1,nx,ny,nz);
    k21=mean(sum(fnt1(:,6+num+1:6+(2*num))));
    k22=mean(sum(fnt1(:,6+(2*num)+1:end)));
    k31=S1-k21;
    k32=S2-k22;
end
else
    fnt1=front(G1,nx,ny,nz);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %z1=0.001;
    S11=S1;
    S12=S2;
    %S21=max(sum(G1(:,6+num+1:6+(2*num))));
    %S22=max(sum(G1(:,6+(2*num)+1:end)));
    G3=G1;
while (S11>prtrg) %&& S12>prcstrg)
    T1=sum(G3(:,6+num+1:6+(2*num)));
    T2=sum(G3(:,6+(2*num)+1:end));
    U1=T1-prtrg;
    U2=T2-prcstrg;
    U3=[4*U1 U2]';
    U4=U3./sum(U3);
    U5=fnt1(:,6+num+1:end)*U4;
    %w1=k31/prtrg;
    %w2=k32/prcstrg;
   % if S11<=prtrg
   %     alph1=0;
    %    alph2=1;
    %else
    %if S12<=prcstrg
    %        alph1=1;
    %        alph2=0;
    %else
    
    %w1=S11-prtrg;
    %w2=S12-prcstrg;
    %w2=(prtrg/prcstrg)*w2;
    %alph1=(w1/(w1+w2));
    %alph2=(w2/(w1+w2));
    %end
    %end
    %s2=[];
    %for n=1:length(fnt1(:,1))
        %s21=fnt1(n,6+num+1:6+(2*num))*alph1+fnt1(n,6+(2*num)+1:end)*alph2;
    %    s21=sum(sum(fnt1(n,6+num+1:6+(2*num)))*alph1+(sum(fnt1(n,6+(2*num)+1:end)))*alph2);
    %    s2=[s2;s21]; 
    %end
    
    %fnt1=[fnt1 s2];
    fnt1=[fnt1 U5];
    fnt1=[fnt1 (fnt1(:,4)-fnt1(:,5))];
    fnt1=sortrows(fnt1,[-((3*num)+7) ((3*num)+8)]);
    %ind4=[];
    %for n=1:10
    ind3=find((fnt1(1,1)==G3(:,1))& (fnt1(1,2)==G3(:,2))& (fnt1(1,3)==G3(:,3)));
    %ind4=[ind4;ind3];
    %end
    G3(ind3,:)=[];
    %fnt1=fnt1(2:end,1:8);
    fnt1=front(G3,nx,ny,nz);
    S11=mean(sum(G3(:,6+num+1:6+(2*num))));
    S12=mean(sum(G3(:,6+(2*num)+1:end)));
    
    %S11=min(sum(G3(:,6+num+1:6+(2*num))));
    %S12=min(sum(G3(:,6+(2*num)+1:end)));
    %S21=max(sum(G3(:,6+num+1:6+(2*num))));
    %S22=max(sum(G3(:,6+(2*num)+1:end)));
    %k21=mean(sum(fnt1(:,6+num+1:6+(2*num))));
    %k22=mean(sum(fnt1(:,6+(2*num)+1:end)));
    %k31=S11-k21;
    %k32=S12-k22;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ind4=[];
%if(~isempty(G1))
%for u=1:length(G3(:,1))
%    ind=find((G3(u,1)==X(:,1)) & (G3(u,2)==X(:,2)) & (G3(u,3)==X(:,3)));
%    ind4=[ind4;ind];
%end
%end
%X(ind4,:)=[];
%P1(ind4,:)=[];
