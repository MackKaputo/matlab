function pit=lagrangian(X,D,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,stdi, lamda,oreprd,wstprd,cutgrd,infi,k,t,delta,epsilon,itr)


orecon=(nx*ny*nz)*spgr;
mincon=(nx*ny*nz)*spgr;
%[P1]=bevcal_new(X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,stdi,2, lamda1,lamda2,orecon,wstcon,cutgrd);
[P1 P P2]=bevcal_lag(D3,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,stdi,lamda,orecon,mincon);
[G G1 Flowresult]=ultipit(P1,D,X,1,1,infi);

restl=prsntval(G1,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,t,1);
sp1=oreprd-restl(1);
sp2=wstprd-restl(2);
sp=abs(sp1)+abs(sp2);
Phi_p=Flowresult{1}+((lamda1*oreprd)+(lamda2*wstprd))/stdi;
itrt=1;
Phi_p0=0;
roh=1.2;
diff_Phi_p=abs(Phi_p-Phi_p0);

while (sp<=delta || diff_Phi_p<=epsilon ||itrt<=itr)
    %tp=(roh*(Phi_p-Phi_p0))/(sp1^2+sp2^2);
    tp=0.00000005;
    lamda1=max(0,(lamda1-tp*sp1));
    lamda2=max(0,(lamda2-tp*sp2));
    [P1]=bevcal_new(X,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,stdi,2, lamda1,lamda2,orecon,wstcon,cutgrd);
    [G G1 Flowresult]=ultipit(P1,D,X,1,1,infi);
    Phi_p0=Phi_p;
    restl=prsntval(G1,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,t,cutgrd,1);
    sp1=oreprd-restl(1);
    sp2=wstprd-restl(2);
    sp=abs(sp1)+abs(sp2);
    Phi_p=Flowresult{1}+((lamda1*oreprd)+(lamda2*wstprd))/stdi;
    diff_Phi_p=(Phi_p-Phi_p0);
    roh=roh/2;
    itrt=itrt+1;
end
pit=G1;
    