function p=Regrid1(pushback10yr,dx,dy,dz,value,xmin,ymin,zmin,xmax,ymax,zmax)

%xmin=min(pushback10yr(:,1));
%ymin=min(pushback10yr(:,2));
%zmin=min(pushback10yr(:,3));                      
%xmax=max(pushback10yr(:,1));
%ymax=max(pushback10yr(:,2));
%zmax=max(pushback10yr(:,3));
[m,n]=size(pushback10yr);

A=grille3d(xmin,xmax,dx,ymin,ymax,dy,zmin,zmax,dz);

A=[A value*ones(length(A),n-3) ];
clear indicap indi
indicap=[];
for i=1:length(pushback10yr(:,1))
    indi=find(A(:,1)==pushback10yr(i,1)& A(:,2)==pushback10yr(i,2)& A(:,3)==pushback10yr(i,3));
    indicap=[indicap;indi];
end
A(indicap,4:end)=pushback10yr(:,4:end);


%save pushbackregrid1.dat A -ASCII;
p=A;