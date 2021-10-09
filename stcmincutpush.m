function [G1 S]=stcmincutpush(P2,D,K3,lamda, dellam, prtrg,infi,cutgrd,num,nx,ny,nz, spgr)



S=0;

while (S<prtrg && lamda<=1)
[G G1 Flowresult]=ultipit(P2,D,K3, lamda,infi);

if(~isempty(G1))
[m n]=size(G1);
%G3=[];
for l=1:num
for i=1:length(G1(:,1))
    %G1(i,n+1)=sum(G1(i,7:num+6))/num;
        if G1(i,6+l)>=cutgrd
        %G2(i)=G1(i,7)*(nx*ny*nz)*(spgr*rec);
        G2(i)=(nx*ny*nz)*spgr;
    else G2(i)=0;
    end
end
G1=[G1 G2'];
clear G2;
end

S=mean(sum(G1(:,6+num+1:end)));
end
lamda=lamda+dellam;
end