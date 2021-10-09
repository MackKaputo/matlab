function fnt1=front(G1,nx,ny,nz)

fnt1=[];
for j=1:length(G1(:,1))
    X1=[G1(j,1)-nx G1(j,2)-ny G1(j,3)-nz G1(j,1) G1(j,2)-ny G1(j,3)-nz  G1(j,1)+nx G1(j,2)-ny G1(j,3)-nz G1(j,1)-nx G1(j,2) G1(j,3)-nz G1(j,1) G1(j,2) G1(j,3)-nz G1(j,1)+nx G1(j,2) G1(j,3)-nz G1(j,1)-nx G1(j,2)+ny G1(j,3)-nz G1(j,1) G1(j,2)+ny G1(j,3)-nz G1(j,1)+nx G1(j,2)+ny G1(j,3)-nz];
X1=reshape(X1,3,9)';
ind1=[];
   for k=1:9
   ind=find((X1(k,1)==G1(:,1))& (X1(k,2)==G1(:,2)) & (X1(k,3)==G1(:,3)));
   ind1=[ind1 ind];
   warning off;
   end
    if (isempty(ind1)==1)
        fnt=G1(j,:);
        fnt1=[fnt1;fnt];
    end
    
end