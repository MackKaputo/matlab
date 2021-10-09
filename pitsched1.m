function [Y, Z, extr_bl,extr_wstbl,nonpit]=pitsched1(x,s,prod,dx,dy,dz)
% This program will provide yearly extraction sequence.
% It takes following input files
% x is data file with x, y, z cordinate with pushback sequennce
% forth column will be column for push back
% it will be like 1 2 3 or -999 if a block a not going to extract from the
% deposit.
% s is number of pushbacks.
%bencht is bench height i.e. increment in z direction.
%prod is annual production target
%x=rand(256,256);
%x=reshape(x,numel(x),1);
%grid=grille2d(1,1,256,1,1,256);
%x1=[grid x];
% Rows are sorted for deleting the non extractable blocks (-999) and creat
% seperate file for each push back.
x=sortrows(x,4);

for i=1:s
    push=[];
    for j=1:length(x)
        if x(j,4)==(s-i+1)
            ps=x(j,:);
            push=[push;ps];
        end
   end
    eval(['x',num2str(i),'=push;']);
end

nonpit=[];
for i=1:length(x)
    if x(i,4)==-999
        nonpit=[nonpit;x(i,:)];
    end
end

extr_bl=[];
extr_wstbl=[];
Y=[];
Z=[];
maxid=0;
for j=1:1
eval(['p1','=x',num2str(j),';']);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y1=[];
for i=1:length(p1)
if p1(i,5)~=9600
    y1=[y1;p1(i,:)];
end
end
z1=[];
for i=1:length(p1)
if p1(i,5)==9600
    z1=[z1;p1(i,:)];
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if length(y1)>prod
maxz=max(y1(:,3));
yl=[];
for i=1:length(y1)
if y1(i,3)==maxz
yk=y1(i,:);
yl=[yl;yk];
end
end
minx=min(yl(:,1));
miny=min(yl(:,2));
end
Dis=[];
for i=1:1:length(y1)
        dist=sqrt((y1(i,1)-minx).^2+(y1(i,2)-miny).^2+2*(y1(i,3)-maxz).^2);
       Dis=[Dis;dist];
end

y2=[y1 Dis];
y3=sortrows(y2,5);
%y3=sortrows(y2,6);
y3=[extr_bl;y3];

%%%%%%%%%%%%%%%%%%%%%%%%%%%
z1=[extr_wstbl;z1];

%y4=y3;
%y5=[];
%for i=1:prod:length(y3)
%if length(y4)>prod
%  y6=y4(1:prod,:);
%   y5=[y5 y6];
%   y4=y4(prod+1:end,:);
%else extr_bl=y4;
%end

n1=length(y3)-prod*ceil((length(y3)/prod)-1);
y4=y3(1:length(y3)-n1,:);
id=zeros(length(y4),1);
k=1;
for i=1:prod:length(y4)
id(i:(i+prod-1),:)=k;
k=k+1;
end
for i=1:length(id)
    id(i)=id(i)+maxid;
end
y5=[y4 id];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z2=z1;
B=[];
for t=1:prod:length(y5)
ys=y5(t:(t+prod-1),:);
F=coneall(ys,dx,dy,dz);


inficap=[];
%%inficap1=[];
hhh=waitbar(0,['Computing time ']);
for jj=1:length(F)
    waitbar(jj/length(F),hhh)
indi=find(z2(:,1)==F(jj,1)& z2(:,2)==F(jj,2)& z2(:,3)==F(jj,3));
%%indi1=find(p(jj,2)==X1(:,1)& p(jj,3)==X1(:,2)& p(jj,4)==X1(:,3));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
close(hhh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u=sort(inficap);
u1 = hist(u,[min(u):max(u)]);
u2=min(u):max(u);
u3=[u1' u2'];
u4=sortrows(u3,1);
u5=[];
for i=1:length(u4)
if u4(i,1)>0
u5=[u5;u4(i,:)];
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B1=z2(u5(:,2),:);
B1=[B1 y5(t,7)*ones(length(B1(:,1)),1)];

B=[B;B1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%if ~isempty(z2)
m=[];
for i=1:length(z2)
    m1=i;
    m=[m;m1];
end

m2=[];
for i=1:length(m)
if m(i)~=inficap(:)
    m2=[m2;m(i)];
end
end
z2=z2(m2,:);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Z=[Z;B];
maxid=max(id);
extr_bl=y3(length(y4)+1:end,:);
extr_wstbl=z2;
Y=[Y;y5];
end
