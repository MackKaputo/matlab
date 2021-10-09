function z=addyr(Y, extr_bl)
[k,m]=size(Y);

maxyr=max(Y(:,m));
prd=k/maxyr;
if length(extr_bl)>(prd/2)
   k=[extr_bl (maxyr+1)*ones(length(extr_bl),1)];
else k=[extr_bl (maxyr)*ones(length(extr_bl),1)];
end
z=[Y;k];