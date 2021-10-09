function F=coneall(X,dx,dy,dz)
%mix=min(X(:,1));
%miy=min(X(:,2));
%miz=min(X(:,3));

%mxx=max(X(:,1));
%mxy=max(X(:,2));
%mxz=max(X(:,3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F=[];
hhh=waitbar(0,['Computing time ']);
for i=1:length(X)
    waitbar(i/length(X),hhh)
        D=cone(X,X(i,1),X(i,2),X(i,3),dx,dy,dz);
        F=[F;D];
end
close(hhh)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%F=[];
%for z=miz %:dz:mxz
%    for y=miy:dy:mxy
%        for x=mix:dx:mxx
%            D=cone(X,Y,x,y,z,dx,dy,dz);
%            F=[F;D];
%        end
%    end
%end

