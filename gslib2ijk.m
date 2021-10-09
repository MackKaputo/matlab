function S=gslib2ijk(X,dx,dy,dz,flag)
%load 20_sim.dat;
xmin=min(X(:,1));
ymin=min(X(:,2));
zmin=min(X(:,3));  

if flag==1
K=[];
for i=1:length(X(:,1))
if X(i,4)~=-999
K=[K;X(i,:)];
end
end
else
    K=X;
end
C=K;
c=[];
for i =1:length(C(:,1))
    c1=[(((C(i,1)-xmin)/dx)+1) (((C(i,2)-ymin)/dy)+1) (((C(i,3)-zmin)/dz)+1) C(i,4:end)];
    c=[c;c1];
end
S=c;