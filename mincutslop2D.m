function D=mincutslop2D(p,dx,dz)
%p=A(:,1:4);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
j=dx; %% j value will be change according to your block size in x direction
%k=dy; %% same for y direction
l=dz; %% same for z direction


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




        
        X1=[];
for i=1:1:length(p)
    X=[p(i,2)-j p(i,3)-l p(i,2) p(i,3)-l p(i,2)+j p(i,3)-l p(i,1)]; %%last colum is node mumber as on matrix p
X1=[X1;X];
end

inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,1)& p(:,3)==X1(jj,2));
%%indi1=find(p(jj,2)==X1(:,1)& p(jj,3)==X1(:,2)& p(jj,4)==X1(:,3));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B1=p(inficap,:);

clear indi inficap
inficap=[];

%%B2=X1(inficap1,:);
for jj=1:length(B1)
indi=find(X1(:,1)==B1(jj,2)& X1(:,2)==B1(jj,3));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);

D1=[B2(:,7) B1(:,1)];


clear inficap inficap1 jj B1 B2
inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,3)& p(:,3)==X1(jj,4));
%%indi1=find(p(jj,2)==X1(:,1)& p(jj,3)==X1(:,2)& p(jj,4)==X1(:,3));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B1=p(inficap,:);

clear indi inficap
inficap=[];

%%B2=X1(inficap1,:);
for jj=1:length(B1)
indi=find(X1(:,3)==B1(jj,2)& X1(:,3)==B1(jj,3));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);

D2=[B2(:,7) B1(:,1)];


clear inficap inficap1 jj B1 B2
inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,2)==X1(jj,5)& p(:,3)==X1(jj,6));
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
indi=find(X1(:,5)==B1(jj,2)& X1(:,6)==B1(jj,3));
%%indi1=find(p(jj,2)==X1(:,4)& p(jj,3)==X1(:,5)& p(jj,4)==X1(:,6));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
B2=X1(inficap,:);

D3=[B2(:,7) B1(:,1)];



D=[D1;D2;D3];

 
end
