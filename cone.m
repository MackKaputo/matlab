function D=cone(X, x,y,z,dx,dy,dz)

%MINX=min(X(:,1));
%MAXX=max(X(:,1));

%MINY=min(X(:,2));
%MAXY=max(X(:,2));

MAXZ=max(X(:,3));

%MINX1=min(Y(:,1));
%MAXX1=max(Y(:,1));

%MINY1=min(Y(:,2));
%MAXY1=max(Y(:,2));



int=(MAXZ-z)/dz;

minx=x-int*dx;
maxx=x+int*dx;
miny=y-int*dy;
maxy=y+int*dy;
c=[];


    for i=MAXZ-dz:-dz:z
        for k=miny:dy:maxy
        for j=minx:dx:maxx
            
            c1=[j,k,i+dz];
            c=[c;c1];
        end
        end
     miny=miny+dy;
     maxy=maxy-dy;  
     minx=minx+dx;
     maxx=maxx-dx;
    end
%c2=[];
%if isempty(c)==0
%for i=1:length(c)
%if (c(i,1)>=MINX1)&&(c(i,1)<=MAXX1)&&(c(i,2)>=MINY1)&&(c(i,2)<=MAXY1)
%c2=[c2;c(i,:)];
%end
%end
%end
%D=c2;
D=c;