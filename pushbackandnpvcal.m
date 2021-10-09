
cutgr=.3;
num=1;
D1=D_5;
P3=P5;
K3=K5;
prtrg=7500000;
[G1styr S]=stcmincutpush(P3,D1,K3,0.005, dellam, prtrg,infi,cutgr,num,nx,ny,nz, spgr);

prtrg=7500000*2;
[G2ndyr S]=stcmincutpush(P3,D1,K3,0.005, dellam, prtrg,infi,cutgr,num,nx,ny,nz, spgr);

prtrg=7500000*3;
[G3rdyr S]=stcmincutpush(P3,D1,K3,0.005, dellam, prtrg,infi,cutgr,num,nx,ny,nz, spgr);
prtrg=7500000*4;
[G4thyr S]=stcmincutpush(P3,D1,K3,0.005, dellam, prtrg,infi,cutgr,num,nx,ny,nz, spgr);

prtrg=7500000*5;
[G5thyr S]=stcmincutpush(P3,D1,K3,0.005, dellam, prtrg,infi,cutgr,num,nx,ny,nz, spgr);

prtrg=7500000*6;
[G6thyr S]=stcmincutpush(P3,D1,K3,0.005, dellam, prtrg,infi,cutgr,num,nx,ny,nz, spgr);

prtrg=7500000*7;
[G7thyr S]=stcmincutpush(P3,D1,K3,0.005, dellam, prtrg,infi,cutgr,num,nx,ny,nz, spgr);

prtrg=7500000*8;
[G8thyr S]=stcmincutpush(P3,D1,K3,0.005, dellam, prtrg,infi,cutgr,num,nx,ny,nz, spgr);

ind=com_blk(G1styr,G2ndyr);
onlyG1styr=G1styr;
onlyG2ndyr=G2ndyr;
onlyG2ndyr(ind,:)=[];
ind=com_blk(G2ndyr, G3rdyr);
onlyG3rdyr=G3rdyr;
onlyG3rdyr(ind,:)=[];
ind=com_blk(G3rdyr, G4thyr);
onlyG4thyr=G4thyr;
onlyG4thyr(ind,:)=[];

ind=com_blk(G4thyr, G5thyr);
onlyG5thyr=G5thyr;
onlyG5thyr(ind,:)=[];

ind=com_blk(G5thyr, G6thyr);
onlyG6thyr=G6thyr;
onlyG6thyr(ind,:)=[];

ind=com_blk(G6thyr, G7thyr);
onlyG7thyr=G7thyr;
onlyG7thyr(ind,:)=[];

ind=com_blk(G7thyr, G8thyr);
onlyG8thyr=G8thyr;
onlyG8thyr(ind,:)=[];

NPVonlyG1st=prsntval(onlyG1styr,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,1,cutgr);
NPVonlyG2nd=prsntval(onlyG2ndyr,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,2,cutgr);
NPVonlyG3rd=prsntval(onlyG3rdyr,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,3,cutgr);
NPVonlyG4th=prsntval(onlyG4thyr,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,4,cutgr);

NPVonlyG5th=prsntval(onlyG5thyr,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,5,cutgr);
NPVonlyG6th=prsntval(onlyG6thyr,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,6,cutgr);
NPVonlyG7th=prsntval(onlyG7thyr,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,7,cutgr);
NPVonlyG8th=prsntval(onlyG8thyr,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,8,cutgr);

pushback=[];
pushback=[pushback;onlyG1styr(:,1:3) ones(length(onlyG1styr(:,1)),1) ones(length(onlyG1styr(:,1)),1)];
pushback=[pushback;onlyG2ndyr(:,1:3) 2*ones(length(onlyG2ndyr(:,1)),1) ones(length(onlyG2ndyr(:,1)),1)];
pushback=[pushback;onlyG3rdyr(:,1:3) 3*ones(length(onlyG3rdyr(:,1)),1) ones(length(onlyG3rdyr(:,1)),1)];
pushback=[pushback;onlyG4thyr(:,1:3) 4*ones(length(onlyG4thyr(:,1)),1) ones(length(onlyG4thyr(:,1)),1)];
pushback=[pushback;onlyG5thyr(:,1:3) 5*ones(length(onlyG5thyr(:,1)),1) ones(length(onlyG5thyr(:,1)),1)];
pushback=[pushback;onlyG6thyr(:,1:3) 6*ones(length(onlyG6thyr(:,1)),1) ones(length(onlyG6thyr(:,1)),1)];
pushback=[pushback;onlyG7thyr(:,1:3) 7*ones(length(onlyG7thyr(:,1)),1) ones(length(onlyG7thyr(:,1)),1)];
pushback=[pushback;onlyG8thyr(:,1:3) 8*ones(length(onlyG8thyr(:,1)),1) ones(length(onlyG8thyr(:,1)),1)];


ind=com_blk(pushback, K3);
outsidepit=K3;
outsidepit(ind,:)=[];
outsidepit=[outsidepit(:,1:3) 9*ones(length(outsidepit(:,1)),1) 2*ones(length(outsidepit(:,1)),1)];

pitgraph=[pushback;outsidepit];

gridpitgraph=Regrid(pitgraph,20,20,10,-999);

Y1=gridpitgraphe;
Y1=sortrows(Y1,[2 1 -3]);
Z4=reshape(Z1(:,4),36,99,64);
Z5=reshape(Z1(:,5),36,99,64);

for i=1:length(Y1(:,1))
    if Y1(i,4)==-999
        Y1(i,4)=9;
    end
end

Z1=gridpitgraphs;
Z1=sortrows(Z1,[2 1 -3]);
for i=1:length(Z1(:,1))
    if Z1(i,4)==-999
        Z1(i,4)=9;
    end
end

Z5=reshape(Z1(:,5),36,99,64);
Y5=reshape(Y1(:,5),36,99,64);

Z4=reshape(Z1(:,4),36,99,64);
Y4=reshape(Y1(:,4),36,99,64);

X=[Z1(:,5) Y1(:,5)];

for i=1:length(X(:,1))
    if X(i,1)==X(i,2)
        X(i,3)=1;
    else
        X(i,3)=0;
    end
end

X1=reshape(X(:,3),36,99,64);
