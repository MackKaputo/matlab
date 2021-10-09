function D=mincutslop(p,dx,dy,dz,conesize)
%p=A(:,1:4);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
j=dx; %% j value will be change according to your block size in x direction
k=dy; %% same for y direction
u=dx/dz;
if u==2
l=u*dz; %% same for z direction
else
    l=dz;
end

if conesize==9

X1=[];
for i=1:1:length(p)
    X=[p(i,2)-j p(i,3)-k p(i,4)+l p(i,2) p(i,3)-k p(i,4)+l  p(i,2)+j p(i,3)-k p(i,4)+l p(i,2)-j p(i,3) p(i,4)+l p(i,2) p(i,3) p(i,4)+dz p(i,2)+j p(i,3) p(i,4)+l p(i,2)-j p(i,3)+k p(i,4)+l p(i,2) p(i,3)+k p(i,4)+l p(i,2)+j p(i,3)+k p(i,4)+l p(i,1)]; %%last colum is node mumber as on matrix p
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


%D=[D1;D2;D3;D4;D5];
D=[D1;D2;D3;D4;D5;D6;D7;D8;D9];
else if conesize==5
        
        X1=[];
for i=1:1:length(p)
    X=[p(i,2)-j p(i,3) p(i,4)+l p(i,2) p(i,3) p(i,4)+dz p(i,2)+j p(i,3) p(i,4)+l p(i,2) p(i,3)-k p(i,4)+l p(i,2) p(i,3)+k p(i,4)+l p(i,1)]; %%last colum is node mumber as on matrix p
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

D=[D1;D2;D3;D4;D5];

    end
end

if u==2
        X1=[];
    for i=1:1:length(p)
    X=[p(i,2) p(i,3) p(i,4)+(l/u) p(i,1)]; %%last colum is node mumber as on matrix p
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

    D10=[B2(:,4) B1(:,1)];
    D=[D;D10];
end


        
