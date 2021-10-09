%clear all
%load coppersim6.dat
A=Sheet1;

A=[A(:,1:4) A(:,17:18)];


p=A(:,1:4);

j=20; %% j value will be change according to your block size in x direction
k=20; %% same for y direction
l=10; %% same for z direction
X1=[];
for i=1:1:length(p)
    X=[p(i,2)-j p(i,3) p(i,4)+l p(i,2) p(i,3) p(i,4)+l p(i,2)+j p(i,3) p(i,4)+l p(i,2) p(i,3)-k p(i,4)+l p(i,2) p(i,3)+k p(i,4)+l p(i,1)]; %%last colum is node mumber as on matrix p
X1=[X1;X];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
j=20; %% j value will be change according to your block size in x direction
k=20; %% same for y direction
l=10; %% same for z direction
X1=[];
for i=1:1:length(p)
    X=[p(i,2)-j p(i,3)-k p(i,4)+l p(i,2) p(i,3)-k p(i,4)+l  p(i,2)+j p(i,3)-k p(i,4)+l p(i,2)-j p(i,3) p(i,4)+l p(i,2) p(i,3) p(i,4)+l p(i,2)+j p(i,3) p(i,4)+l p(i,2)-j p(i,3)+k p(i,4)+l p(i,2) p(i,3)+k p(i,4)+l p(i,2)+j p(i,3)+k p(i,4)+l p(i,1)]; %%last colum is node mumber as on matrix p
X1=[X1;X];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

D1=[B2(:,28) B1(:,1)];


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

D2=[B2(:,28) B1(:,1)];


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

D3=[B2(:,28) B1(:,1)];


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



D4=[B2(:,28) B1(:,1)];


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


D5=[B2(:,28) B1(:,1)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear inficap inficap1 jj B1 B2
inficap=[];
inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,16)& p(:,3)==X1(jj,17)& p(:,4)==X1(jj,18));
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
indi=find(X1(:,16)==B1(jj,2)& X1(:,17)==B1(jj,3)& X1(:,18)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);


D6=[B2(:,28) B1(:,1)];

clear inficap inficap1 jj B1 B2
inficap=[];
inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,19)& p(:,3)==X1(jj,20)& p(:,4)==X1(jj,21));
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
indi=find(X1(:,19)==B1(jj,2)& X1(:,20)==B1(jj,3)& X1(:,21)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);


D7=[B2(:,28) B1(:,1)];

clear inficap inficap1 jj B1 B2
inficap=[];
inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,22)& p(:,3)==X1(jj,23)& p(:,4)==X1(jj,24));
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
indi=find(X1(:,22)==B1(jj,2)& X1(:,23)==B1(jj,3)& X1(:,24)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);


D8=[B2(:,28) B1(:,1)];


clear inficap inficap1 jj B1 B2
inficap=[];
inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,25)& p(:,3)==X1(jj,26)& p(:,4)==X1(jj,27));
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
indi=find(X1(:,25)==B1(jj,2)& X1(:,26)==B1(jj,3)& X1(:,27)==B1(jj,4));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);


D9=[B2(:,28) B1(:,1)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear D
%D=[D1;D2;D3;D4;D5];
D=[D1;D2;D3;D4;D5;D6;D7;D8;D9];
s=999999999*ones(length(D),1);
%%s=0.4*ones(length(D),1);
D=[D s];

E=BEV_6sim;

clear cutfor_lam total_flow total_SIM_NPV;
cutfor_lam=[];
total_flow=[];
total_SIM_NPV=[];
for j=.026:1.0000e-005:.027
lamda=j;
Alam=lamda*A(:,5);

A1=[ones(length(A),1) A(:,1) Alam];  %% These are ore blocks, connect source to there blocks


A2=[A(:,1) 9955*ones(length(A),1) A(:,6)]; %% These are waste blocks, connect these blocks to sink


A3=[A1;A2];

A4=[A3;D];
A4=[A4; 9955 9954 0];
A5=round(A4(:,3));
A6=[A4(:,1:2) A5];

S = spconvert(A6);
[flow cut R F] = push_relabel_max_flow(S,1,9955);

clear cutno;
cutno=0;

for i=1:9955
    if cut(i)>0
        cutno=cutno+1;
    end
end
cutfor_lam=[cutfor_lam; cutno];
total_flow=[total_flow; flow]; 

clear temp_cut;
for i=1:9955
    if cut(i)==1
        temp_cut (i) =1;
    else temp_cut (i) =0;
    end
end
temp_cut=temp_cut(2:end-1)';



SIM_NPV=[];
for jj=1:6
    clear prod;
prod=[];
for k=1:9953
    if E(k,jj+1)==9600
        prod (k)= -temp_cut(k,1)*E(k,jj+1);
    else prod (k)= temp_cut(k,1)* E(k,jj+1);
    end
end
NPV=sum(prod);
SIM_NPV=[SIM_NPV; NPV];
clear NPV prod;
end
total_SIM_NPV=[total_SIM_NPV SIM_NPV];
clear SIM_NPV A1 A2 A3 A4 A5 A6 S;
end

figure (1);stairs(cutfor_lam, 'DisplayName', 'cutfor_lam', 'YDataSource', 'cutfor_lam'); figure(gcf);
figure (2); stairs(total_flow, 'DisplayName', 'total_flow', 'YDataSource', 'total_flow'); figure(gcf);
figure (3);
for i=1:6
subplot (2,3,i); stairs(total_SIM_NPV(i,1:101), 'DisplayName', 'total_SIM_NPV(1,1:11)', 'YDataSource', 'total_SIM_NPV(1,1:11)'); figure(gcf)
end

G=(copper(:,2:5));
G=sortrows(G);

Flowresults_lamda1={flow,cut,R,F};

t=cut(2:9954,1);
G=[G t];
save data.dat G -ASCII;