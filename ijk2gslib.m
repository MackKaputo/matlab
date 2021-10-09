function S=ijk2gslib(X,minx,miny,minz, dx,dy,dz)
%load 20_sim.dat;



c=[];
for i =1:length(X(:,1))
    c1=[(X(i,1)-1)*dx+minx (X(i,2)-1)*dy+miny (X(i,3)-1)*dz+minz X(i,4:end)];
    %c1=[(((C(i,1)-xmin)/dx)+1) (((C(i,2)-ymin)/dy)+1) (((C(i,3)-zmin)/dz)+1) C(i,:)];
    c=[c;c1];
end
S=c;