function [M]=prodsched(X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,conesize,lamda,dellam,infi,prtrg)

M=[];
T=prtrg+1;

while (T>prtrg)
[X G1 G3]=huisc(X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,conesize,lamda,dellam,infi,prtrg);
M={M,G3};
T=sum(G3(:,8));
end

M={M,X};
