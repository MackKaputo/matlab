function [D3 D4]=prepros(X,num,nx,ny,nz,flag)



    n=length(X(:,1))/num;

for i=0:num-1
    C=X((n*i)+1:n*(i+1),1:4);
    eval(['C',num2str(i+1),'=C;'])
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W=C(:,1:3);
for j=1:num
   eval(['C=C',num2str(j),';'])
W=[W C(:,4)];
end
if flag==1
D4=Regrid(W,nx,ny,nz,0);
else
    D4=W;
end
D3=W;