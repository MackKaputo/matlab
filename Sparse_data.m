clear all
load coppersim6.dat
q1=4825; %% ore node

A=[coppersim6(:,1:5) coppersim6(:,10)];

A1=A(1:q1,:); %% These are ore blocks, connect source to there blocks
lamda=1;
Alam=lamda*A1(:,6);
A1=[A1(:,1:2) A1(:,6)]; %%only source to ore blocks connection and their capacity kept in this file
A1=[A1(:,1:2) Alam];
A2=A(q1+1:end,:); %% These are waste blocks, connect these blocks to sink
A2=[A2(:,2) A2(:,1) A2(:,6)]; %%only waste blocks to sink connection and their capacity kept in this file...$$$ column one and two change there position.

A3=[A1;A2];

p=A(:,2:5);

j=20; %% j value will be change according to your block size in x direction
k=20; %% same for y direction
l=10; %% same for z direction
X1=[];
for i=1:1:length(p)
    X=[p(i,2)-j p(i,3) p(i,4)+l p(i,2) p(i,3) p(i,4)+l p(i,2)+j p(i,3) p(i,4)+l p(i,2) p(i,3)-k p(i,4)+l p(i,2) p(i,3)+k p(i,4)+l p(i,1)]; %%last colum is node mumber as on matrix p
X1=[X1;X];
end


inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,1)& p(:,3)==X1(jj,2)& p(:,4)==X1(jj,3));
%%indi1=find(p(jj,2)==X1(:,1)& p(jj,3)==X1(:,2)& p(jj,4)==X1(:,3));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B1=p(inficap,:);

clear indi inficap
inficap=[];

%%B2=X1(inficap1,:);
for jj=1:length(B1)
indi=find(X1(:,1)==B1(jj,2)& X1(:,2)==B1(jj,3)& X1(:,3)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);

D1=[B2(:,16) B1(:,1)];


clear inficap inficap1 jj B1 B2
inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,4)& p(:,3)==X1(jj,5)& p(:,4)==X1(jj,6));
%%indi1=find(p(jj,2)==X1(:,1)& p(jj,3)==X1(:,2)& p(jj,4)==X1(:,3));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B1=p(inficap,:);

clear indi inficap
inficap=[];

%%B2=X1(inficap1,:);
for jj=1:length(B1)
indi=find(X1(:,4)==B1(jj,2)& X1(:,5)==B1(jj,3)& X1(:,6)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);

D2=[B2(:,16) B1(:,1)];


clear inficap inficap1 jj B1 B2
inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,7)& p(:,3)==X1(jj,8)& p(:,4)==X1(jj,9));
%%indi1=find(p(jj,2)==X1(:,7)& p(jj,3)==X1(:,8)& p(jj,4)==X1(:,9));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B1=p(inficap,:);
%%B2=X1(inficap1,:);

clear indi inficap
inficap=[];

%%B2=X1(inficap1,:);
for jj=1:length(B1)
indi=find(X1(:,7)==B1(jj,2)& X1(:,8)==B1(jj,3)& X1(:,9)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);

D3=[B2(:,16) B1(:,1)];


clear inficap inficap1 jj B1 B2
inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,10)& p(:,3)==X1(jj,11)& p(:,4)==X1(jj,12));
%%indi1=find(p(jj,2)==X1(:,10)& p(jj,3)==X1(:,11)& p(jj,4)==X1(:,12));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B1=p(inficap,:);



clear indi inficap
inficap=[];

%%B2=X1(inficap1,:);
for jj=1:length(B1)
indi=find(X1(:,10)==B1(jj,2)& X1(:,11)==B1(jj,3)& X1(:,12)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);



D4=[B2(:,16) B1(:,1)];


clear inficap inficap1 jj B1 B2
inficap=[];
inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,13)& p(:,3)==X1(jj,14)& p(:,4)==X1(jj,15));
%%indi1=find(p(jj,2)==X1(:,13)& p(jj,3)==X1(:,14)& p(jj,4)==X1(:,15));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B1=p(inficap,:);
%%B2=X1(inficap1,:);


clear indi inficap
inficap=[];

%%B2=X1(inficap1,:);
for jj=1:length(B1)
indi=find(X1(:,13)==B1(jj,2)& X1(:,14)==B1(jj,3)& X1(:,15)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);


D5=[B2(:,16) B1(:,1)];

clear D
D=[D1;D2;D3;D4;D4];
s=99999999*ones(length(D),1);
%%s=0.4*ones(length(D),1);
D=[D s];

A4=[A3;D];
A4=[A4; 9955 9954 0];
A5=round(A4(:,3));
A6=[A4(:,1:2) A5];

S = spconvert(A6);
[flow cut R F] = push_relabel_max_flow(S,1,9955);

G=(copper(:,2:5));
G=sortrows(G);

Flowresults_lamda1={flow,cut,R,F};

t=cut(2:9954,1);
G=[G t];
save data.dat G -ASCII;