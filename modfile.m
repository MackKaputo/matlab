function K=modfile(C,dx,dy,dz,cutgrd,parcnum,MCAF, PCAF,spgr)

xmin=min(C(:,1));
ymin=min(C(:,2));
zmin=min(C(:,3));                      
%xmax=max(C(:,1));
%ymax=max(C(:,2));
%zmax=max(C(:,3));
C=C1;
c=[];
for i =1:length(C(:,1))
    c1=[(((C(i,1)-xmin)/dx)+1) (((C(i,2)-ymin)/dy)+1) (((C(i,3)-zmin)/dz)+1) C(i,:)];
    c=[c;c1];
end
ton=(dx*dy*dz*spgr);

if length(parcnum(:,1))==1
c1=[];
for i=1:length(C(:,1))
    %if C(i,4)>=cutgrd
        c2=[c(i,:) 1 MCAF PCAF ton; c(i,:) 1 ton (C(i,4)*ton)/100 nan];
        c1=[c1; c2];
end
%K=sortrows(c,[3,2,1]);




